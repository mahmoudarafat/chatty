@extends('layouts.app')

@section('styles')

    <style href="{{ asset('css/style-chat.css') }}" ></style>


    <style>

        #chat-discussion {
            /*height: 200px;*/
            overflow-y: auto;
        }
    </style>
@stop






@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="col-md-12">
                <h1>Welcome....</h1>
                  </div>
            </div>
        </div>
    </div>

@stop
@section('chatModal')
    @include('layouts.chat-modal')
@stop
