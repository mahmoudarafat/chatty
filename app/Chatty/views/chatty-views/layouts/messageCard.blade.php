{{-- -------------------- The default card (white) -------------------- --}}

{{--{{ dump($viewType) }}--}}

@if($viewType == 'default')
{{--    @if($from_id != $to_id )--}}
    <div class="message-card" data-id="{{ $id }}">

        {{-- If attachment is an image --}}
        @if(@$attachment[2] == 'image')
            <div class="image-file chat-image" style="width: 250px; height: 150px;background-image: url('{{ $chattyObject->getAttachmentUrl($attachment[0]) }}')">
            </div>
        @endif
        @if(@$attachment[2] == 'audio')
            <audio controls id="audio-msg" src="{{ $chattyObject->getAttachmentUrl($attachment[0]) }}"></audio>
        @endif
        <p>

            @if(in_array( @$attachment[2], [null, '', 'text' ] ) )
                {!!  nl2br($message)  !!}
            @endif
            <sub title="{{ $fullTime }}"><span>{{ $time }}</span></sub>
            {{-- If attachment is a file --}}
            @if( ! in_array(@$attachment[2], [null, '', 'image', 'text', 'audio']))
                <a href="{{@$file_path}}" style="color: #595959;" class="file-download" download>
                <span class="fas fa-file"></span> {{$attachment[1] ?? '' }}</a>
            @endif
        </p>

    </div>
{{--    @endif--}}
@endif

{{-- -------------------- Sender card (owner) -------------------- --}}
@if($viewType == 'sender')

    <span class="sender_name">{{ $sender_name }}</span>
    <div class="message-card mc-sender" title="{{ $fullTime }}" data-id="{{ $id }}">
        {{-- If attachment is an image --}}
        @if(@$attachment[2] == 'image')
            <div class="image-file chat-image" style="margin-top:10px;width: 250px; height: 150px;background-image: url('{{ $chattyObject->getAttachmentUrl($attachment[0]) }}')">
            </div>
        @endif
        @if(@$attachment[2] == 'audio')
            <audio controls id="audio-msg"  src="{{ $chattyObject->getAttachmentUrl($attachment[0]) }}"></audio>
        @endif
        <div class="chatify-d-flex chatify-align-items-center" style="flex-direction: row-reverse; justify-content: flex-end;">
            @if(config('chatify.delete_messages'))
                <i class="fas fa-trash chatify-hover-delete-btn" data-id="{{ $id }}"></i>
            @endif
            <p style="margin-left: 5px;">
{{--                {!! ($message == null && $attachment != null && @$attachment[2] != 'file') ? $attachment[1] : nl2br($message) !!}--}}
{{--                {!!  in_array( @$attachment[2], ['text' ] )  ? '' : nl2br($message) !!}--}}

                @if(in_array( @$attachment[2], [null, '', 'text' ] ) )
                    {!!  nl2br($message)  !!}
                @endif
                <sub title="{{ $fullTime }}">
                    <span class="fas fa-{{ $seen > 0 ? 'check-double' : 'check' }} seen"></span>
                    <span title="{{ $fullTime }}" class="message-time">{{ $time }}</span>
                </sub>
                {{-- If attachment is a file --}}
                @if( ! in_array(@$attachment[2], [null, '', 'image', 'text', 'audio']))
                <a href="{{@$file_path}}" download class="file-download">
                    <span class="fas fa-file"></span> {{$attachment[1] ?? '' }}</a>
                @endif
            </p>

        </div>

    </div>

@endif

@if($viewType == 'end')
    <div class="message-card message-card-end" data-id="{{ $id }}">
       <hr class="hr">
        <div class="message-ended">

                <span style="direction: ltr;">{!!  nl2br($message)  !!}</span>

         <span style="direction: ltr" title="{{ $fullTime }}">{{ $fullTime }}</span>
            @if($chatStatus == 'end_chat')
                <span>{!! $rate !!}</span>
                <span style="color:salmon">{{ $notes  }}</span>
            @endif
        </div>

        <hr class="hr">
    </div>
@endif

<style>
    .message-ended{
        display: contents !important;
        color: #349bed;
    }
    .chat-image {
        margin-right: 5% !important;
    }

    .message-card-end{
        align-items: center !important;
        direction: ltr;
    }

    .hr{
        color: #cdcdcd;
        height: 1.25px;
        width: 100%;
        background: #cdcdcd;
    }
</style>
