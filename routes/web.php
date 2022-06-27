<?php

use App\Chatty\Facades\ChattyMessenger as Chatty;
use App\Http\Controllers\Admin\IntroController;
use App\Http\Controllers\Admin\CountryController;
use App\Http\Controllers\Admin\CityController;
use App\Http\Controllers\Admin\ClientController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\MainController;
use App\Http\Controllers\Admin\ChatController;
use App\Http\Controllers\Admin\ClientsController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\ActivityController;
use App\Http\Controllers\Admin\StaticPageController;
use App\Http\Controllers\Admin\ParticipationController;
use App\Http\Controllers\Admin\UpdateController;
use App\Http\Controllers\Admin\AppSettingController;
use App\Http\Controllers\Admin\NotificationController;
use App\Http\Controllers\Admin\CompanyController;
use App\Http\Controllers\Admin\AppClientController;
use Illuminate\Support\Str;
/*
|-----------------------------------------------------lo--------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Auth::routes();
//


     Route::get('/', function(){

//         \Artisan::call('storage:link');
//         return \Artisan::output();
        /*
         //    $arabic = ['٩', '٨', '٧', '٦', '٥', '٤', '٣', '٢', '١','٠'];
         $string = ۳۳۰٦;
         return strtr($string, array('۰'=>'0', '۱'=>'1', '۲'=>'2', '۳'=>'3', '۴'=>'4', '۵'=>'5', '۶'=>'6',
             '۷'=>'7', '۸'=>'8', '۹'=>'9', '٠'=>'0', '١'=>'1', '٢'=>'2', '٣'=>'3', '٤'=>'4', '٥'=>'5',
             '٦'=>'6', '٧'=>'7', '٨'=>'8', '٩'=>'9'));
         */
         return redirect()->route('home');

     });
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::group(['namespace' => 'Admin'], function () {
    Route::post('login', ['as' => 'login', 'uses' => 'MainController@login']);

    Route::post('/login', [MainController::class, 'login'])->name('postLogin');
//
     Route::get('/record', function(){
         return view('record');
     });

});


Route::group(['middleware' => ['auth']], function () {
    Route::group([
//            'middleware' => 'auto-check-permission',
        'namespace' => 'Admin'], function () {
//            Route::resource('roles', 'RoleController');


        Route::get('/welcome', function () {

//            \Illuminate\Support\Facades\Artisan::call('permission:cache-reset');
//            \Illuminate\Support\Facades\Artisan::call('cache:forget');
            \Illuminate\Support\Facades\Artisan::call('config:cache');
            \Illuminate\Support\Facades\Artisan::call('cache:clear');
            dd('ddd');
        })->name('welcome');


        Route::get('all-chats', [ChatController::class, 'index'])->name('chat');
        Route::post('/getChats', [ChatController::class, 'getChats'])->name('getChats');
        Route::post('/getMessages', [ChatController::class, 'getMessages'])->name('getMessages');
        Route::post('/send/{id}', [ChatController::class, 'sendMessage'])->name('sendMessage');
        Route::post('/readMessage/{id}', [ChatController::class, 'readMessage'])->name('readMessage');

        Route::post('getClientInfo', [ClientsController::class, 'GetClientInfo'])->name('getClientInfo');

});

    Route::get('/welcome', function () {

//            \Illuminate\Support\Facades\Artisan::call('permission:cache-reset');
//            \Illuminate\Support\Facades\Artisan::call('cache:forget');
        \Illuminate\Support\Facades\Artisan::call('config:cache');
        \Illuminate\Support\Facades\Artisan::call('cache:clear');
        dd('ddd');
    })->name('welcome');


    Route::resource('intro', IntroController::class)->except('show');
    Route::get('/app-settings', [AppSettingController::class, 'index'])->name('app-settings.index');
    Route::post('/app-settings', [AppSettingController::class, 'store'])->name('app-settings.store');

    Route::match(['post', 'put'], '/app-settings', [AppSettingController::class, 'store'])->name('app-settings.store');

    Route::get('send-notifications', [NotificationController::class, 'index'])->name('notification.index');
    Route::post('send-notifications', [NotificationController::class, 'sendNotification'])->name('notification.sendNotification');


    Route::resource('countries', CountryController::class);
    Route::resource('cities', CityController::class);
    Route::get('get-city-list', [CityController::class, 'getCityList']);

    Route::post('country-city/{id}', [CityController::class, 'storeCity'])->name('country.city');
    Route::resource('clients', ClientController::class);
    Route::resource('setting', SettingController::class);
    Route::resource('activites', ActivityController::class);
    Route::resource('activites', ActivityController::class);

    Route::get('static-page', [StaticPageController::class, 'edit'])->name('view-StaticPage');
    Route::post('static-page', [StaticPageController::class, 'update'])->name('updateStaticPage');

    Route::resource('participations', ParticipationController::class);
    Route::get('get-client-list', [ParticipationController::class, 'getClientList'])->name('client-list');

    Route::resource('updates', UpdateController::class);
    Route::get('updates-client', [UpdateController::class,'updatesClient'])->name('updates.clients');


    Route::resource('companies', CompanyController::class);
    Route::post('companies-restore/{id}', [CompanyController::class,'Restore'])->name('companies.restore');

    Route::get('app-clients', [AppClientController::class,'index'])->name('app.clients');

});


