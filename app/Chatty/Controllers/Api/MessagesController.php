<?php

namespace App\Chatty\Controllers\Api;

use App\Http\Controllers\Chatify\Api\JSON;

use App\Http\Controllers\Controller;
use App\Models\Account;
use App\Models\Account as User;
use App\Chatty\Models\ChFavorite as Favorite;
use App\Chatty\Models\ChMessage as Message;
use App\Chatty\Facades\ChattyMessenger as Chatty;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Str;


class MessagesController extends Controller
{
    protected $perPage = 30;

    /**
     * Authinticate the connection for pusher
     *
     * @param Request $request
     * @return void
     */
    public function pusherAuth(Request $request)
    {

        // Auth data
        $authData = json_encode([
            'user_id' => Auth::user()->id,
            'user_info' => [
                'name' => Auth::user()->name
            ]
        ]);
        // return $authData;
        // check if user authorized
        if (Auth::check()) {
            return Chatty::pusherAuth(
                $request['channel_name'],
                $request['socket_id'],
                $authData
            );
        }
        // if not authorized
        return response()->json(['message' => 'Unauthorized'], 401);
    }

    /**
     * Fetch data by id for (user/group)
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function idFetchData(Request $request)
    {

        // Favorite
        $favorite = Chatty::inFavorite($request['id']);

        // User data
        if ($request['type'] == 'user') {
            $fetch = User::where('id', $request['id'])->first();
            if ($fetch) {
                $userAvatar = Chatty::getUserWithAvatar($fetch)->avatar;
            }
        }

        // send the response
        return Response::json([
            'favorite' => $favorite,
            'fetch' => $fetch ?? [],
            'user_avatar' => $userAvatar ?? null,
        ]);
    }

    /**
     * This method to make a links for the attachments
     * to be downloadable.
     *
     * @param string $fileName
     * @return \Illuminate\Http\JsonResponse
     */
    public function download($fileName)
    {
        $path = config('chatify.attachments.folder') . '/' . $fileName;
        if (Chatty::storage()->exists($path)) {
            return response()->json([
                'file_name' => $fileName,
                'download_path' => Chatty::storage()->url($path)
            ], 200);
        } else {
            return response()->json([
                'message' => "Sorry, File does not exist in our server or may have been deleted!"
            ], 404);
        }
    }

