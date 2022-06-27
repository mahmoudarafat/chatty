<?php

namespace App\Http\Traits;

use Carbon\Carbon;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Lang;
use Ixudra\Curl\Facades\Curl;
use Laravel\Passport\HasApiTokens;
use phpDocumentor\Reflection\Types\False_;


trait HelperTrait
{
    use HasApiTokens;
    /**
     *  Store incoming photo
     * @return photo
     * @var $folder
     * @var $photo
     */


    public function sendsms(){

    }

    public function notifyByFirebase($title, $body, $tokens, $data = [], $type = null ,$sound = 'default')        // paramete 5 =>>>> $type
    {

        $tokens = array_filter($tokens);
        $tokens = array_unique($tokens);

        $tokens = array_values($tokens);

        $registrationIDs = $tokens;

        $this->log(json_encode($registrationIDs));


        $fcmMsg = array(
            'body' => $body,
            'title' => $title,
            'sound' => $sound,
            'color' => "#203E78"
        );

        $fcmFields = array(
            'registration_ids' => $registrationIDs,
            'priority' => 'high',
            'notification' => $fcmMsg,
            'data' => $data
        );

        $server_key ='';

        $headers = array(
            'Authorization:key=' . $server_key,
            'Content-Type: application/json; charset=utf-8'
        );

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmFields));
        $result = curl_exec($ch);

        $log = json_encode($result);
        $this->log($log);

        curl_close($ch);


        return $result;
    }


    public function log($messages, $filename='')
    {
        $messages = "========================================================\n\n" . $messages . "\n\n";
        $file = __DIR__ . '/trace.log';
        if($filename != ''){
            $file = __DIR__ . '/' . $filename;
        }
        if(! File::exists($file)){
            fopen($file, "a+");
        }

        if (filesize($file) > 907200) {
            $fp = fopen($file, "r+");
            ftruncate($fp, 0);
            fclose($fp);
        }

        $myfile = fopen($file, "a+");
        fwrite($myfile, $messages);
        fclose($myfile);

    }


    public function responseJson($status, $message, $data =null, $resource = null)
    {
        if ($resource) {
            return $resource->additional([
                'status' => $status,
                'message' => $message,
                'additional_data' => $data,
                'lang' => Lang::getLocale(),
            ]);
        }


            $response = [
                'status' => $status,
                'message' => $message,
                'errors' => $data,
                'lang' => Lang::getLocale(),
            ];

        return response()->json($response);
    }

    public function returnErrors($validator)
    {
        $errors = $validator->errors();
        $error_data = [];
        foreach ($errors->all() as $error) {
            array_push($error_data, $error);
        }
        $data = $error_data;
       return $data;
    }

    function saveImage($image, $folder)
    {

        $day = Carbon::today()->day;
        $year = Carbon::today()->year;
        $month = Carbon::today()->month;
        $destinationFolder =  $folder . '/' . $year . '/' . $month . '/' . $day . '/';
        $destinationPath = public_path($destinationFolder);
        File::isDirectory($destinationFolder) or File::makeDirectory($destinationPath, 0755, true, true);
        $file_extension = strtolower($image->getClientOriginalExtension());
        $file_name = time() . '.' . $file_extension;
        $image->move($destinationPath, $file_name);
       $file_type = 'file';
       $images_array =  array(
           'apng', 'avif', 'gif','jpg', 'jpeg', 'jfif', 'pjpeg', 'pjp', 'png', 'svg', 'bmp', 'ico', 'cur', 'tif', 'tiff'
       );
       $video_array = array(
           'webm', 'mkv', 'flv', 'vob', 'ogv', 'ogg', 'drc', 'mng', 'avi', 'mov', 'qt', 'MTS', 'M2TS', 'TS', 'wmv', 'yuv', 'rm', 'rmvb', 'viv', 'asf', 'amv', 'amv', 'mp4', 'm4p' , 'm4v', 'mpg', 'mp2', 'mpeg', 'mpe', 'mpv ', 'm4v', 'svi', '3gp',
       );

       $voice_array = array(
        'mp3',
       );

       if (in_array($file_extension , $images_array)){
           $file_type = 'image';

       }
        if (in_array($file_extension, $video_array )) {
            $file_type = 'video';

        }
        if (in_array($file_extension, $voice_array)) {
            $file_type = 'voice';

        }

        return
            [
                'file_path'=>$destinationFolder . $file_name,
                'file_type'=>$file_type,


            ];

    }

    function updateImage($image, $folder, $old_image)
    {
        if ($old_image) {
            if (file_exists(public_path() . '/' . $old_image)) {
                unlink(public_path() . '/' . $old_image);
            }
        }
        $day = Carbon::today()->day;
        $year = Carbon::today()->year;
        $month = Carbon::today()->month;
        $destinationFolder = '/images/' . $folder . '/' . $year . '/' . $month . '/' . $day . '/';
        $destinationPath = public_path($destinationFolder);
        File::isDirectory($destinationPath) or File::makeDirectory($destinationPath, 0755, true, true);
        $file_extension = strtolower($image->getClientOriginalExtension());
        $file_name = time() . '.' . $file_extension;
        $image->move($destinationPath, $file_name);


        return $destinationFolder . $file_name;

    }


    /**
     *  Delete Image
     * @param string $image
     * @param string $image_folder
     * @return void
     */
    function deleteImage($image, $image_folder)
    {

        // Find the path for this image
        $image_path = public_path() . '/' . $image_folder . '/' . $image;

        // Delete image
        File::delete($image_path);
    }


// Soft delete for products
    protected function paginated($items, $perPage)
    {
        $pageStart = request('page', 1);
        $offSet = ($pageStart * $perPage) - $perPage;
        $itemsForCurrentPage = $items->slice($offSet, $perPage);

        return new LengthAwarePaginator(
            $itemsForCurrentPage, $items->count(), $perPage,
            Paginator::resolveCurrentPage(),
            ['path' => Paginator::resolveCurrentPath()]
        );
    }

    function paginateTheResult($items, $perPage)
    {
        $pageStart = request('page', 1);
        $offSet = ($pageStart * $perPage) - $perPage;
        $itemsForCurrentPage = $items->slice($offSet, $perPage);

        $itemsForCurrentPage = $itemsForCurrentPage->values();

        return new LengthAwarePaginator(
            $itemsForCurrentPage, $items->count(), $perPage,
            Paginator::resolveCurrentPage(),
            ['path' => Paginator::resolveCurrentPath()]
        );
    }


    function generateRandomString($length = 3)
    {
        $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }


    public function sendsmsEgypt($mobile, $message)
    {
        $user = '';
        $pass = '';
        $sender = '';

        $data = [
            'username' => $user,
            'password' => $pass,
            'language' => 2,
            'sender' => $sender,
            'mobile' => $mobile,
            'message' => $message,
        ];

        $url = 'https://www.smsmisr.com/api/send/';

        $response = Curl::to($url)->withData($data)->get();
        $this->log( json_encode($response) , 'sms-trace.log');
        return $response;
    }

}
