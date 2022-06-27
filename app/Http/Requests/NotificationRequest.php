<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;

class NotificationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::check() ? true : false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'body' => ['required'],
        ];
    }

    public function messages()
    {
        if (App::isLocale('ar')) {
            return [
                'body.required' => 'من فضلك ادخل نص الإشعار',
            ];
        } else {
            return [
                'body.required' => 'The notification body is required'
            ];
        }
    }
}
