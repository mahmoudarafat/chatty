<template>
    <div class="container">
        <h3 class="text-center">Messaging</h3>


        <div class="chat-room">
            <div class="row">




                <div class="col-md-5" style="background: #eee; padding-top: 10px;">
                    <chat-clients
                        :recentchats="chats"
                        @init-chat="initChatView"
                    ></chat-clients>

                </div>

                <div class="col-md-7">



                    <chat-messages
                        :chat_messages="messages"
                        @send-message="sendMessage"
                    ></chat-messages>


                </div>
                <div class="clearfix"></div>
            </div>
        </div>














        <div v-if="notify">
            <div id="notification-box" class="notification-box">
                <a href="#" id="notification-close" @click="closed()" title="close"
                >x</a
                >

                <div class="notification-data">
                    <div class="notification-title">
                        <p id="title">
                            {{ from }}
                            <br/>
                            <span id="title" style="font-size: 12px; font-weight: 600">{{
                                    title
                                }}</span>
                        </p>
                    </div>

                    <div class="notification-notice">
                        <p id="subject">{{ subject }}</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
import ChatClients from "./ChatClients";
import ChatMessages from "./ChatMessages";
import firebase from "firebase/app";
import messaging from "firebase/messaging";

export default {
    name: "ChatView",
    components: {
        ChatClients,
        ChatMessages,
    },

    data() {
        return {
            channel_id: null,
            open: true,
            chats: [],
            tasks: [],
            messages: [],
            Images: null,
            message: null,
            client: null,
            countDown: 0,
            buttonClass: "hidden",
            counterClass: "",
            lastMessage: "",

            title: "",
            from: "",
            subject: "",
            userimg: "",
            messaging: firebase.messaging(),
            currentMessage: "",
            notify: false,
        };
    },
    methods: {
        getRecentClientChats: function () {
            axios.post("getChats").then((res) => {
                this.chats = res.data.data;
            });
        },
        initChatView: function (chatObject) {
            var chatId = chatObject.id;

            var currentChat = this.getCurrentChat(chatId);

            this.getMessages(currentChat);
            this.getClientInfo(currentChat);
        },

        getMessages(channel) {
            this.channel_id = channel.id;
            channel.agentUnreadCount = 0;
            this.channel_id = channel.id;
            axios.post("getMessages", {id: channel.id}).then((res) => {
                this.messages = res.data.data;
                this.lastMessage = res.data.last_message;

                this.countDown = 40;
                this.countDownTimer();
            });
        },
        getClientInfo(channel) {
            axios
                .post("getClientInfo", {account_id: channel.account_id})
                .then((res) => {
                    this.tasks = res.data.data;
                    this.client = res.data.additional_data.client;
                });
        },
        countDownTimer() {
        },
        sendMessage(msgObject) {
            //this.messages.push(msgObject.msg);

            var push = "push";
            var message = msgObject.msg;
            const formData = new FormData();
            formData.append("file", this.Images);
            formData.append("message", message);
            formData.append("push", push);

            const headers = {"Content-Type": "multipart/form-data"};

            if (message || this.Images) {
                axios
                    .post(`send/` + this.channel_id, formData, {headers})
                    .then((res) => {
                        var insertedMsg = res.data.data;
                        this.messages.push(insertedMsg);

                        var currentChat = this.getCurrentChat();
                        currentChat.last_message = insertedMsg.message;
                        currentChat.last_message_time = insertedMsg.time;
                        this.message = '';
                    });
            }
        },
        getCurrentChat(current_channel_id = null) {
            if (current_channel_id == null) {
                current_channel_id = this.channel_id;
            }

            var currentChat = [];
            this.chats.forEach(function (chat, index) {
                chat.open = false;
                if (current_channel_id == chat.id) {
                    chat.open = true;
                    currentChat = chat;
                }
            });
            return currentChat;
        },
        uploadFile() {
            this.Images = this.$refs.file.files[0];
        },

        receiveMessage() {
            try {
                this.messaging.onMessage((payload) => {
                    // debugger
                    this.currentMessage = payload;
                    console.log(this.currentMessage);
                    console.log("Message received. ", payload);
                    let message;
                    message =
                        payload.data.username +
                        ":\n\n" +
                        payload.data.message +
                        " \n\n\n\n\n\n " +
                        payload.data.date;
                    this.setNotificationBoxForm(
                        payload.data.date,
                        payload.data.username,
                        payload.data.message
                    );

                    this.notify = true;
                    setTimeout(() => {
                        // this.notify = false;
                    }, 6000);
                });
            } catch (e) {
                console.log(e);
            }
        },

        setNotificationBoxForm(title, from, subject) {
            this.title = title;
            this.from = from;
            this.subject = subject;
        },
    },
    created() {

        try {
            firebase
                .messaging()
                .requestPermission()
                .then(() => {
                    console.log("notification permission granted");
                    return firebase
                        .messaging()
                        .getToken()
                        .then((token) => {

                            localStorage.setItem('token_id', token)

                            console.log("token: " + token);
                        })
                        .catch((err) => {
                            console.log("no token: " + err);
                        });
                });
        } catch (e) {
            console.log("e: " + e);
        }

        this.getRecentClientChats();
        this.receiveMessage();


    },
};
</script>

