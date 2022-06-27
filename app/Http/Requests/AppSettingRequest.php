<?php

namespace App\Http\Requests;

use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Http\FormRequest;

class AppSettingRequest extends FormRequest
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
        if ($this->isMethod('POST')) {
            return [
                'img'          => ['required', 'mimes:jpg,jpeg,bmp,png'],
                'currency'     => ['required'],
                'date_kind'    => ['required'],
                'terms'        => ['sometimes'],
                'about'        => ['sometimes'],
            ];
        } elseif ($this->isMethod('PUT') || $this->isMethod('PATCH')) {
            return [
                'img'          => ['sometimes'],
                'currency'     => ['sometimes'],
                'date_kind'    => ['sometimes'],
                'terms'        => ['sometimes'],
                'about'        => ['sometimes'],
            ];
        }
    }

    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        if (App::isLocale('ar')) {
            return [
                'img.required'       => 'يجب اختيار صورة',
                'currency.required'  => 'العملة مطلوبة',
                'date_kind.required' => 'نوع التاريخ مطلوب',
            ];
        } else {
            return [
                'img.required'       => 'Image is required',
                'currency.required'  => 'Currency is required',
                'date_kind.required' => 'Date kind is required',
            ];
        }
    }
}
