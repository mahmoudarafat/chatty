<?php

namespace App\Chatty\Models;

use App\Chatty\Facades\ChattyMessenger as Chatty;
use App\Models\Account;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Str;

class ChMessage extends Model
{
    use SoftDeletes;

    protected $hidden = ['sender', 'end_type'];

    protected $appends = ['sender_name', 'msg_type', 'file_path', 'sender_type', 'msg_date', 'chat_status'];

    public function getChatStatusAttribute()
    {
        $data = [
            'by_client' => 'في انتظار الرد',
            'by_agent' => 'في انتظار المتابعة',
            'end_chat' => 'محادثة منتهية',
        ];
        return  $data[$this->end_type] ?? 'محادثة مستمرة';
    }

    public function getMsgDateAttribute()
    {
        return $this->created_at->format('Y-m-d h:i:s A');
    }

    public function getSenderNameAttribute(){
        return $this->sender->name ?? '';
    }

    public function getSenderTypeAttribute(){
        if($this->type == 'end'){
            return 'end';
        }
        $current = URL::current();
        $contains = Str::contains($current, ['chat-api']);
        if(!$contains){
            return optional($this->sender)->user_type == 'agent' ? 'sender' : 'default';
        }
        return optional($this->sender)->user_type == 'agent' ? 'default' : 'sender' ;
    }

    public function getMsgTypeAttribute(){
        return $this->getFileType($this->attachment);
    }

    public function getFilePathAttribute(){
        $attachmentData = $this->attachment ? json_decode($this->attachment) : [];
        $file_name = '';
        if (isset($attachmentData->new_name)) {
            $file_name = $attachmentData->new_name;
        }
        $download_path = '';
        if (strlen($file_name)) {
            $path = config('chatify.attachments.folder') . '/' . $file_name;
            if (Chatty::storage()->exists($path)) {
                $download_path = Chatty::storage()->url($path);
            }
        }
        return $download_path;
    }

    public function sender()
    {
        return $this->belongsTo(Account::class, 'from_id', 'id');
    }

    public function receiver()
    {
        return $this->belongsTo(Account::class, 'to_id', 'id');
    }

    public function getFileType($fileString)
    {
        $images = ['png', 'jpg','jpeg','gif'];
        $docs = ['doc', 'docx', 'xml', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'odt', 'pdf','zip','rar', '7z'];
        $videos = ['mp4', 'mkv'];
        $audio = ['mp3', 'wav', 'm4a'];

        $fileString = Str::lower($fileString);

        $isImage = Str::contains($fileString, $images);
        if($isImage){
            return 'image';
        }
        $isVideo = Str::contains($fileString, $videos);
        if($isVideo){
            return 'video';
        }
        $isAudio = Str::contains($fileString, $audio);
        if($isAudio){
            return 'audio';
        }
        $isDoc = Str::contains($fileString,  $docs);
        if($isDoc){
            return 'file';
        }
        return 'text';
    }

    public function getRateHtmlAttribute()
    {
        $rate = (int) $this->rate;
        $still = 5 - $rate;
        $rate_html = '';
        for($i=0; $i < $rate; $i ++){
            $rate_html .= '<i class="fa fa-star" style="color: goldenrod;"></i>';
        }
        for($j=0; $j < $still; $j ++){
            $rate_html .= '<i class="fa fa-star" style="color: gray;"></i>';
        }
        return $rate_html;
    }

}
