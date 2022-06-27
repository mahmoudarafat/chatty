<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\AccountResource;
use App\Http\Traits\HelperTrait;
use App\Models\Account;
use App\Models\PlayerId;
use http\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    use HelperTrait;


    public function do()
    {
//        $client = \DB::table('clients')->find(6775);
//        $activation_code = rand(111111, 999999);
//        $message = 'كود التحقق: ' . $activation_code;
//
//        $x = $this->sendsmsEgypt($client->telephone, $message);
//        return $x;
    }


    public function register(Request $request)
    {
        $rules = [
            'mobile' => 'required',
        ];

//        if (!$account) {
//            $rules['mobile'] = 'unique:accounts';
//        }

        $validatedData = validator()->make($request->all(), $rules);
        if ($validatedData->fails()) {
            $validatedData = $this->returnErrors($validatedData);

            return $this->responseJson(false, __('error Validation'), $validatedData);
        }
        $mobile = $request->mobile;
        $suredNumber = substr($mobile, -8);
        $code = $request->code;

        $client = \DB::table('clients')->where('telephone', 'like', '%' . $suredNumber)->first();
        if (!$client) {
            return $this->responseJson(false, __('Mobile Not registered, contact our support'));
        }

        $account = Account::where('mobile', 'LIKE', '%' . $suredNumber)->first();
        if ($account && $account->is_active == 'inactive') {
            return $this->responseJson(false, __('Blocked Account'));
        }

        if (!$account) {
            // $activation_code = 111111;
            $data = [
                'mobile' => $client->telephone,
                'client_id' => $client->id,
                'name' => $client->pharmacy_name,
                'is_active' => 'inactive',
                'activation_code' => $activation_code,
                "user_type" => 'client',
            ];
            $account = Account::create($data);
            $account->save();
        }else{
            $account->activation_code = $activation_code;
            $account->save();
        }
        // send sms here
        $country = $client->country;
        if ($country == 63) {
            $activation_code = rand(111111, 999999);
            $message = 'كود التحقق: ' . $activation_code;
            $this->sendsmsEgypt($client->telephone, $message);
        } else {
            $activation_code = 111111;
        }

        return $this->responseJson(true, __("Activation Code Sent to your Mobile"));
    }


    public function registerVerify(Request $request)
    {
        $validatedData = validator()->make($request->all(), [
            'mobile' => 'required',
            'activation_code' => 'required',
            'player_id' => 'required',//???
        ]);
        if ($validatedData->fails()) {
            $validatedData = $this->returnErrors($validatedData);

            return $this->responseJson(false, __('error Validation'), $validatedData);
        }

        $mobile = $request->mobile;
        $suredNumber = substr($mobile, -8);

        $client = Account::where('mobile', 'LIKE', '%' . $suredNumber)->first();

        if ($client) {

            if ($client->activation_code == $request->activation_code) {
                // $client->activation_code = null;
                $client->is_active = 'active';
                $client->save();
//                $client->playerIds()->associate($request->player_id);

                $accessToken = $client->createToken('authToken')->plainTextToken;

                // $accessToken = $client->createToken('authToken')->accessToken;

                $client->accessToken = $accessToken;
                $client = AccountResource::make($client);
                PlayerId::where('client_id', $client->id)->delete();
                PlayerId::create(['client_id' => $client->id, 'player_id' => $request->player_id]);
                return $this->responseJson(true, __('Account Verified'), null, $client);

            } else {

                return $this->responseJson(false, __('Wrong Activation Code'));
            }
        } else {

            return $this->responseJson(false, __('Account Not Found'));

        }

    }

//    public function login (Request $request) {
//
//
//        //  dd($request);
//
//        $validator = Validator::make($request->all(), [
//            'mobile' => 'required',
//            'password' => 'required',
//        ]);
//        if ($validator->fails())
//        {
//            return $this->responseJson(0,$validator->errors()->first(),[ 'errors' => $validator->errors()->all()]);
//        }
//        $client = Client::where('mobile', $request->email)->first();
//        if ($client) {
//            if (Hash::check($request->password, $client->password)) {
//                $token = $client->createToken('Laravel Password Grant Client')->accessToken;
//                return $this->responseJson(1,"",[
//                    'token' => $token
//                ],new ClientResource($client));
//            } else {
//                return $this->responseJson(0,"Password mismatch");
//            }
//        } else {
//            return $this->responseJson(0,"client does not exist");
//        }
//    }


    public function resendCode(Request $request)
    {
        $validatedData = validator()->make($request->all(), [
            'mobile' => 'required',
        ]);
        if ($validatedData->fails()) {
            $validatedData = $this->returnErrors($validatedData);

            return $this->responseJson(false, __('error Validation'), $validatedData);
        }
        $client = Client::where('mobile', $request->mobile)->first();
        if ($client) {
            $activation_code = rand(111111, 999999);
            $client->activation_code = 111111;


            $client->save();

            return $this->responseJson(false, __("Activation Code Sent to your Mobile"));
        } else {

            return $this->responseJson(false, __('Not Registered'));

        }

    }


    public function logout(Request $request)
    {

        //   dd($request);
        $token = $request->user()->token();
        $token->revoke();
        return $this->responseJson(false, __('You have been successfully logged out!'));
    }
}