<style>


/*==================================================Chat Room CSS==================================================*//*Chat Contact List*/
.chat-room ul.contact-list li {
    width: 100%;
    margin-bottom: 0;
}

.chat-room ul.contact-list li a {
    border: none;
    padding: 10px 0;
    border-bottom: 1px solid #f1f2f2 !important;
}

.chat-room ul.contact-list li a:hover, .chat-room ul.contact-list li a:active, .chat-room ul.contact-list li a:focus {
    border: none;
    border-bottom: 1px solid #8dc63f !important;
    border-radius: 0;
    cursor: pointer;
    background: none;
}

.chat-room ul.contact-list li a .contact {
    margin-left: 10px;
    margin-right: 10px;
}

.chat-room ul.contact-list li a .contact .msg-preview {
    margin-left: 50px;
}

.chat-room ul.contact-list li a .contact .msg-preview small {
    position: absolute;
    top: 20px;
    right: 10px;
}

.chat-room ul.contact-list li a .contact .msg-preview .chat-alert {
    background: red;
    text-align: center;
    border-radius: 4px;
    padding: 1px 6px;
    position: absolute;
    right: 10px;
    bottom: 20px;
    color: #fff;
}

.chat-room ul.contact-list li a .contact .msg-preview .seen, .replied {
    color: #939598;
    position: absolute;
    right: 10px;
    bottom: 20px;
    font-size: 14px;
}

/*Chat Messages*/
.chat-room .chat-body ul.chat-message {
    padding: 0;
    margin: 0;
}

.chat-room .chat-body ul.chat-message li {
    list-style: none;
    margin-bottom: 20px;
}

.chat-room .chat-body ul.chat-message li.left .chat-item {
    background: rgba(141, 198, 63, .1);
    margin-left: 50px;
    padding: 5px 10px;
    position: relative;
    border-radius: 10px;
}

.chat-room .chat-body ul.chat-message li.left .chat-item::before {
    border-bottom: 10px solid transparent;
    border-right: 8px solid rgba(141, 198, 63, .1);
    border-top: 10px solid transparent;
    content: "";
    height: 0;
    left: -8px;
    position: absolute;
    top: 10px;
    width: 0;
}

.chat-room .chat-body ul.chat-message li.left .chat-item .chat-item-header {
    border-bottom: 1px dotted #caef8e;
    margin-bottom: 10px;
}

.chat-room .chat-body ul.chat-message li.right .chat-item {
    background: rgba(39, 170, 225, .1);
    margin-right: 50px;
    padding: 5px 10px;
    position: relative;
    border-radius: 10px;
}

.chat-room .chat-body ul.chat-message li.right .chat-item::after {
    border-bottom: 10px solid transparent;
    border-left: 8px solid rgba(39, 170, 225, .1);
    border-top: 10px solid transparent;
    content: "";
    height: 0;
    right: -8px;
    position: absolute;
    top: 10px;
    width: 0;
}

.chat-room .chat-body ul.chat-message li.right .chat-item .chat-item-header {
    border-bottom: 1px dotted #bce8f7;
    margin-bottom: 10px;
}

.chat-room .chat-body ul.chat-message li .chat-item .chat-item-header h5 {
    color: #4d4d4d;
}

.chat-room .chat-body ul.chat-message li .chat-item .chat-item-header small {
    position: absolute;
    top: 15px;
    right: 20px;
}

.chat-room .send-message {
    background: #f8f8f8;
    padding: 20px;
    border-radius: 4px;
}

.chat-room .send-message button {
    background: #000;
    color: #fff;
}

/*CSS for custom scrollbar*/
.scrollbar-wrapper.scrollbar-dynamic {
    max-height: none;
}

.scrollbar-wrapper.tab-content {
    overflow-y: auto;
    height: 360px;
}

.scrollbar-wrapper.contact-list {
    overflow-y: auto;
    height: 400px;
    border: none;
    margin-bottom: 20px;
}

.scrollbar-wrapper {
    height: 100%;
    overflow: auto;
    width: 100%;
}




</style>


<!-- notification alert styles -->
<style>
.notification-box {
    display: flex;
    position: absolute;
    right: 16px;
    /* bottom: 10px; */
    width: 30%;
    height: 100px;
    background-color: #c1c1c1;
    z-index: 999;
    box-shadow: 11px 10px 11px 0px;
    border-radius: 10px;
}

#notification-close {
    position: absolute;
    color: #777;
    font: 14px;
    right: 5px;
    text-decoration: none;
    text-shadow: 0 1px 0 #fff;
    top: 2px;
    z-index: 10;
    cursor: pointer;
}

.notification-data {
    margin: 0 20px;
}

.notification-data p {
    margin: 10px 0;
}

.notification-notice p {
    font-size: 14px;
    font-weight: 400;
}

.notification-title p {
    font-size: 18px;
    font-weight: bold;
    line-height: 18px;
}

.notification-time small {
    font-size: 12px;
}

.notification-wall-number small {
    font-size: 8px;
}

img {
    width: 30px;
}
</style>
