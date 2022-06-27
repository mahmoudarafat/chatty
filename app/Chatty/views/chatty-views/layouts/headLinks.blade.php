<title>{{ config('chatify.name') }}</title>

{{-- Meta tags --}}
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="id" content="{{ $id }}">
<meta name="type" content="{{ $type }}">
<meta name="messenger-color" content="{{ $messengerColor }}">
<meta name="csrf-token" content="{{ csrf_token() }}">
<meta name="url" content="{{ url('/') . '/' . config('chatify.routes.prefix')  }}" data-user="{{ Auth::user()->id }}">

<link href="{{ asset('assets/css/select2.min.css') }}" rel="stylesheet" />

{{-- scripts --}}
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="{{ asset('chatify-assets/js/font.awesome.min.js') }}"></script>
<script src="{{ asset('chatify-assets/js/autosize.js') }}"></script>
<script src="{{ asset('js/app.js') }}"></script>
<script src='https://unpkg.com/nprogress@0.2.0/nprogress.js'></script>

{{-- styles --}}
<link rel='stylesheet' href='https://unpkg.com/nprogress@0.2.0/nprogress.css'/>
<link href="{{ asset('chatify-assets/css/style.css') }}" rel="stylesheet" />
<link href="{{ asset('chatify-assets/css/'.$dark_mode.'.mode.css') }}" rel="stylesheet" />
<link rel="stylesheet" href="{{asset('chatify-assets/recorder/manage-audio.css')}}">

<style>

    .sender_name{
        color: #4f82e1;
        float: right;
        font-size: 12px;
        padding-right: 20px;
        padding-top: 15px;
    }

    .messenger-sendCard{
        /*max-height: 36px;*/
    }
</style>
{{-- Messenger Color Style--}}
@include('chatty-views.layouts.messengerColor')
