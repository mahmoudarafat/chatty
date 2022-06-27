<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AccountResource extends JsonResource
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
            'id' => $this->id,
            'name' => $this->name,
            'mobile' => $this->mobile,
            'client_token' => $this->accessToken,
            'support_code' => $this->client->id ?? null,
            'shop_name' => $this->client->pharmacy_name ?? '',
            'client_name' => $this->client->ower_name ?? '',
            'country_name' => $this->client->country_name ?? '',
            'opened_tasks_count' => $this->client->opened_tasks_count ?? 0,
        ];
    }
}
