<!DOCTYPE html>
{{--<meta name="csrf-token" content="{{ csrf_token() }}">--}}
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

<!--
   To change this license header, choose License Headers in Project Properties.
   To change this template file, choose Tools | Templates
   and open the template in the editor.
   -->
<html>
<head>
    @yield('title')

    @include('layouts.mobile-styles')
</head>
<body>
<div id="wrapper">


        <div id="page-wrapper" class="gray-bg">

            <div class="wrapper wrapper-content">
                @yield('content')
            </div>
        </div>
        @yield('chatModal')
        @include('layouts.mobile-scripts')
</div>
</body>
</html>
