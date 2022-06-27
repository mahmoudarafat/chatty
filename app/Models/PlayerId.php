<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PlayerId extends Model
{

    protected $table='player_ids';
    protected $fillable = array('client_id' ,'player_id');


    public function clients(){
        return $this->belongsTo(Client::class);
    }

}
