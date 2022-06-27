<?php

namespace App\Chatty;

use App\Chatty\Models\ChMessage as Message;
use App\Chatty\Models\ChFavorite as Favorite;
use App\Http\Traits\HelperTrait;
use App\Models\Account;
use App\Notifications\SupportNotification;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Pusher\Pusher;
use Illuminate\Support\Facades\Auth;
use Exception;
use Illuminate\Support\Facades\File;

class ChattyMessenger
{
    use HelperTrait;
//    public $pusher;

    /**
     * Get max file's upload size in MB.
     *
     * @return int
     */
    public function getMaxUploadSize()
    {
        return config('chatify.attachments.max_upload_size') * 1048576;
    }

//    public function __construct()
//    {
//        $this->pusher = new Pusher(
//            config('chatify.pusher.key'),
//            config('chatify.pusher.secret'),
//            config('chatify.pusher.app_id'),
//            config('chatify.pusher.options'),
//        );
//    }

    public function pusher(){
        return new Pusher(
            config('chatify.pusher.key'),
            config('chatify.pusher.secret'),
            config('chatify.pusher.app_id'),
            config('chatify.pusher.options'),
        );
    }


    /**
     * This method returns the allowed image extensions
     * to attach with the message.
     *
     * @return array
     */
    public function getAllowedImages()
    {
        return config('chatify.attachments.allowed_images');
    }

    /**
     * This method returns the allowed file extensions
     * to attach with the message.
     *
     * @return array
     */
    public function getAllowedFiles()
    {
        return config('chatify.attachments.allowed_files');
    }

    /**
     * Returns an array contains messenger's colors
     *
     * @return array
     */
    public function getMessengerColors()
    {
        return config('chatify.colors');
    }

    /**
     * Trigger an event using Pusher
     *
     * @param string $channel
     * @param string $event
     * @param array $data
     * @return void
     */
    public function push($channel, $event, $data)
    {
        $pusher = new Pusher(
            config('chatify.pusher.key'),
            config('chatify.pusher.secret'),
            config('chatify.pusher.app_id'),
            config('chatify.pusher.options'),
        );
        return $pusher->trigger($channel, $event, $data);
    }

    /**
     * Authentication for pusher
     *
     * @param string $channelName
     * @param string $socket_id
     * @param array $data
     * @return void
     */
    public function pusherAuth($channelName, $socket_id, $data = null)
    {
        $pusher = new Pusher(
            config('chatify.pusher.key'),
            config('chatify.pusher.secret'),
            config('chatify.pusher.app_id'),
            config('chatify.pusher.options'),
        );
        return $pusher->socket_auth($channelName, $socket_id, $data);
    }

    /**
     * Fetch message by id and return the message card
     * view as a response.
     *
     * @param int $id
     * @return array
     */
    public function fetchMessage($id, $index = null, $type='')
    {
        $attachment = '';
        $attachment_type = null;
        $attachment_title = null;

        $data = ['pusher' => [], 'web' => [] ];

        $msg = Message::where('id', $id)->first();

        if($type == 'pusher' && auth()->id() == $msg->from_id ?? '0')
        {
            $msg = $msg->toArray();
            $msg['sender_type'] = 'default';
            return $msg;
        }

        if (isset($msg->attachment)) {
            $attachmentOBJ = json_decode($msg->attachment);
            $attachment = $attachmentOBJ->new_name;
            $attachment_title = htmlentities(trim($attachmentOBJ->old_name), ENT_QUOTES, 'UTF-8');

            // $ext = pathinfo($attachment, PATHINFO_EXTENSION);
            // $attachment_type = in_array($ext, $this->getAllowedImages()) ? 'image' : 'file';
            $attachment_type = $msg->msg_type;
        }

        $fulltimeOption = Carbon::parse($msg->created_at)->timezone(config('chatify.timezone'));
        $fulltime = $fulltimeOption->format('Y-m-d h:i:s A');
        $fulltime_text = $fulltimeOption->diffForHumans();
        return [
            'index' => $index,
            'id' => $msg->id,
            "type" =>  $msg->sender_type,
            'from_id' => $msg->from_id,
            'to_id' => $msg->to_id,
            'message' => $msg->body,
            'body' => $msg->body,
            'attachment' => [$attachment, $attachment_title, $attachment_type],
            'time' => $fulltime_text,
            'fullTime' => $fulltime,
            // 'viewType' => ($msg->from_id == Auth::user()->id) ? 'sender' : 'default',
            'viewType' => $msg->sender_type,
            'seen' => $msg->seen,
            'sender_name' => $msg->sender_name,
            "msg_type" => $msg->msg_type,
            "file_path" => $msg->file_path,
            "created_at" => Carbon::parse($msg->created_at)->format('Y-m-d h:i:s A'),
            "updated_at" => Carbon::parse($msg->updated_at)->format('Y-m-d h:i:s A'),
            "rate" => $msg->rate_html,
            "notes" => $msg->notes,
            "chatStatus" => $msg->end_type,
        ];

    }

