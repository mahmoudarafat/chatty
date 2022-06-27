<script src="https://js.pusher.com/7.0.3/pusher.min.js"></script>
<script>
    // Enable pusher logging - don't include this in production
    Pusher.logToConsole = true;

    var pusher = new Pusher("{{ config('chatify.pusher.key') }}", {
        encrypted: true,
        cluster: "{{ config('chatify.pusher.options.cluster') }}",
        authEndpoint: '{{route("pusher.auth")}}',
        auth: {
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        }
    });

    // Bellow are all the methods/variables that using php to assign globally.
    const allowedImages = {!! json_encode(config('chatify.attachments.allowed_images')) !!} || [];
    const allowedFiles = {!! json_encode(config('chatify.attachments.allowed_files')) !!} || [];
    const getAllowedExtensions = [...allowedImages, ...allowedFiles];
    const getMaxUploadSize = {{ $chattyObject->getMaxUploadSize() }};
</script>
<script src="{{ asset('chatify-assets/js/code.js') }}"></script>

<script src="{{asset('chatify-assets/recorder/detector.js')}}"></script>
<script src="{{asset('chatify-assets/recorder/manage-audio.js')}}"></script>

<script src="{{ asset('chatify-assets/js/jquery.longpress.js') }}"></script>
<script src="{{ asset('chatify-assets/js/jquery.timeago.min.js') }}"></script>

<script src="{{ asset('assets/js/select2.min.js') }}"></script>
<script>

    $('body').attr('oncontextmenu', 'return false;')

    $(document).on("mousedown", ".messenger-list-item", function (e) {
        e.preventDefault();
        var u_id = $(this).data('contact')
        u_id = Number(u_id)
        if (e.which === 3) {
            // alert('Right mouse button was clicked!');
            openMenu(u_id);
        }
        return false;
    });

    $(document).find(".messenger-list-item").longpress(function (e) {
        e.preventDefault();
        var u_id = $(this).data('contact')
        u_id = Number(u_id)
        // console.log('touch screen clicked!');
        openMenu(u_id);
        return false;
    });

    function openMenu(u_id) {
        $(document).find('#client_to_change').val(u_id);
        toggleModal("chat-operations", true)
    }

    // Settings modal [cancel button]
    $(".app-modal[data-name=chat-operations]")
        .find(".app-modal-footer .cancel")
        .on("click", function () {
            toggleModal("chat-operations", false)
        });

    function toggleModal(name, bool){
        app_modal({
            show: bool,
            name: name,
        });
    }

    $('.select2').select2();

    // on submit update-chat-operations' form
    $("#update-chat-operations").on("submit", (e) => {
        e.preventDefault();
        changeAgent();
    });


    function changeAgent() {
        const formData = new FormData($("#update-chat-operations")[0]);

        $.ajax({
            url: url + "/client-agent-update",
            method: "POST",
            data: formData,
            dataType: "JSON",
            processData: false,
            contentType: false,
            beforeSend: () => {
                // close settings modal
                toggleModal("chat-operations", false)
                // Show waiting alert modal
                app_modal({
                    show: true,
                    name: "alert",
                    buttons: false,
                    body: loadingSVG("32px", null, "margin:auto"),
                });
            },
            success: (data) => {
                if (data.error) {
                    // Show error message in alert modal
                    app_modal({
                        show: true,
                        name: "alert",
                        buttons: true,
                        body: data.msg,
                    });
                } else {
                    // Hide alert modal
                    app_modal({
                        show: false,
                        name: "alert",
                        buttons: true,
                        body: "",
                    });

                    // reload the page
                    setTimeout(function(){
                        location.reload(true);
                    }, 700)

                }
            },
            error: () => {
                console.error("Server error, check your response");
            },
        });
    }

    checkChatStatus();

    setInterval(function(){
        checkChatStatus();
    }, 60*100)

    function checkChatStatus() {

        $.ajax({
            url: url + "/change-chat-status",
            method: "GET",
            data: {},
            dataType: "JSON",
            processData: false,
            contentType: false,
            beforeSend: () => {

            },
            success: (data) => {
                if (data.change) {
                    app_modal({
                        show: true,
                        name: "alert",
                        buttons: true,
                        body: "Chats updated....",
                    });
                    $(document).find(".messenger-list-item[data-contact=" + getMessengerId() + "]").click();
                }
            },
            error: () => {
                console.error("Server error, check your response");
            },
        });
    }

    $(".app-modal[data-name=alert]")
        .find(".app-modal-footer .cancel")
        .on("click", function () {
            app_modal({
                show: false,
                name: "alert",
            });
        });


    setInterval(updateMessagesTime, 40000);
    function updateMessagesTime() {
        // Update the text with the elapsed time:
        $(document).find('.message-time').each(function(){
            var msgDate = $(this).attr('title');
            console.log({msgDate})
            var timeAgo = jQuery.timeago(msgDate);
            $(this).text(timeAgo);
        })

    }

    $(document).on('click', '.end-chat', function(){

        var client_id = $(document).find('#client_to_change').val();
        console.log(client_id);
        $.ajax({
            url: url + "/end-chat?client_id="+client_id,
            method: "GET",
            dataType: "JSON",
            processData: false,
            contentType: false,
            beforeSend: () => {

            },
            success: (data) => {
                if (data.change) {

                    toggleModal("chat-operations", false)

                    app_modal({
                        show: true,
                        name: "alert",
                        buttons: true,
                        body: "Chat is Ended....",
                    });
                    setTimeout(function(){
                        window.location.href = '{{ route(config('chatify.routes.prefix')) }}';
                    }, 1500);
                }
            },
            error: () => {
                console.error("Server error, check your response");
            },
        });

    });


    // listen to contact item updates event
    channel.bind("rate-chat", function (data) {
        console.log('rate', data);
        if(getMessengerId() == data.contact_id){
            $(document).find(".messenger-list-item[data-contact=" + getMessengerId() + "]").click();
        }
    });

    function playNotification(){
        const audio = new Audio('{{ asset( 'chatify-assets/notification.mp3' ) }}');
        audio.play();
    }

</script>
