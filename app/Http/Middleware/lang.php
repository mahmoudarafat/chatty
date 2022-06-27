<?php

namespace App\Http\Middleware;

use Closure;

class lang
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $user= auth()->guard('api')->user();

        if ($user){
            if ($user->lang == 'en'){
                $l = 'en';
            }else{
                $l = 'ar';
            }
            app()->setlocale($l);

        }else{
            app()->setlocale('ar');
        }

        return $next($request);
    }
}
