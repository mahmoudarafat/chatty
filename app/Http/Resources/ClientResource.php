<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ClientResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'email'=>$this->email,
            'phone'=>$this->telephone ?? $this->telephone2,
            'address'=>$this->address ,
            'online_status' => $this->online_status
        ];
    }
}
