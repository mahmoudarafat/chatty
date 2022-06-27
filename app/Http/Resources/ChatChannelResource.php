<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class ChatChannelResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $lastMsgTxt = '';
        $lastMsgTime = Carbon::now();
        $lastMsg = $this->messages()->orderBy('id', 'DESC')->first();
        if($lastMsg){
            $lastMsgTxt = $lastMsg->message;
            $lastMsgTime = $lastMsg->created_at;
        }

        return [
            'id'=>$this->id,
            'agent_id'=>$this->agent_id,
            'account_id'=>$this->account_id,
            'open'=>false,
            'account_name'=>$this->account->name ?? $this->account->mobile,
            'last_message'=>$lastMsgTxt ,
            'last_message_time'=>'' ,
            'messages' => ChatMessageResource::collection($this->whenLoaded('messages')),
            'agentUnreadCount' => $this->messages()->where('agent_read_at' , null)->count(),
            'accountUnreadCount' => $this->messages()->where('account_read_at' , null)->count(),
            'last_message_created'=>$lastMsgTime ,
            'online_status' => optional($this->account->client)->online_status
        ];
    }
}
