<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChatMessage extends Model
{
protected $appends = array('message_time');
    protected $fillable = array(
        'id',
        'channel_id',
        'message',
        'sender_id',
        'sender_type',
        'type',
        'file_path',
        'agent_read_at',
        'account_read_at',
    );

    public function account()
    {

        return $this->belongsTo(Account::class, 'sender_id', 'id');
    }

    public function agent()
    {
        return $this->belongsTo(User::class, 'sender_id', 'id');
    }

    public function getMessageTimeAttribute(){

        return Carbon::parse($this->created_at)->diffForHumans();
    }
}
