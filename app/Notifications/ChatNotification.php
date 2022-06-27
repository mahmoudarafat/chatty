<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\Models\ChatChannel as ChatChannelModel;

class ChatNotification extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(ChatChannelModel $channel, $type, $title_ar, $title_en, $content_ar, $content_en)
    {
        $this->channel = $channel;
        $this->type = $type;
        $this->title_ar = $title_ar;
        $this->title_en = $title_en;
        $this->content_en = $content_en;
        $this->content_ar = $content_ar;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line('The introduction to the notification.')
                    ->action('Notification Action', url('/'))
                    ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'channel_id' => $this->channel->id,
//            'client_id' => auth()->guard('api')->user()->id ?? 11,
            'type' => $this->type,
            'title_ar' => $this->title_ar,
            'title_en' => $this->title_en,
            'content_ar' => $this->content_ar,
            'content_en' => $this->content_en,
        ];
    }
}