    /**
     * Send a message to database
     *
     * @param Request $request
     * @return JSON response
     */
    public function send(Request $request)
    {
        // default variables
        $error = (object)[
            'status' => 0,
            'message' => null
        ];
        $attachment = null;
        $attachment_title = null;

        $type = 'normal';

        Chatty::makeSeen(Auth::id());

        // if there is attachment [file]
        if ($request->hasFile('file')) {
            // allowed extensions
            $allowed_images = Chatty::getAllowedImages();
            $allowed_files = Chatty::getAllowedFiles();
            $allowed = array_merge($allowed_images, $allowed_files);

            $file = $request->file('file');
            // check file size
            if ($file->getSize() < Chatty::getMaxUploadSize()) {
                if (in_array(strtolower($file->getClientOriginalExtension()), $allowed)) {
                    // get attachment name
                    $attachment_title = $file->getClientOriginalName();
                    // upload attachment and store the new name
                    $attachment = Str::uuid() . "." . $file->getClientOriginalExtension();
                    $clientfolder = $request['id'] . '-' . auth()->id();
                    $attachment = date('Y-m-d') . '/' . $clientfolder . '/' . $attachment;

                    $file->storeAs(config('chatify.attachments.folder'), $attachment, config('chatify.storage_disk_name'));
                } else {
                    $error->status = 1;
                    $error->message = "File extension not allowed!";
                }
            } else {
                $error->status = 1;
                $error->message = "File size you are trying to upload is too large!";
            }
        }

        if (!$error->status) {
            // send to database
            $agent_id = Chatty::getAvailableAgent();
            $agent_id = 0;
            $user = Auth::user();
            $prevMessages = Message::where(function ($q) use ($user) {
                $q->where('from_id', $user->id)->orWhere('to_id', $user->id);
            })->get();

            if (count($prevMessages) == 0) {
                $type = 'first';
            }
            if (count($prevMessages) == 1) {
                $m = $prevMessages[0];
                $another = $m->to_id;
                if ($another <= 0) {
                    $type = 'first';
                } else {
                    $agent_id = $m->to_id;
                }
            }

            $messageID = mt_rand(9, 999999999) + time();
            Chatty::newMessage([
                'id' => $messageID,
                'type' => $request['type'],
                'from_id' => Auth::user()->id,
                // 'to_id' => $request['id'],
                'to_id' => $agent_id,
                'body' => htmlentities(trim($request['message']), ENT_QUOTES, 'UTF-8'),
                'attachment' => ($attachment) ? json_encode((object)[
                    'new_name' => $attachment,
                    'old_name' => htmlentities(trim($attachment_title), ENT_QUOTES, 'UTF-8'),
                ]) : null,
            ]);


            $old_agent = $user->agent_id;
            if ($old_agent != $agent_id) {
                Chatty::push('private-chatify', 'contact-transform-to-agent', [
                    'to_id' => $agent_id,
                ]);
                $user->agent_id = $agent_id;
                $user->save();
            }

            // fetch message to send it with the response
            $messageData = Chatty::fetchMessage($messageID);


            if ($type == 'first') {
                $availableAgents = Account::where([
                    'user_type' => 'agent',
                    'is_active' => 'active',
                    'active_status' => 1
                ])
                    ->select('name', 'id')->get();
                foreach ($availableAgents as $agent) {
                    // send to all users available using pusher

                    Chatty::push('private-chatify', "client-contactItem", [
                        'update_to' => $user->id,
                        'update_for' => $agent->id,
                        'updating' => true,
                    ]);

                }
            } else {
                // send to user using pusher
                Chatty::push('private-chatify', 'messaging', [
                    'from_id' => Auth::user()->id,
                    'to_id' => $agent_id,
                    'message' => Chatty::messageCard($messageData, 'default')
                ]);
            }
        }

        // send the response
        return Response::json([
            'status' => '200',
            'error' => $error,
            'message' => $messageData ?? [],
            'tempID' => $request['temporaryMsgId'],
        ]);
    }

    /**
     * fetch [user/group] messages from database
     *
     * @param Request $request
     * @return JSON response
     */
    public function fetch(Request $request)
    {
        // $user_id = $request['id'];
        $user_id = Auth::id();

        Chatty::makeSeen(Auth::id());

        $query = Chatty::fetchMessagesQuery($user_id)->latest();

        $messages = $query->paginate($request->per_page ?? $this->perPage);

        $totalMessages = $messages->total();
        $lastPage = $messages->lastPage();

        $response = [
            'total' => $totalMessages,
            'last_page' => $lastPage,
            'last_message_id' => collect($messages->items())->last()->id ?? null,
            'messages' => $messages->items(),
            'delete_messages' => config('chatify.delete_messages')
        ];
        return Response::json($response);
    }

    /**
     * Make messages as seen
     *
     * @param Request $request
     * @return void
     */
    public function seen(Request $request)
    {
        // make as seen
        $seen = Chatty::makeSeen($request['id']);
        // send the response
        return Response::json([
            'status' => true,
            'message' => 'DONE!'
        ]);
    }

    /**
     * Get contacts list
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse response
     */
    public function getContacts(Request $request)
    {
        $usersTable = config('chatify.usersTable');
        // get all users that received/sent message from/to [Auth user]
        $users = Message::join('users', function ($join) use ($usersTable) {
            $join->on('ch_messages.from_id', '=', $usersTable . '.id')
                ->orOn('ch_messages.to_id', '=', $usersTable . '.id');
        })
            ->where(function ($q) {
                $q->where('ch_messages.from_id', Auth::user()->id)
                    ->orWhere('ch_messages.to_id', Auth::user()->id);
            })
            ->where($usersTable . '.id', '!=', Auth::user()->id)
            ->select($usersTable . '.*', DB::raw('MAX(ch_messages.created_at) max_created_at'))
            ->orderBy('max_created_at', 'desc')
            ->groupBy($usersTable . '.id')
            ->paginate($request->per_page ?? $this->perPage);

        return response()->json([
            'contacts' => $users->items(),
            'total' => $users->total() ?? 0,
            'last_page' => $users->lastPage() ?? 1,
        ], 200);
    }