    /**
     * Return a message card with the given data.
     *
     * @param array $data
     * @param string $viewType
     * @return string
     */
    public function messageCard($data, $viewType = null)
    {
        $data['viewType'] = ($viewType) ? $viewType : $data['viewType'];

        return view('chatty-views.layouts.messageCard', $data)->render();
    }

    /**
     * Default fetch messages query between a Sender and Receiver.
     *
     * @param int $user_id
     * @return Message|\Illuminate\Database\Eloquent\Builder
     */
    public function fetchMessagesQuery($user_id)
    {

        return Message::where(function($q) use ($user_id){
            $q->where('from_id', $user_id)->orWhere('to_id', $user_id) ;
        }) ;
        /*
        return Message::where('from_id', Auth::user()->id)->where('to_id', $user_id)
                    ->orWhere('from_id', $user_id)->where('to_id', Auth::user()->id);
        */
    }

    /**
     * create a new message to database
     *
     * @param array $data
     * @return void
     */
    public function newMessage($data)
    {
        $message = new Message();
        $message->id = $data['id'];
        $message->type = $data['type'];
        $message->from_id = $data['from_id'];
        $message->to_id = $data['to_id'];
        $message->body = $data['body'];
        $message->attachment = $data['attachment'];
        $message->end_type = $data['end_type'] ?? null;

        $message->save();
    }

    /**
     * Make messages between the sender [Auth user] and
     * the receiver [User id] as seen.
     *
     * @param int $user_id
     * @return bool
     */
    public function makeSeen($user_id)
    {

        Message::where(function($q) use ($user_id) {
            $q->where('from_id', $user_id)->where('to_id', Auth::user()->id);
            $q->orWhere('to_id', $user_id)->where('from_id', Auth::user()->id);
        })
            ->where('seen', 0)
            ->update(['seen' => 1]);
        return 1;
    }

    /**
     * Get last message for a specific user
     *
     * @param int $user_id
     * @return Message|Collection|\Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Eloquent\Model|object|null
     */
    public function getLastMessageQuery($user_id)
    {

        return $this->fetchMessagesQuery($user_id)->latest()->first();
    }

    /**
     * Count Unseen messages
     *
     * @param int $user_id
     * @return Collection
     */
    public function countUnseenMessages($user_id)
    {
        return Message::where(function($q) use ($user_id) {
                    $q->where('from_id', $user_id)->where('to_id', Auth::user()->id);
//                    $q->orWhere('to_id', $user_id)->where('from_id', Auth::user()->id);
                })
                ->where('seen', 0)->count();
    }

    public function countUnseenMessagesApi()
    {
        return Message::where(function($q){
            $q->where('to_id',Auth::user()->id)->orWhere('from_id', Auth::user()->id);
//                    $q->orWhere('to_id', $user_id)->where('from_id', Auth::user()->id);
        })
            ->where('seen', 0)->count();
    }

    /**
     * Get user list's item data [Contact Itme]
     * (e.g. User data, Last message, Unseen Counter...)
     *
     * @param int $messenger_id
     * @param Collection $user
     * @return string
     */
    public function getContactItem($user)
    {

        // get last message
        $lastMessage = $this->getLastMessageQuery($user->id);

        // Get Unseen messages counter
        $unseenCounter = $this->countUnseenMessages($user->id);

        return view('chatty-views.layouts.listItem', [
            'get' => 'users',
            'user' => $this->getUserWithAvatar($user),
            'lastMessage' => $lastMessage,
            'unseenCounter' => $unseenCounter,
        ])->render();
    }

    /**
     * Get user with avatar (formatted).
     *
     * @param Collection $user
     * @return Collection
     */
    public function getUserWithAvatar($user)
    {
        if ($user->avatar == 'avatar.png' && config('chatify.gravatar.enabled')) {
            $imageSize = config('chatify.gravatar.image_size');
            $imageset = config('chatify.gravatar.imageset');
            $user->avatar = 'https://www.gravatar.com/avatar/' . md5(strtolower(trim($user->email))) . '?s=' . $imageSize . '&d=' . $imageset;
        } else {
            $user->avatar = self::getUserAvatarUrl($user->avatar);
        }
        return $user;
    }

