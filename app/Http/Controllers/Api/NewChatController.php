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
use App\Models\PlayerId;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class NewChatController extends Controller
{
    use HelperTrait;

    public function sendChatMessage(Request $request)
    {

        $rules = [
            'message' => "required_if:file_type,==,text",
            'channel_id' => 'required',
        ];
        if ($request->filled('file') && $request->file('file')) {
            $rules = [
                'file_type' => 'required|in:image,video,voice,file',
            ];
        }
        $validation = validator()->make($request->all(), $rules);
        if ($validation->fails()) {
            $validatedData = $this->returnErrors($validation);

            return $this->responseJson(false, __('error Validation'), $validatedData);
        } else {

            $user = null;
            $response = 'chat';
            if (auth()->guard('api')->check()) {
                $user = auth()->guard('api')->user();
                $sender_type = 'account';
                $account_id = $user->id;
                $response = 'api';
            }
            if (auth()->guard('api_chat')->check()) {
                $user = auth()->guard('api_chat')->user();
                $sender_type = 'agent';
                $account_id = $request->account_id;

            }
            $channel_id = $request->channel_id;

            $channel = ChatChannel::where('id', $channel_id)->first();

            if (!$channel) {
                $channel = new ChatChannel();
                $channel->account_id = $account_id;
                $channel->save();
            }
        }

        $f_type = $request->file_type;
        $input = [
            'channel_id' => $channel_id,
            'message' => $request->message,
            'sender_id' => $user->id,
            'sender_type' => $sender_type,
            'file_path' => '',
            'account_read_at' => Carbon::now(),
            'type' => $f_type
        ];

        $message = ChatMessage::create($input);
        $channel->increment('access_count', 1);
        if ($request->hasFile('file')) {

//            $f_type = $request->file_type;
            $file = $request->file('file');
            $file_name = $this->saveImage($file, 'chat');


            $message->file_path = $file_name['file_path'];

            $message->type = $f_type;
            $message->save();
        }

        $message->sender_name = $user->name;
        $message->the_date = $message->created_at->diffForHumans();
        $msgResource = ChatMessageResource::make($message);
        $title = 'new message';
        $body = __('you have answer for your chat');
        $data = [
            'channel_id' => $channel_id,
            'message' => $message->message,
            'type' => 'chat',
            'msg_data' => $msgResource
        ];
        $tokens = [''];
        if($response == 'chat'){
            $tokens = PlayerId::where('client_id', $account_id)->pluck('player_id')->toArray();
        }else{
            if($channel->agent_id > 0){
                $tokens = [$user->player_id]; // current agent
            }else{
                $tokens = User::pluck('player_id')->toArray();
            }
        }

        $this->notifyByFirebase($title, $body, $tokens, $data);

//        return 'sdads';

        if($response == 'chat'){
            return response()->json([
                'status' => true,
                'data' => $msgResource
            ]);
        }else{
            return $this->responseJson(true, __('Success'));
        }

    }

}
