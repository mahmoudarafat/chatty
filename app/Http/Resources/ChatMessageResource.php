<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class ChatMessageResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {

        if ($this->sender_type == 'account'){
            $sender_name = $this->account->name ?? $this->account->mobile;

        }else{

            $sender_name = $this->agent->name ?? $this->agent->mobile;
        }

        return [
            'id'=>$this->id,
            'channel_id'=>$this->channel_id,
            'message'=>$this->message,
            'sender_id'=>$this->sender_id,
            'sender_name'=>$sender_name,
            'sender_type'=>$this->sender_type,
            'type'=>$this->type,
            'file_path'=>url($this->file_path),
            'thumbnail'=>url('images/thumbnail.jpg'),
            'time'=>Carbon::parse($this->created_at)->diffForHumans(Carbon::now()),
            'image'=>url('assets/img/chat-person.png'),
            'created_at' => $this->created_at
        ];
    }
}
