<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Request;


class Country extends Model
{
    use HasFactory;

    protected $table = 'countries';

    protected $appends = ['zone_name'];

    protected $fillable = array('name_ar', 'name_en', 'flag' ,'phonecode','ordering', 'status');

    public function cities()
    {
        return $this->hasMany(City::class);
    }
    public function clients()
    {
        return $this->hasMany(Client::class);
    }

    public function scopeOrdered($query)
    {
        $query->orderByRaw('-ordering desc');
    }

    public function zone()
    {
        return $this->hasOne('App\Models\Zone', 'country_code', 'iso_alpha2');
    }

    public function getZoneNameAttribute()
    {
        return optional($this->zone)->zone_name ?? config('chatify.timezone');
    }

}
