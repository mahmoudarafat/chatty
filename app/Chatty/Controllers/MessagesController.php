<?php

namespace App\Chatty\Controllers;

use App\Chatty\Models\ChangeLog;
use App\Chatty\Models\ChFavorite as Favorite;
use App\Chatty\Models\ChMessage as Message;
use App\Http\Controllers\Controller;
use App\Http\Traits\HelperTrait;
use App\Models\Account;
use App\Models\Account as User;
use App\Chatty\Facades\ChattyMessenger as Chatty;
use App\Notifications\SupportNotification;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Request as FacadesRequest;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Str;

class MessagesController extends Controller
{
    use HelperTrait;

    protected $perPage = 30;
    protected $messengerFallbackColor = '#2180f3';

    /**
     * Authenticate the connection for pusher
     *
     * @param Request $request
     * @return JsonResponse
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
     * Returning the view of the app with the required data.
     *
     * @param int $id
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function index($id = null)
    {

        $routeName = FacadesRequest::route()->getName();
        $type = in_array($routeName, ['user', 'group'])
            ? $routeName
            : 'user';
//       dd(Auth::user());
        return view('chatty-views.pages.app', [
            'id' => $id ?? 0,
            'type' => $type ?? 'user',
            'messengerColor' => Auth::user()->messenger_color ?? $this->messengerFallbackColor,
            'dark_mode' => Auth::user()->dark_mode < 1 ? 'light' : 'dark',
        ]);
    }


    /**
     * Fetch data by id for (user/group)
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function idFetchData(Request $request)
    {
        // Favorite
        $favorite = Chatty::inFavorite($request['id']);

        // User data
        if ($request['type'] == 'user') {
            $user = new User();
            $user->makeHidden(['client', 'closed_tasks']);
            $fetch = User::with('client')->where('id', $request['id'])->first();

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
     * @return \Symfony\Component\HttpFoundation\StreamedResponse|void
     */
    public function download($fileName)
    {
        if (Chatty::storage()->exists(config('chatify.attachments.folder') . '/' . $fileName)) {
            return Chatty::storage()->download(config('chatify.attachments.folder') . '/' . $fileName);
        } else {
            return abort(404, "Sorry, File does not exist in our server or may have been deleted!");
        }
    }

