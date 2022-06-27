<?php

namespace App\Http\Requests;

use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\App;

class IntroRequest extends FormRequest
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
                'image'          => ['required', 'mimes:jpg,jpeg,bmp,png'],
                'title_ar'       => ['required', 'unique:intros,title_ar'],
                'title_en'       => ['required', 'unique:intros,title_en'],
                'description_ar' => ['required'],
                'description_en' => ['required'],
            ];
        } elseif ($this->isMethod('PUT') || $this->isMethod('PATCH')) {
            return [
                'image'          => ['sometimes'],
                'title_ar'       => ['sometimes'],
                'title_en'       => ['sometimes'],
                'description_ar' => ['sometimes'],
                'description_en' => ['sometimes'],
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
                'image.required'          => 'يجب اختيار صورة مقدمة',
                'title_ar.required'       => 'العنوان باللغة العربية مطلوب',
                'title_ar.unique'         => 'العنوان باللغة العربية موجود من قبل',
                'title_en.required'       => 'العنوان باللغة الإنجليزية مطلوب',
                'title_en.unique'         => 'العنوان باللغة الإنجليزية موجود من قبل',
                'description_ar.required' => 'الوصف باللغة العربية مطلوب',
                'description_en.required' => 'الوصف باللغة الإنجليزية مطلوب',
            ];
        } else {
            return [
                'image.required'          => 'Image is required',
                'title_ar.required'       => 'Title in Arabic is required',
                'title_ar.unique'         => 'Title in Arabic is already exist',
                'title_en.required'       => 'Title in English is required',
                'title_en.unique'         => 'Title in English is already exist',
                'description_ar.required' => 'Description in Arabic is required',
                'description_en.required' => 'Description in English is required',
            ];
        }
    }
}
