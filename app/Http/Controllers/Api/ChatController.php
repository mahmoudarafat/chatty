<?php

namespace App\Http\Controllers\Api;

use App\Events\PrivateChatEvent;
use App\Http\Resources\ChatChannelResource;
use App\Http\Resources\ChatMessageResource;
use App\Http\Resources\MessageResource;
use App\Http\Traits\HelperTrait;
use App\Models\ChannelMember;
use App\Models\ChatChannel;
use App\Models\ChatMessage;
use App\Http\Controllers\Controller;

use App\Models\Client;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ChatController extends Controller
{
    use HelperTrait;

    public function Chats(Request $request)
    {
        $channels = $request->user()->channels()->whereHas('clients', function ($q) use ($request) {
            $q->where('client_id', '!=', $request->user()->id);
        })->whereHas('ChatMessages');
        if ($request->filled('name')) {
            $client_ids = Client::where('name', 'like', '%' . $request->name . '%')->pluck('id');
            $chan_members = ChannelMember::whereIn('client_id', $client_ids)->pluck('channel_id');
            $channels = $channels->whereIn('chat_channels.id', $chan_members);

        }
        $channels = $channels->get();
        $ch = $channels->sortByDesc('last_message_time');
        $xh = $this->paginated($ch, 8);
        return $this->responseJson(true, '', '', ChatChannelResource::collection($xh));
    }

    public function openChat(Request $request)
    {

        if ($request->user()->id == $request->client_id) {
            return $this->responseJson(1, __('can`t chat with your self'));
        }
        if ($request->filled('channel_id')) {


            $chat_channel = ChatChannel::where('id', $request->channel_id)->first();
            if ($chat_channel) {

                $chat_messages = ChatMessage::where('client_id', '!=', $request->user()->id)->get();
                foreach ($chat_messages as $message) {
                    $message->update(['is_read' => 1]);
                }
                $messages = $chat_channel->ChatMessages()->orderBy('created_at', 'desc')->paginate(5);
                return $this->responseJson(1, '', ChatChannelResource::make($chat_channel), ChatMessageResource::collection($messages));
            }
        }
        $chat_channel = null;
        $chat_channels_ids = ChatChannel::where('type', 'single')->pluck('id');
        $checkSelf = ChannelMember::whereIn('channel_id', $chat_channels_ids)->where('client_id', $request->user()->id)->pluck('channel_id');
        if ($checkSelf) {

            $checkOtherSide = ChannelMember::whereIn('channel_id', $checkSelf)->where('client_id', $request->client_id)->first();
            if ($checkOtherSide) {
                $chat_channel = ChatChannel::where('id', $checkOtherSide->channel_id)->first();
            }
        }

        if (!$chat_channel) {
            $chat_channel = new ChatChannel();
            $chat_channel->save();
            $chat_channel->clients()->attach($request->client_id);
            $chat_channel->clients()->attach($request->user()->id);
            $chat_channel = $chat_channel->load('ChatMessages');
        } else {

            $chat_messages = ChatMessage::where('client_id', '!=', $request->user()->id)->get();
            foreach ($chat_messages as $message) {
                $message->update(['is_read' => 1]);
            }
        }
//        $chat_channel = $chat_channel->with('ChatMessages');

        $messages = $chat_channel->ChatMessages()->orderBy('created_at', 'desc')->paginate(5);

        return $this->responseJson(1, '', ChatChannelResource::make($chat_channel), ChatMessageResource::collection($messages));
    }

    public function openMyChat(Request $request)
    {
        $channel = ChatChannel::where('account_id', $request->user()->id)->first();

        if (!$channel) {
            $channel = new ChatChannel();
            $channel->account_id = $request->user()->id;
            $channel->save();
        }

        return $this->responseJson(true, '', '', ChatChannelResource::make($channel));
    }

    public function sendChatMessage(Request $request)
    {

        $rules = [
            'message' => 'required',
            'channel_id' => 'required',
        ];
        if ($request->filled('file')) {
            $rules = [
                'file_type' => 'required|in:image,video,voice,file',
            ];
        }
        $validation = validator()->make($request->all(), $rules);
        if ($validation->fails()) {
            $validatedData = $this->returnErrors($validation);

            return $this->responseJson(false, __('error Validation'), $validatedData);
        } else {
            if ($request->filled('channel_id')) {
                $channel_id = $request->channel_id;
                $channel = ChatChannel::where('id', $request->channel_id)->first();
            } else {
                $channel = ChatChannel::where('account_id', $request->user()->id)->first();

                if ($channel) {
                    $channel_id = $channel->id;
                } else {
                    $channel = new ChatChannel();
                    $channel->account_id = $request->user()->id;
                    $channel->save();
                    $channel_id = $channel->id;
                }
            }
            $input = [
                'channel_id' => $channel_id,
                'message' => $request->message,
                'sender_id' => $request->user()->id,
                'sender_type' => 'account',
                'file_path' => '',
                'account_read_at' => Carbon::now(),
            ];

            $message = ChatMessage::create($input);
            $channel->increment('access_count', 1);
            if ($request->hasFile('file')) {
                $file = $request->file('file');
                $file_name = $this->saveImage($file, 'chat');
                $message->file_path = $file_name;
                $message->type = $request->file_type;
                $message->save();
            }


//            $options = array(
//                'cluster' => 'eu',
////                'encrypted' => true
//            );
//            $pusher = new Pusher(
//                '07087522567e19186337',
//                '7a68a5491c6280bc993c',
//                '1200963',
//                $options
//            );

            $message->sender_name = $request->user()->name;
            $message->the_date = $message->created_at->diffForHumans();

            /*
            $x = broadcast(new PrivateChatEvent(ChatMessageResource::make($message), $channel_id));
            info(json_encode($x));
            */
            /*
            $pusher = new Pusher\Pusher(
                config('broadcasting.connections.pusher.key'),
                config('broadcasting.connections.pusher.secret'),
                config('broadcasting.connections.pusher.app_id'),
                [
                    'cluster' => config('broadcasting.connections.pusher.options.cluster')
                ]
            );
            $msg = json_encode($message);
            $pusher->trigger("private-channel-$channel_id", "private-event-$channel_id", $msg);
            */
            // $title = 'New Message from ' . $message->sender_name;
            // $body =  $message->message;
            
            // $agent = Client::join('chat_channels', function($q) {
            //     $q->on('chat_channels.agent_id', 'clients.id')->where('channel_id', request('channel_id') ); 
            // })->first();
           
            // $tokens = [];
            // $this->notifyByFirebase($title, $body, $tokens, $data = [], $type = null ,$sound = 'default');

            return $this->responseJson(true, __('Success'));
        }
    }

    public function readChatMessage($id)
    {
        $message = ChatMessage::find($id);
        if ($message) {
            $message->is_read = 1;
            $message->save();
            return $this->responseJson(1, __('Success'));
        } else {
            return $this->responseJson(2, __('Success'));

        }

    }

    public function deleteChats(Request $request)
    {
        $channel_ids = ChannelMember::where('client_id', $request->user()->id)->pluck('channel_id');
        $channels = ChatChannel::whereIn('id', $channel_ids)->whereHas('ChatMessages')->get();
        foreach ($channels as $channel) {
            $channel->ChatMessages()->delete();
        }
        return $this->responseJson(1, __('Success'));

    }

    public function getMessages($id)
    {

        $channel = ChatChannel::find($id);
        if ($channel) {

            $messages = $channel->messages()->paginate(10);
            return $this->responseJson(true, '', '', ChatMessageResource::collection($messages));

        }
        return $this->responseJson(false, 'حدث خطأ');
    }

    public function getMobileMessages($id)
    {

        $channel = ChatChannel::find($id);
        if ($channel) {

            $messages = $channel->messages;
            return $this->responseJson(true, '', '', ChatMessageResource::collection($messages));

        }
        return $this->responseJson(false, 'حدث خطأ');
    }


    public function openChatView(Request $request, $channelId)
    {
        $userId = 1;
        return view('mobile.mobile-chat', compact('channelId', 'userId'));

    }


    public function getMobileChats(Request $request)
    {
        $userId = 1;
        $chats = ChatChannel::where('account_id', $userId)->get();

        return ChatChannelResource::collection($chats);

    }

    public function myChannel(Request $request, $id)
    {
        $userId = 1;
        $chats = ChatChannel::where('id', $id)->first();

        return ChatChannelResource::make($chats);
    }


    public function sendMobileMessage($channel_id, Request $request)
    {
        $channel = ChatChannel::find($channel_id);
        $message = $channel->messages()->create([
            'message' => $request->message,
            'sender_id' => $request->userId,
            'sender_type' => 'account',
            'type' => 'text',
            'file_path' => '',
            'account_read_at' => Carbon::now(),
        ]);


        if ($request->hasFile('file')){

            $x= $this->saveImage( $request->file,'chatFiles' );
            $message->file_path = $x['file_path'];
            $message->type = $x['file_type'];

            $message->save();
        }
        $channel->messages->where('account_read_at', null)->agent_read_at = Carbon::now();
        if ($request->push == 'push') {
            $x = broadcast(new PrivateChatEvent(MessageResource::make($message), $channel_id));
        } else {
            $x = broadcast(new PrivateChatEvent(MessageResource::make($message), $channel_id));
//            $client = Account::find($channel->account_id);
//            $title_ar = 'لديك رد على محادثتك';
//            $title_en = 'you have answer for your chat';
//            $content_ar = 'لديك رد على محادثتك';
//            $content_en = 'you have answer for your chat';
//            $notification = $client->notify(new ChatNotification($channel, 'chat', $title_ar, $title_en, $content_ar, $content_en));
//            $body = __('you have answer for your chat');
//
//            $title = __('New visit request');
//            $data = [
//                'channel_id' => $channel->id,
//                'message' => $message->message,
//                'type' => 'chat',
//            ];
//
//            $tokens = $client->playerIds->pluck('player_id')->toArray();
//            $this->notifyByFirebase($title, $body, $tokens, $data, null, $sound = $client->notifications_sound);
        }



        $title = 'New Message from ' . $message->sender_name;
        $body =  $message->message;
        
        $agent = Client::join('chat_channels', function($q) {
            $q->on('chat_channels.agent_id', 'clients.id')->where('channel_id', request('channel_id') ); 
        })->first();
       return $agent;
        $tokens = [];
        $this->notifyByFirebase($title, $body, $tokens, $data = [], $type = null ,$sound = 'default');


        return ChatMessageResource::make($message)->additional([
            'x' => $x,
        ]);
    }


}