    /**
     * Send a message to database
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function send(Request $request)
    {
//        dd($request->all());
        // default variables
        $error = (object)[
            'status' => 0,
            'message' => null
        ];
        $attachment = null;
        $attachment_title = null;

        // if there is attachment [file]
        if ($request->hasFile('file') || $request->hasFile('audio_data')) {
            // allowed extensions
            $allowed_images = Chatty::getAllowedImages();
            $allowed_files = Chatty::getAllowedFiles();
            $allowed = array_merge($allowed_images, $allowed_files);

            if ($request->hasFile('audio_data')) {
                $file = $request->file('audio_data');
            } else {
                $file = $request->file('file');
            }

            // check file size
            if ($file->getSize() < Chatty::getMaxUploadSize()) {
                if (in_array(strtolower($file->getClientOriginalExtension()), $allowed)) {
                    // get attachment name
                    $attachment_title = $file->getClientOriginalName();
                    // upload attachment and store the new name
                    $attachment = Str::uuid() . "." . $file->getClientOriginalExtension();
                    $clientfolder = auth()->id() . '-' . $request['id'];
                    $attachment = date('Y-m-d') . '/' . $clientfolder . '/' . $attachment;

                    $file->storeAs(config('chatify.attachments.folder'), $attachment, config('chatify.storage_disk_name'));
//                    $file->storeAs(config('chatify.attachments.folder'), $attachment, config('chatify.storage_disk_name'));
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
            $messageID = mt_rand(9, 999999999) + time();
            Chatty::newMessage([
                'id' => $messageID,
                'type' => $request['type'],
                'from_id' => Auth::user()->id,
                'to_id' => $request['id'],
                'body' => htmlentities(trim($request['message']), ENT_QUOTES, 'UTF-8'),
                'attachment' => ($attachment) ? json_encode((object)[
                    'new_name' => $attachment,
                    'old_name' => htmlentities(trim($attachment_title), ENT_QUOTES, 'UTF-8'),
                ]) : null,
            ]);

            \DB::table('ch_messages')->where('from_id', $request['id'])->where('to_id', 0)->update([
                'to_id' => auth()->id()
            ]);

            // fetch message to send it with the response
            $messageData = Chatty::fetchMessage($messageID);
            $theMsg = Message::where('id', $messageID)->first();
            $theMsg = $theMsg->toArray();
            $theMsg['sender_type'] = 'default';
//dd($theMsg);
            $msg_data = [
                'from_id' => Auth::user()->id,
                'to_id' => $request['id'],
                'message' => $theMsg
                //                'message' => Chatty::messageCard($messageData, 'default')
            ];
            $client = Account::find($request['id']);

            if ($client) {

                if ($client->active_status) {
                    // send to user using pusher
                    Chatty::push('private-chatify', 'messaging', $msg_data);
                } else {
                    $title = 'New Message';
                    $body = $theMsg['body'];

                    $tokens = $client->playerIds->pluck('player_id')->toArray();

                    $data = [
                        'title' => $title,
                        'body' => $body
                    ];

                    $client->notify(new SupportNotification($data));

                    $this->notifyByFirebase($title, $body, $tokens, $msg_data);

                }
            }
        }

        // send the response
        return Response::json([
            'status' => '200',
            'error' => $error,
            'message' => Chatty::messageCard(@$messageData),
            'tempID' => $request['temporaryMsgId'],
        ]);
    }

    /**
     * fetch [user/group] messages from database
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function fetch(Request $request)
    {
        $query = Chatty::fetchMessagesQuery($request['id'])->latest();
        $messages = $query->paginate($request->per_page ?? $this->perPage);


        $totalMessages = $messages->total();
        $lastPage = $messages->lastPage();
        $response = [
            'total' => $totalMessages,
            'last_page' => $lastPage,
            'last_message_id' => collect($messages->items())->last()->id ?? null,
            'messages' => '',
        ];

        // if there is no messages yet.
        if ($totalMessages < 1) {
            $response['messages'] = '<p class="message-hint center-el"><span>Say \'hi\' and start messaging</span></p>';
            return Response::json($response);
        }
        if (count($messages->items()) < 1) {
            $response['messages'] = '';
            return Response::json($response);
        }
        $allMessages = null;
        foreach ($messages->reverse() as $index => $message) {
            $allMessages .= Chatty::messageCard(
                Chatty::fetchMessage($message->id, $index)
            );
        }
        $response['messages'] = $allMessages;
        return Response::json($response);
    }

    /**
     * Make messages as seen
     *
     * @param Request $request
     * @return JsonResponse|void
     */
    public function seen(Request $request)
    {
        // make as seen
        $seen = Chatty::makeSeen($request['id']);
        // send the response
        return Response::json([
            'status' => $seen,
        ], 200);
    }

    /**
     * Get contacts list
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function getContacts(Request $request)
    {

        // get all users that received/sent message from/to [Auth user]
        $usersQuery = Chatty::getUserContactsQuery();
        $users = $usersQuery->paginate($request->per_page ?? $this->perPage);

        $usersList = $users->items();

        if (count($usersList) > 0) {
            $contacts = '';
            foreach ($usersList as $user) {

                $contacts .= Chatty::getContactItem($user);

            }
        } else {
            $contacts = '<p class="message-hint center-el"><span>Your contact list is empty</span></p>';
        }

        return Response::json([
            'contacts' => $contacts,
            'total' => $users->total() ?? 0,
            'last_page' => $users->lastPage() ?? 1,
        ], 200);
    }

    /**
     * Update user's list item data
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function updateContactItem(Request $request)
    {
        // Get user data
        $user = User::where('id', $request['user_id'])->first();
        if (!$user) {
            return Response::json([
                'message' => 'User not found!',
            ], 401);
        }
        $contactItem = Chatty::getContactItem($user);

        // send the response
        return Response::json([
            'contactItem' => $contactItem,
        ], 200);
    }

    /**
     * Put a user in the favorites list
     *
     * @param Request $request
     * @return JsonResponse|void
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
     * @return JsonResponse|void
     */
    public function getFavorites(Request $request)
    {
        $favoritesList = null;
        $favorites = Favorite::where('user_id', Auth::user()->id);
        foreach ($favorites->get() as $favorite) {
            // get user data
            $user = User::where('id', $favorite->favorite_id)->first();
            $favoritesList .= view('chatty-views.layouts.favorite', [
                'user' => $user,
            ]);
        }
        // send the response
        return Response::json([
            'count' => $favorites->count(),
            'favorites' => $favorites->count() > 0
                ? $favoritesList
                : 0,
        ], 200);
    }

