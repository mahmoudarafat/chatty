<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CountriesController;
use App\Http\Controllers\Api\ChatController;
use App\Http\Controllers\Api\NewChatController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::middleware(['cors'])->group(function () {

    Route::group(['prefix' => 'v1'], function () {
        Route::get('do', [AuthController::class, 'do']);

        Route::post('register', [AuthController::class, 'register']);
        Route::post('register-verify', [AuthController::class, 'registerVerify']);
        Route::post('resend-code', [AuthController::class, 'resendCode']);
        Route::get('countries', [CountriesController::class, 'index']);

        Route::group(['middleware' => ['auth:api,api_chat', 'lang']], function () {

            Route::post('logout', [AuthController::class, 'logout']);

            Route::post('chats', [ChatController::class, 'Chats']);
            Route::post('open--chat', [ChatController::class, 'openChat']);
            Route::post('open-my-chat', [ChatController::class, 'openMyChat']);
            Route::get('get-messages/{id}', [ChatController::class, 'getMessages']);
            Route::post('open-my-channel', [ChatController::class, 'openMyChannel']);
            Route::post('send-chat-message', [NewChatController::class, 'sendChatMessage']);
            Route::post('read-chat-message/{id}', [ChatController::class, 'readChatMessage']);
            Route::post('delete-chats', [ChatController::class, 'deleteChats']);

            Route::get('update-activity', function(){
                return response()->json([
                    'status' => true
                ]);
            });

        });

        Route::get('open-chat-view/{channelId}', [ChatController::class, 'openChatView']);
        Route::get('getMobileChats', [ChatController::class, 'getMobileChats']);
        Route::post('my-channel/{id}', [ChatController::class, 'myChannel']);
        Route::get('get-mobile-messages/{id}', [ChatController::class, 'getMobileMessages']);
        Route::post('send-mobile-message/{channelId}', [ChatController::class, 'sendMobileMessage']);


    });

});


Route::get('test', function(){
    return request()->user();

})->middleware('auth:sanctum');


