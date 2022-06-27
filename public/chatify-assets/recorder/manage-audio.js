// audio recorder
let recorder, audio_stream;
const recordButton = document.getElementById("recordButton");
recordButton.addEventListener("click", startRecording);
$(document).find('#stopButton').addClass('hidden');
// stop recording
const stopButton = document.getElementById("stopButton");
stopButton.addEventListener("click", stopRecording);
stopButton.disabled = true;

// set preview
const preview = document.getElementById("audio-playback");

function scrollToBottom(container) {
    $(container)
        .stop()
        .animate({
            scrollTop: $(container)[0].scrollHeight,
        });
}

// set download button event
const downloadAudio = document.getElementById("downloadButton");
downloadAudio.addEventListener("click", downloadRecording);
var blob = '';


function startRecording() {
    // button settings

    recordButton.disabled = true;

    $(document).find('#recordButton').addClass('hidden');
    $(document).find('#stopButton').removeClass('hidden');

    $("#recordButton").addClass("button-animate");

    $("#stopButton").removeClass("inactive");
    stopButton.disabled = false;

    if (!$("#audio-playback").hasClass("hidden")) {
        $("#audio-playback").addClass("hidden")
    };

    if (!$("#downloadContainer").hasClass("hidden")) {
        $("#downloadContainer").addClass("hidden")
    };

    navigator.mediaDevices.getUserMedia({ audio: true })
        .then(function (stream) {
            console.log(">>>>Streaming.......")
            audio_stream = stream;
            recorder = new MediaRecorder(stream);
            console.log(">>>>rec: ", recorder)
            // when there is data, compile into object for preview src
            recorder.ondataavailable = function (e) {
                console.log(">>>>", "available")
                blob = e.data;
                const voice_url = URL.createObjectURL(e.data);
                console.log(">>>>url: ", voice_url)
                preview.src = voice_url;

                // set link href as blob url, replaced instantly if re-recorded
                downloadAudio.href = voice_url;
            };
            recorder.start();

            timeout_status = setTimeout(function () {
                console.log("5 min timeout");
                stopRecording();
            }, 300000);
        });
}

function stopRecording() {
    recorder.stop();
    audio_stream.getAudioTracks()[0].stop();

    // buttons reset
    recordButton.disabled = false;

    $("#recordButton").removeClass("button-animate");

    $("#stopButton").addClass("inactive");
    stopButton.disabled = true;

    $("#audio-playback").removeClass("hidden");

    $("#downloadContainer").removeClass("hidden");

    recordButton.addEventListener("click", startRecording);
    $(document).find('#stopButton').addClass('hidden');

    scrollToBottom(messagesContainer)

}

function downloadRecording(){
    var name = new Date();
    var res = name.toISOString().slice(0,10)
    console.log(">>>>>>>>>>>>>>>", downloadAudio);
    downloadAudio.download = res + '.mp3';
}

$(document).on('click', '#cancelButton', function(){
    resetRecordButtons()
});

function resetRecordButtons(){



    $(document).find('#stopButton').addClass('hidden');

    $("#stopButton").addClass("inactive");
    stopButton.disabled = true;

    recordButton.disabled = false;
    $(document).find('#recordButton').removeClass('hidden');

    if (!$("#audio-playback").hasClass("hidden")) {
        $("#audio-playback").addClass("hidden")
    };

}


$(document).on('click', '#sendButton', function(){
    sendMessage(blob);
    resetRecordButtons();
});