    /**
     * Put a user in the favorites list
     *
     * @param Request $request
     * @return void
     */
    public function favorite(Request $request)
    {
        // check action [star/unstar]
        if (Chatty::inFavorite($request['user_id'])) {
            // UnStar
            Chatty::makeInFavorite($request['user_id'], 0);
            $status = 0;
        } else {
            // Star
            Chatty::makeInFavorite($request['user_id'], 1);
            $status = 1;
        }

        // send the response
        return Response::json([
            'status' => @$status,
        ], 200);
    }

    /**
     * Get favorites list
     *
     * @param Request $request
     * @return void
     */
    public function getFavorites(Request $request)
    {
        $favorites = Favorite::where('user_id', Auth::user()->id)->get();
        foreach ($favorites as $favorite) {
            $favorite->user = User::where('id', $favorite->favorite_id)->first();
        }
        return Response::json([
            'total' => count($favorites),
            'favorites' => $favorites ?? [],
        ], 200);
    }

    /**
     * Search in messenger
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function search(Request $request)
    {
        $input = trim(filter_var($request['input']));
        $records = User::where('id', '!=', Auth::user()->id)
            ->where('name', 'LIKE', "%{$input}%")
            ->paginate($request->per_page ?? $this->perPage);

        foreach ($records->items() as $index => $record) {
            $records[$index] += Chatty::getUserWithAvatar($record);
        }

        return Response::json([
            'records' => $records->items(),
            'total' => $records->total(),
            'last_page' => $records->lastPage()
        ], 200);
    }

    /**
     * Get shared photos
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function sharedPhotos(Request $request)
    {
        $images = Chatty::getSharedPhotos($request['user_id']);

        foreach ($images as $image) {
            $image = asset(config('chatify.attachments.folder') . $image);
        }
        // send the response
        return Response::json([
            'shared' => $images ?? [],
        ], 200);
    }

    /**
     * Delete conversation
     *
     * @param Request $request
     * @return void
     */
    public function deleteConversation(Request $request)
    {
        // delete
        $delete = Chatty::deleteConversation($request['id']);

        // send the response
        return Response::json([
            'deleted' => $delete ? 1 : 0,
        ], 200);
    }

    public function updateSettings(Request $request)
    {
        $msg = null;
        $error = $success = 0;

        // dark mode
        if ($request['dark_mode']) {
            $request['dark_mode'] == "dark"
                ? User::where('id', Auth::user()->id)->update(['dark_mode' => 1])  // Make Dark
                : User::where('id', Auth::user()->id)->update(['dark_mode' => 0]); // Make Light
        }

        // If messenger color selected
        if ($request['messengerColor']) {
            $messenger_color = trim(filter_var($request['messengerColor']));
            User::where('id', Auth::user()->id)
                ->update(['messenger_color' => $messenger_color]);
        }
        // if there is a [file]
        if ($request->hasFile('avatar')) {
            // allowed extensions
            $allowed_images = Chatty::getAllowedImages();

            $file = $request->file('avatar');
            // check file size
            if ($file->getSize() < Chatty::getMaxUploadSize()) {
                if (in_array(strtolower($file->getClientOriginalExtension()), $allowed_images)) {
                    // delete the older one
                    if (Auth::user()->avatar != config('chatify.user_avatar.default')) {
                        $path = Chatty::getUserAvatarUrl(Auth::user()->avatar);
                        if (Chatty::storage()->exists($path)) {
                            Chatty::storage()->delete($path);
                        }
                    }
                    // upload
                    $avatar = Str::uuid() . "." . $file->getClientOriginalExtension();
                    $update = User::where('id', Auth::user()->id)->update(['avatar' => $avatar]);
                    $file->storeAs(config('chatify.user_avatar.folder'), $avatar, config('chatify.storage_disk_name'));
                    $success = $update ? 1 : 0;
                } else {
                    $msg = "File extension not allowed!";
                    $error = 1;
                }
            } else {
                $msg = "File size you are trying to upload is too large!";
                $error = 1;
            }
        }

        // send the response
        return Response::json([
            'status' => $success ? 1 : 0,
            'error' => $error ? 1 : 0,
            'message' => $error ? $msg : 0,
        ], 200);
    }

