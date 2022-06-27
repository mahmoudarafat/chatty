<?php

namespace App\Providers;

use App\Chatty\ChattyMessenger;
use App\Models\Account;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        app()->bind('ChattyMessenger', function () {
            return new \App\Chatty\ChattyMessenger;
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Paginator::useBootstrap();

        view()->composer('chatty-views.*', function ($view){
           $view->with('chattyObject', new ChattyMessenger());
           $view->with('otherAgents', Account::where([
               'user_type' => 'agent',
               'is_active' => 'active',
               ])
               ->where('id', '!=', auth()->id() ?? 0 )
               ->select('name', 'id')->get() );
        });
    }
}
