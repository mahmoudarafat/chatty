<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\CountryResource;
use App\Http\Traits\HelperTrait;
use App\Models\Country;
use Illuminate\Http\Request;

class CountriesController extends Controller
{
   use HelperTrait;
    public function index()
    {
    $countries = Country::all();
        return $this->responseJson(true, '', '', CountryResource::collection($countries));

    }
}
