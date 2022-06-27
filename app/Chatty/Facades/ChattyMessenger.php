<?php

namespace App\Chatty\Facades;

use Illuminate\Support\Facades\Facade;

class ChattyMessenger extends Facade
{

    protected static function getFacadeAccessor()
    {
       return 'ChattyMessenger';
    }
}
