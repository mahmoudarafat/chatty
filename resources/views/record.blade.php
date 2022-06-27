<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Audio Recorder Example</title>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="{{asset('recorder/manage-audio.css')}}">
    <style>
        p.lead { color: #fff;font-size: 1.5rem; font-weight: 300; text-align: center; }
    </style>
</head>
<body>
<h1>Audio Recorder Example</h1>
<p class="lead">A jQuery-powered online voice recorder that records voice from the microphone using the MediaRecorder Web API and saves it as a wav file.</p>
<div class="audio-record">
    <button id="recordButton">Start Recording</button>
    <button id="stopButton" class="inactive hidden">Stop</button>
</div>

<div class="playback">
    <audio src="" controls id="audio-playback" class="hidden"></audio>
</div>

<div class="download">
    <button class="hidden" id="downloadContainer">
        <a href="" download="" id="downloadButton">Download Audio</a>
    </button>
</div>

<script src="{{asset('recorder/manage-audio.js')}}"></script>

