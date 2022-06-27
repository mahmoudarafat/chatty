<!DOCTYPE html>
<html>

<head>
    <title> تسجيل الدخول </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="shortcut icon" href="{{asset('assets/img/fav/favicon.ico" type="image/x-icon')}}"/>
    <link rel="apple-touch-icon" href="{{asset('assets/img/fav/apple-touch-icon.png')}}"/>
    <link rel="apple-touch-icon" sizes="57x57" href="{{asset('assets/img/fav/apple-touch-icon-57x57.png')}}"/>
    <link rel="apple-touch-icon" sizes="72x72" href="{{asset('assets/img/fav/apple-touch-icon-72x72.png')}}"/>
    <link rel="apple-touch-icon" sizes="76x76" href="{{asset('assets/img/fav/apple-touch-icon-76x76.png')}}"/>
    <link rel="apple-touch-icon" sizes="114x114" href="{{asset('assets/img/fav/apple-touch-icon-114x114.png')}}"/>
    <link rel="apple-touch-icon" sizes="120x120" href="{{asset('assets/img/fav/apple-touch-icon-120x120.png')}}"/>
    <link rel="apple-touch-icon" sizes="144x144" href="{{asset('assets/img/fav/apple-touch-icon-144x144.png')}}"/>
    <link rel="apple-touch-icon" sizes="152x152" href="{{asset('assets/img/fav/apple-touch-icon-152x152.png')}}"/>
    <link rel="apple-touch-icon" sizes="180x180" href="{{asset('assets/img/fav/apple-touch-icon-180x180.png')}}"/>

    <link href="{{asset('assets/css/bootstrap.css')}}" rel="stylesheet">
    <link href="{{asset('assets/css/font-awesome.min.css')}}" rel="stylesheet">
    <link href="{{asset('assets/css/animate.css')}}" rel="stylesheet">
    <link href="{{asset('assets/css/style.css')}}" rel="stylesheet">
    <link href="{{asset('assets/css/sidebar.css')}}" rel="stylesheet">
    <link href="{{asset('assets/css/bootstrap.rtl.min.css')}}" rel="stylesheet">
    <link href="{{asset('assets/css/media.css')}}" rel="stylesheet">
    <script src="{{asset('assets/js/html5shiv.min.js')}}"></script>
    <script src="{{asset('assets/js/respond.min.js')}}"></script>
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">Al-Badr Sales</h1>

        </div>
        <h3>مرحبا بك فى Al-Badr Dashboard</h3>

        @if($errors->any())
            <ul>
            @foreach($errors as $error)
            <li>{{ $error }}</li>
            @endforeach
            </ul>
            @endif

@if(session('error'))

<p class="alert alert-danger">{{ session('error') }}</p>
    @endif
        <form class="m-t" role="form" action="{{route('postLogin')}}" method="post">
            @csrf
            <div class="form-group">
                <input type="text" class="form-control" placeholder="اسم المستخدم " required="required"
                       name="user_name">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="كلمة المرور  " required="required"
                       name="password">
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">دخول</button>

        </form>


        @include('flash::message')

    </div>
</div>
<script src="{{asset('assets/js/respond.min.js')}}"></script>

<script src="{{asset('assets/js/jquery-3.3.1.min.js')}}"></script>
<script src="{{asset('assets/js/bootstrap.min.js')}}"></script>
<script src="{{asset('assets/js/metisMenu/jquery.metisMenu.js')}}"></script>
<script src="{{asset('assets/js/slimscroll/jquery.slimscroll.min.js')}}"></script>

<script src="{{asset('assets/js/plugins.js')}}"></script>
<script src="{{asset('assets/js/inspinia.js')}}"></script>

</body>

</html>
