<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CountryResource extends JsonResource
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
            'id'=>$this->id,
            'name_en'=>$this->name_en,
            'name_ar'=>$this->name_ar,
            'iso_alpha2'=>$this->iso_alpha2,
            'iso_alpha3'=>$this->iso_alpha3,
            'phonecode'=>$this->phonecode,
            'flag'=>$this->flag,


        ];
    }
}
