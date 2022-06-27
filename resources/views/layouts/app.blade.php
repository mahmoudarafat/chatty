<!DOCTYPE html>
<!--
   To change this license header, choose License Headers in Project Properties.
   To change this template file, choose Tools | Templates
   and open the template in the editor.
   -->
<html>
<head>
    <title>
        @yield('title')
    </title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="shortcut icon" href="{{asset('asstes/img/fav/favicon.ico')}}" type="image/x-icon"/>
    <link rel="apple-touch-icon" href="{{asset('asstes/img/fav/apple-touch-icon.png')}}"/>
    <link rel="apple-touch-icon" sizes="57x57" href="{{asset('asstes/img/fav/apple-touch-icon-57x57.png')}}"/>
    <link rel="apple-touch-icon" sizes="72x72" href="{{asset('asstes/img/fav/apple-touch-icon-72x72.png')}}"/>
    <link rel="apple-touch-icon" sizes="76x76" href="{{asset('asstes/img/fav/apple-touch-icon-76x76.png')}}"/>
    <link rel="apple-touch-icon" sizes="114x114" href="{{asset('asstes/img/fav/apple-touch-icon-114x114.png')}}"/>
    <link rel="apple-touch-icon" sizes="120x120" href="{{asset('asstes/img/fav/apple-touch-icon-120x120.png')}}"/>
    <link rel="apple-touch-icon" sizes="144x144" href="{{asset('asstes/img/fav/apple-touch-icon-144x144.png')}}"/>
    <link rel="apple-touch-icon" sizes="152x152" href="{{asset('asstes/img/fav/apple-touch-icon-152x152.png')}}"/>
    <link rel="apple-touch-icon" sizes="180x180" href="{{asset('asstes/img/fav/apple-touch-icon-180x180.png')}}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


    @include('layouts.styles')
    @stack('styles')

</head>
<body class="">
<div id="app">

    @if(auth()->check())
        @include('layouts.side-nav')
    @endif


    <div class="wrapper wrapper-content">
        @yield('content')

    </div>
</div>

</div>
@include('layouts.scripts')
@yield('scripts')
@stack('scripts')

{{--<script src="{{asset('js/app.js')}}" async defer></script>--}}

</body>
</html>
