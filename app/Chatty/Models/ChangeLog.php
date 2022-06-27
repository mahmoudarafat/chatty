<?php

namespace App\Chatty\Models;

use App\Chatty\Facades\ChattyMessenger as Chatty;
use App\Models\Account;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;

class ChangeLog extends Model
{
    use SoftDeletes;
    protected $table = 'agent_changes';

}