    /**
     * Check if a user in the favorite list
     *
     * @param int $user_id
     * @return boolean
     */
    public function inFavorite($user_id)
    {
        return Favorite::where('user_id', Auth::user()->id)
            ->where('favorite_id', $user_id)->count() > 0
            ? true : false;
    }

    /**
     * Make user in favorite list
     *
     * @param int $user_id
     * @param int $star
     * @return boolean
     */
    public function makeInFavorite($user_id, $action)
    {
        if ($action > 0) {
            // Star
            $star = new Favorite();
            $star->id = rand(9, 99999999);
            $star->user_id = Auth::user()->id;
            $star->favorite_id = $user_id;
            $star->save();
            return $star ? true : false;
        } else {
            // UnStar
            $star = Favorite::where('user_id', Auth::user()->id)->where('favorite_id', $user_id)->delete();
            return $star ? true : false;
        }
    }

    /**
     * Get shared photos of the conversation
     *
     * @param int $user_id
     * @return array
     */
    public function getSharedPhotos($user_id)
    {
        $images = array(); // Default
        // Get messages
        $msgs = $this->fetchMessagesQuery($user_id)->orderBy('created_at', 'DESC');
        if ($msgs->count() > 0) {
            foreach ($msgs->get() as $msg) {
                // If message has attachment
                if ($msg->attachment) {
                    $attachment = json_decode($msg->attachment);
                    // determine the type of the attachment
                    in_array(pathinfo($attachment->new_name, PATHINFO_EXTENSION), $this->getAllowedImages())
                        ? array_push($images, $attachment->new_name) : '';
                }
            }
        }
        return $images;
    }

    /**
     * Delete Conversation
     *
     * @param int $user_id
     * @return boolean
     */
    public function deleteConversation($user_id)
    {
        try {
            if(config('chatify.delete_messages')){
                foreach ($this->fetchMessagesQuery($user_id)->get() as $msg) {
                    // delete file attached if exist
                    if (isset($msg->attachment)) {
                        $path = config('chatify.attachments.folder').'/'.json_decode($msg->attachment)->new_name;
                        if (self::storage()->exists($path)) {
                            self::storage()->delete($path);
                        }
                    }
                    // delete from database
                    $msg->delete();
                }
                return 1;
            }
            return 0;
        } catch (Exception $e) {
            return 0;
        }
    }

    /**
     * Delete message by ID
     *
     * @param int $id
     * @return boolean
     */
    public function deleteMessage($id)
    {
        try {
            if(config('chatify.delete_messages')){
                $msg = Message::findOrFail($id);
                if ($msg->from_id == auth()->id()) {
                    // delete file attached if exist
                    if (isset($msg->attachment)) {
                        $path = config('chatify.attachments.folder') . '/' . json_decode($msg->attachment)->new_name;
                        if (self::storage()->exists($path)) {
                            self::storage()->delete($path);
                        }
                    }
                    // delete from database
                    $msg->delete();
                } else {
                    return 0;
                }
                return 1;
            }
            return 0;
        } catch (Exception $e) {
            return 0;
        }
    }

    /**
     * Return a storage instance with disk name specified in the config.
     *
     */
    public function storage()
    {
        return Storage::disk(config('chatify.storage_disk_name'));
    }

    /**
     * Get user avatar url.
     *
     * @param string $user_avatar_name
     * @return string
     */
    public function getUserAvatarUrl($user_avatar_name)
    {
        return self::storage()->url(config('chatify.user_avatar.folder') . '/' . $user_avatar_name);
    }

    /**
     * Get attachment's url.
     *
     * @param string $attachment_name
     * @return string
     */
    public function getAttachmentUrl($attachment_name)
    {
        return self::storage()->url(config('chatify.attachments.folder') . '/' . $attachment_name);
    }

    public function getAvailableAgent()
    {
        if(Auth::user()->agent_id > 0) {
            return Auth::user()->agent_id;
        }else{
            $agent = Account::where([
                'is_active' => 'active',
                'user_type' => 'agent',
                'active_status' => 1
            ])->first();
            if(is_null($agent) ){
                $agent = Account::where([
                    'is_active' => 'active',
                    'user_type' => 'agent'
                ])->first();
            }
            return $agent->id ?? 0;
        }
    }