    /**
     * Set user's active status
     *
     * @param Request $request
     * @return void
     */
    public function setActiveStatus(Request $request)
    {
        $update = $request['status'] > 0
            ? User::where('id', $request['user_id'])->update(['active_status' => 1])
            : User::where('id', $request['user_id'])->update(['active_status' => 0]);
        // send the response
        return Response::json([
            'status' => $update,
        ], 200);
    }

    public function getFileType($fileString)
    {
        $images = ['png', 'jpg', 'jpeg', 'gif'];
        $docs = ['doc', 'docx', 'xml', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'odt', 'pdf', 'zip', 'rar', '7z'];
        $videos = ['mp4', 'mp3', 'mkv'];
        $audio = ['mp3', 'wave', 'm4a'];

        $fileString = Str::lower($fileString);

        $isImage = Str::contains($fileString, $images);
        if ($isImage) {
            return 'image';
        }
        $isVideo = Str::contains($fileString, $videos);
        if ($isVideo) {
            return 'video';
        }
        $isAudio = Str::contains($fileString, $audio);
        if ($isAudio) {
            return 'audio';
        }
        $isDoc = Str::contains($fileString, $docs);
        if ($isDoc) {
            return 'file';
        }
        return 'text';
    }

    public function rateChat(Request $request)
    {
        $rate = $request->rate;
        $notes = $request->notes;
        $lastMessage = Message::where('type', 'end')->where('end_type', 'end_chat')->where(function ($w) {
            $w->where('to_id', Auth::user()->id ?? 0)->orWhere('from_id', Auth::user()->id ?? 0);
        })->latest()->first();
        if ($lastMessage) {
            $lastMessage->rate = $rate ?? 0;
            $lastMessage->notes = $notes ?? '';
            $lastMessage->save();
        }
        Chatty::push('private-chatify', 'rate-chat', [
            'contact_id' => Auth::user()->id,
        ]);
        return response()->json([
            'status' => true
        ]);
    }

    public function getUnreadMessagesCount(Request $request)
    {
        $count = Chatty::countUnseenMessagesApi();
        return response()->json([
            'status' => true,
            'count' => $count
        ]);
    }

    public function getNotifications()
    {
        $notifications = Auth()->user()->unreadNotifications()->latest()->paginate();

        foreach ($notifications as $note) {

            $title = optional($note->data)->title ?? 'محادثة الدعم الفني';
            $body = optional($note->data)->body ?? 'لديك رسالة جديدة';

            $zone = Auth()->user()->timezone;

            Carbon::setlocale('ar');

            $fulltimeOption = Carbon::parse($note->created_at)->timezone($zone);
            $fulltime = $fulltimeOption->format('Y-m-d h:i:s A');

            $fulltime_text = $fulltimeOption->diffForHumans();

//            unset($note['id']);
            unset($note['type']);
            unset($note['data']);
            unset($note['notifiable_id']);
            unset($note['notifiable_type']);
            unset($note['read_at']);
            unset($note['created_at']);
            unset($note['updated_at']);


            $note->title = $title;
            $note->body = $body;
            $note->created_time = $fulltime;
            $note->note_date = $fulltime_text;

        }
        return response()->json([
            'status' => true,
            'data' => $notifications
        ]);
    }


    public function readNotification(Request $request)
    {
        \DB::table('notifications')->where('id', $request->id)->update([
            'read_at' => now()
        ]);
        return response()->json([
            'status' => true,
            'message' => 'DONE!'
        ]);
    }
}
