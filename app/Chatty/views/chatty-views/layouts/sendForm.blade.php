<div class="messenger-sendCard">
    <form id="message-form" method="POST" action="{{ route('send.message') }}" enctype="multipart/form-data">
        @csrf
        <div  style="display: flex;">
            <label id="recordButton">
                <span  class="fa fa-microphone" aria-hidden="true"></span>
            </label>

            <label id="stopButton" class="inactive">
                <span  class="fa fa-microphone" style="color:red;" aria-hidden="true"></span>
            </label>

            <label>
                <span class="fas fa-paperclip"></span>
                <input disabled='disabled' type="file" class="upload-attachment" name="file" accept="video/*, audio/*, image/*, .txt, .rar, .zip" />
            </label>
        </div>

        <textarea readonly='readonly' name="message" class="m-send app-scroll" placeholder="Type a message.."></textarea>
        <button disabled='disabled'><span class="fas fa-paper-plane"></span></button>

    </form>
</div>

<div class="playback ">
    <div class="help-tip">
        <audio src="" controls id="audio-playback" class="hidden"></audio>
        <p>
            <label id="cancelButton">
                <span  class="fa fa-trash" style="color:red;" aria-hidden="true"></span>
            </label>
           <label id="sendButton">
                <span  class="fa fa-paper-plane" aria-hidden="true"></span>
            </label>

        </p>
    </div>
</div>
<a href="" class="hidden" id="downloadButton">Download</a>

<style>

    #sendButton, #cancelButton{
        cursor: pointer;
    }
    #sendButton span, #cancelButton span{
        padding: 15px;
    }
    /* The icon */
    .help-tip{

        transform: translate(0, 0);

    }

    .help-tip:before{
        content:'';
        font-family: sans-serif;
        font-weight: normal;
        color:#444;
    }

    .help-tip:hover p{
        display:block;
        transform-origin: 100% 0%;
        -webkit-animation: fadeIn 0.3s ease;
        animation: fadeIn 0.3s ease;
    }

    /* The tooltip */
    .help-tip p {
        display: none;
        font-family: sans-serif;
        text-rendering: optimizeLegibility;
        -webkit-font-smoothing: antialiased;
        text-align: center;
        background-color: #FFFFFF;
        padding: 12px 16px;
        /*width: 178px;*/
        height: auto;
        position: absolute;
        left: 0;
        transform: translate(-50%, 5%);
        border-radius: 3px;
        /* 	border: 1px solid #E0E0E0; */
        box-shadow: 0 0px 20px 0 rgba(0,0,0,0.1);
        color: #37393D;
        font-size: 20px;
        line-height: 18px;
        z-index: 99;
        bottom: 32px;
    }


    /* The pointer of the tooltip */
    .help-tip p:before {
        position: absolute;
        content: '';
        width: 0;
        height: 0;
        border: 10px solid transparent;
        border-bottom-color:#FFFFFF;
        top: -9px;
        left: 50%;
        /*transform: translate(-50%, -50%);*/
    }

    /* Prevents the tooltip from being hidden */
    .help-tip p:after {
        width: 10px;
        height: 40px;
        content:'';
        position: absolute;
        top: -40px;
        left: 0;
    }

    /* CSS animation */
    @-webkit-keyframes fadeIn {
        0% { opacity:0; }
        100% { opacity:100%; }
    }

    @keyframes fadeIn {
        0% { opacity:0; }
        100% { opacity:100%; }
    }

    #audio-playback {
         width: 320px !important;
        height: 50px;
    }

    @media (max-width: 643px) {
        #stopButton {
            margin: 0 !important;
        }
    }
</style>