    public function getUserContactsQuery($user_id = null)
    {
        $usersTable = config('chatify.usersTable');

        $query = Message::join($usersTable, function ($join) use ($usersTable) {
            $join->on('ch_messages.from_id', '=', $usersTable . '.id')
                ->orOn('ch_messages.to_id', '=', $usersTable . '.id')
                ->where($usersTable . '.agent_id', auth()->id()) // new
                ->where($usersTable . '.user_type', 'client'); // new
        })
            ->where(function ($q) {
                // $q->where('ch_messages.from_id', Auth::user()->id)
                // ->orWhere('ch_messages.to_id', Auth::user()->id);
            })
            ->where($usersTable . '.id', '!=', Auth::user()->id)
            ->where($usersTable . '.user_type', 'client') // new
            ->where($usersTable . '.agent_id', auth()->id()) // new
            ->select($usersTable . '.*', DB::raw('MAX(ch_messages.created_at) max_created_at'))
            ->orderBy('max_created_at', 'desc')
            ->groupBy($usersTable . '.id');


        $newClients = Message::join($usersTable, function($q ) use  (  $usersTable ) {
            $q->on('ch_messages.from_id', $usersTable . '.id');
            $q->where($usersTable . '.user_type', 'client');

        })->whereRaw('to_id = 0')
            ->select($usersTable . '.*', DB::raw('1 as max_created_at'))
            ->groupBy($usersTable . '.id');


        $query = $query->union($newClients);



        if($user_id > 0){
            $query = $query->where($usersTable . '.id', $user_id);
        }
        return $query;
    }



    public function changeChatStatus($user_id=null)
    {
        $change = [];
//        return $this->getUserContactsQuery($user_id)->get();
        $userClients = $this->getUserContactsQuery($user_id)->get()->map(function($client) use($user_id, &$change){
            $last = $this->getLastMessageQuery($client->id);

//            dd($last);
            if($last){
                if($last->type != 'end' || ($last->type == 'end' && $last->end_type != 'end_chat' ) ){
//                if($last->chat_status != 'end_chat'){
                    $changed = $this->endChat($last, $user_id);
//                    dd($changed);
                    $change[] = $changed;
                }
            }
            return $client;
        });
        $change = array_filter($change);
        $change = array_unique($change);

        if($user_id > 0 || sizeof($change)){
            return response()->json(['status' => true, 'change' => true ]);
        }
        return response()->json(['status' => true, 'change' => false ]);
    }

    public function endChat($msg, $user_id=null)
    {
        $changed = null;
        $created = Carbon::parse($msg->created_at)->timezone( config('chatify.timezone') );

        $diff = Carbon::now()->diffInSeconds($created);
        if ($user_id > 0 || $diff > config('chatify.end_after')) {
            ///////insert end message////
            $msgId = mt_rand(9, 99999999) . time();
            $endType = 'by_agent';
            $event = 'messaging';
            $body =  'تم انهاء المحادثة تلقائيا لعدم الرد لمدة ' .  (config('chatify.end_after') / 60) . ' دقيقة. ';
            if($msg->sender->user_type == 'client'){
                $endType = 'by_client';
                $body = 'برجاء الانتظار - سيتم الرد في اقرب وقت للمتابعة';
            }
            if($user_id > 0){
                $body = "تم اغلاق المحادثة من قبل موظف الدعم الفني";
                $event = 'chat-ended';
                $endType = 'end_chat';
            }
            $data = [
                'id' => $msgId,
                'type' => 'end',
                'from_id' => $msg->from_id,
                'to_id' => $msg->to_id,
                'attachment' => null,
                'body' => $body,
                'end_type' => $endType
            ];

            if($msg->type != 'end' || $user_id > 0){

                $this->newMessage($data);

                $theMsg = Message::where('id', $msgId)->first();
                $theMsg = $theMsg->toArray() ?? [];
                $theMsg['sender_type'] = 'end';
                $msg_data = [
                    'from_id' => $msg->from_id,
                    'to_id' => $msg->to_id,
                    'message' => $theMsg
                ];
                if($msg->sender->user_type == 'agent'){
                    $title = 'Conversation Ended';
                    $body = $data['body'];
                    $tokens = $msg->receiver->playerIds->pluck('player_id')->toArray();
                    $this->notifyByFirebase($title, $body, $tokens, $msg_data);

                    $msg->receiver->notify(new SupportNotification($data));

                    $this->push('private-chatify', $event, $msg_data);
                }
                $changed = $msg->id;

            }
        }
        return $changed;
    }
}