    /**
     * Search in messenger
     *
     * @param Request $request
     * @return JsonResponse|void
     */
    public function search(Request $request)
    {
        $getRecords = null;
        $input = trim(filter_var($request['input']));
        $records = User::where('id', '!=', Auth::user()->id)
            ->where('name', 'LIKE', "%{$input}%")
            ->paginate($request->per_page ?? $this->perPage);
        foreach ($records->items() as $record) {
            $getRecords .= view('chatty-views.layouts.listItem', [
                'get' => 'search_item',
                'type' => 'user',
                'user' => Chatty::getUserWithAvatar($record),
            ])->render();
        }
        if ($records->total() < 1) {
            $getRecords = '<p class="message-hint center-el"><span>Nothing to show.</span></p>';
        }
        // send the response
        return Response::json([
            'records' => $getRecords,
            'total' => $records->total(),
            'last_page' => $records->lastPage()
        ], 200);
    }

    /**
     * Get shared photos
     *
     * @param Request $request
     * @return JsonResponse|void
     */
    public function sharedPhotos(Request $request)
    {
        $shared = Chatty::getSharedPhotos($request['user_id']);
        $sharedPhotos = null;

        // shared with its template
        for ($i = 0; $i < count($shared); $i++) {
            $sharedPhotos .= view('chatty-views.layouts.listItem', [
                'get' => 'sharedPhoto',
                'image' => Chatty::getAttachmentUrl($shared[$i]),
            ])->render();
        }
        // send the response
        return Response::json([
            'shared' => count($shared) > 0 ? $sharedPhotos : '<p class="message-hint"><span>Nothing shared yet</span></p>',
        ], 200);
    }

    /**
     * Delete conversation
     *
     * @param Request $request
     * @return JsonResponse
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

    /**
     * Delete message
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function deleteMessage(Request $request)
    {
        // delete
        $delete = Chatty::deleteMessage($request['id']);

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
                        $avatar = Auth::user()->avatar;
                        if (Chatty::storage()->exists($avatar)) {
                            Chatty::storage()->delete($avatar);
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
     * @return JsonResponse
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


    public function uploadVoice(Request $request)
    {

        $file = $request->file('audio_data');
        $attachment_title = $file->getClientOriginalName();
        // upload attachment and store the new name
        $attachment = Str::uuid() . "." . $file->getClientOriginalExtension();
        $clientfolder = auth()->id() . '-' . $request['id'];
        $attachment = date('Y-m-d') . '/' . $clientfolder . '/' . $attachment;
        $file->storeAs(config('chatify.attachments.folder'), $attachment, config('chatify.storage_disk_name'));

        $messageID = mt_rand(9, 999999999) + time();

        Chatty::newMessage([
            'id' => $messageID,
            'type' => $request['type'],
            'from_id' => Auth::user()->id,
            'to_id' => $request['id'],
            'body' => htmlentities(trim($request['message']), ENT_QUOTES, 'UTF-8'),
            'attachment' => ($attachment) ? json_encode((object)[
                'new_name' => $attachment,
                'old_name' => htmlentities(trim($attachment_title), ENT_QUOTES, 'UTF-8'),
            ]) : null,
        ]);

        // fetch message to send it with the response
        $messageData = Chatty::fetchMessage($messageID, null, 'pusher');

        // send to user using pusher
        Chatty::push('private-chatify', 'messaging', [
            'from_id' => Auth::user()->id,
            'to_id' => $request['id'],
            'message' => $messageData
//                'message' => Chatty::messageCard($messageData, 'default')
        ]);
        $error = (object)[
            'status' => 0,
            'message' => null
        ];
        return Response::json([
            'status' => '200',
            'error' => $error,
            'message' => Chatty::messageCard(@$messageData),
            'tempID' => $request['temporaryMsgId'],
        ]);

    }

    public function changeAgent(Request $request)
    {
//        return $request->all();
        $client = Account::find($request->client_id);
        if ($client) {
            $client->agent_id = $request->new_agent;
            $client->save();

            \DB::table('ch_messages')->where('from_id', $request->client_id)->where('to_id', 0)->update([
                'to_id' => auth()->id()
            ]);

            $this->logChange($client);

            Chatty::push('private-chatify', 'contact-transform-to-agent', [
                'to_id' => $request->new_agent,
            ]);

            return response()->json([
                'status' => true,
                'update_for' => $request->new_agent,
                'update_from' => Auth::user()->id
            ]);
        }
        return response()->json([
            'status' => false,
            'error' => true,
            'msg' => 'Error On Transform!'
        ]);
    }

    public function changeChatStatus(Request $request)
    {
        return Chatty::changeChatStatus();

    }

    public function endChat(Request $request)
    {
        $client_id = $request->client_id;
        return Chatty::changeChatStatus($client_id);
    }

    protected function logChange($client)
    {
        $log = new ChangeLog();
        $log->client_id = $client->id;
        $log->from_agent = auth()->id();
        $log->to_agent = $client->agent_id;
        $log->save();
    }
}
