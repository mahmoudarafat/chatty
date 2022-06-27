<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Account extends Authenticatable
{
    use HasApiTokens, Notifiable;

    public static $snakeAttributes = true;

    protected $table = 'accounts';
    protected $guarded = array('id');

    public function client()
    {
        return $this->belongsTo(Client::class);
    }

    public function messages()
    {
        return $this->hasMany(ChatMessage::class, 'sender_id', 'id');
    }

    public function playerIds()
    {
        return $this->hasMany(PlayerId::class, 'client_id');
    }

    public function getTimezoneAttribute()
    {
        return optional($this->client)->timezone ?? config('chatify.timezone');
    }

}
