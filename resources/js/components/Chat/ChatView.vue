<template>
    <div class="container">
        <h3 class="text-center">Messaging</h3>
        <div class="messaging">
<!--                <p>Token: {{ api_token }}</p>-->
                <hr>

<!--                    <p>URL: {{ api_url }}</p>-->

                <div class="inbox_msg">
                    <chat-clients
                        :recentchats="chats"
                        @init-chat="initChatView"
                    ></chat-clients>

                    <chat-messages
                        :loading="loading"
                        :prev_height="prevHeight"
                        :page="currentPage"
                        :current_scroll="currentScroll"
                        :onlineClient="currentClientStatus"
                        :cannotSendMsg="cannotSendMsg"
                        :chat_messages="messages"
                        @send-message="sendMessage"
                        @upload-file="uploadNewFile"
                        @confirm-upload-file="sendFileMessage"
                        @old-messages="getOlderMessages"
                    ></chat-messages>

            </div>
        </div>

        <div v-if="notify">
            <div id="notification-box" class="notification-box">
                <a href="#" id="notification-close" @click="closed()" title="close">x</a>


                <div class="notification-data">
                    <div class="notification-title">
                        <p id="title">
                            {{ from }}
                            <br />
                            <span id="title">{{ title }}</span>
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
    props: {
        userdata: Object,
        url: String
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

            currentClientStatus: false,
            cannotSendMsg: true,
            currentScroll: false,
            currentPage: 1,
            prevHeight: 0,
            currentHeight: 0,
            loading: false,
        };
    },
    methods: {
        getRecentClientChats: function () {
            axios.post("getChats").then((res) => {
                this.chats = res.data.data;
            });
        },
        initChatView: function (chatObject) {
            this.currentScroll = false
            this.currentPage = 1
            this.prevHeight = 0;
            this.currentHeight = 0;
            var chatId = chatObject.id;
            var currentChat = this.getCurrentChat(chatId);
            this.getMessages(currentChat, 1);
            this.getClientInfo(currentChat);

        },

        getMessages(channel, page=1) {
            this.loading = true;
            this.channel_id = channel.id;
            this.cannotSendMsg = false;
            channel.agentUnreadCount = 0;
            this.channel_id = channel.id;

            var oldHeight = document.querySelector(".msg_history").scrollHeight;
            this.prevHeight = oldHeight
            var This = this;
            setTimeout(function(){
                axios.post("getMessages", {id: channel.id, page : page }).then((res) => {
                    if(page > 1){
                        let firstArray = res.data.data; // 1 - 20
                        let secondArray = This.messages // 21-30
                        This.messages = firstArray.concat(secondArray) // 1 - 30

                    }else{
                        This.messages = res.data.data;
                        This.lastMessage = res.data.last_message;
                        This.countDown = 40;
                        This.countDownTimer();
                    }
                    This.loading = false;
                });
            }, 1000);

        },
        getOlderMessages(pageObject){
            var page = pageObject.page;
            page +=1;
            this.currentPage = page;
            this.currentScroll = true;
            var currentChat = this.getCurrentChat();
            this.getMessages(currentChat, page);
        },

        getClientInfo(channel) {
            axios
                .post("getClientInfo", {account_id: channel.account_id})
                .then((res) => {
                    this.tasks = res.data.data;
                    this.client = res.data.additional_data.client;
                    this.currentClientStatus = this.client.online_status


                });
        },
        countDownTimer() {
        },
        sendMessage(msgObject) {

            var push = "push";
            var message = msgObject.msg;
            var file_type = msgObject.file_type ?? 'text';
            const formData = new FormData();
            formData.append("file", this.Images);
            formData.append("message", message);
            formData.append("push", push);
            formData.append("channel_id", this.channel_id);
            formData.append("api_token", this.apiToken);
            formData.append("file_type", file_type);

            const headers = {"Content-Type": "multipart/form-data"};

            var url = this.url + '/send-chat-message'

            if (message || this.Images) {
                axios
                    .post( url , formData, {headers})
                    .then((res) => {
                        var insertedMsg = res.data.data;
                        this.insertMessage(insertedMsg)
                    });
            }
        },
        insertMessage(insertedMsg){
            if(this.channel_id > 0 && this.channel_id == insertedMsg.channel_id){

                this.messages.push(insertedMsg);

                var currentChat = this.getCurrentChat();
                currentChat.last_message = insertedMsg.message;
                currentChat.last_message_time = insertedMsg.time;
                currentChat.last_message_created = insertedMsg.created_at;

                this.message = '';
            }

        },
        getCurrentChat(current_channel_id = null) {
            if (current_channel_id == null) {
                current_channel_id = this.channel_id;
            }
            var changedStatus = this.currentClientStatus;
            var currentChat = [];
            this.chats.forEach(function (chat, index) {
                chat.open = false;

                if (current_channel_id == chat.id) {
                    chat.open = true;
                    currentChat = chat;
                    chat.online_status = changedStatus
                }
            });
            return currentChat;
        },
        uploadNewFile(msgObject) {
            var file = msgObject.fileUploaded;
            this.Images = file;
            console.log("upload ", this.Images);
        },
        sendFileMessage(msgObject) {
            var file = msgObject.fileUploaded;
            var fileType = msgObject.fileType;
            this.Images = file;
            var data = { msg: '', file_type: fileType }
            this.sendMessage(data);
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
                    var theMsg = payload.data.msg_data;
                    theMsg = JSON.parse(theMsg)
                    // console.log({theMsg})
                    this.insertMessage(theMsg)

                    setTimeout(() => {
                        this.notify = false;
                    }, 3000);
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

        updateOnlineStatus(){
            this.getRecentClientChats();
        },
        closed(){
            this.notify = false;
        },

    },
    mounted() {
        console.log("apiData", this.apiData);
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

                        })
                        .catch((err) => {

                        });
                });
        } catch (e) {
            console.log("e: " + e);
        }

        this.getRecentClientChats();
        this.receiveMessage();
        var This = this;
        setInterval(function(){
            This.updateOnlineStatus();
        }, 45000);
    },
    computed: {
        apiToken: function(){
            return this.userdata.api_token;
        }

    }
};
</script>

<style>

time{
    display: block;
    direction: ltr;
    float: right;
}

.container {
    max-width: 1170px;
    margin: auto;
}

img {
    max-width: 100%;
}

.inbox_people {
    background: #f8f8f8 none repeat scroll 0 0;
    float: left;
    overflow: hidden;
    width: 40%;
    border-right: 1px solid #c4c4c4;
}

.inbox_msg {
    border: 1px solid #c4c4c4;
    clear: both;
    overflow: hidden;
}

.top_spac {
    margin: 20px 0 0;
}

.recent_heading {
    float: left;
    width: 40%;
}

.srch_bar {
    display: inline-block;
    text-align: right;
    width: 60%;
}

.headind_srch {
    padding: 10px 29px 10px 20px;
    overflow: hidden;
    border-bottom: 1px solid #c4c4c4;
}

.recent_heading h4 {
    color: #05728f;
    font-size: 21px;
    margin: auto;
}

.srch_bar input {
    border: 1px solid #cdcdcd;
    border-width: 0 0 1px 0;
    width: 80%;
    padding: 2px 0 4px 6px;
    background: none;
}

.srch_bar .input-group-addon button {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    border: medium none;
    padding: 0;
    color: #707070;
    font-size: 18px;
}

.srch_bar .input-group-addon {
    margin: 0 0 0 -27px;
}

.chat_ib h5 {
    font-size: 15px;
    color: #464646;
    margin: 0 0 8px 0;
    text-align: end;
}

.chat_ib h5 span {
    font-size: 13px;
    float: right;
}

.chat_ib p {
    font-size: 14px;
    color: #989898;
    margin: auto;
}

.chat_img {
    float: left;
    width: 11%;
    list-style: none;
    position: relative;
    margin: 3px auto !important;
    padding-left: 3px;
    padding-right: 3px;
}

.chat_ib {
    float: left;
    padding: 0 0 0 15px;
    width: 88%;
}

.chat_people {
    overflow: hidden;
    clear: both;
}

.chat_list {
    border-bottom: 1px solid #c4c4c4;
    margin: 10px 0;
    padding: 18px 16px 10px;
    cursor: pointer;
}

.inbox_chat {
    height: 550px;
    overflow-y: scroll;
}

.active_chat {
    background: #ebebeb;
}

.incoming_msg_img {
    display: inline-block;
    width: 6%;
    float: left;
}

.received_msg {
    display: inline-block;
    padding: 15px 0 0 10px;
    vertical-align: top;
    width: 92%;
}

.received_withd_msg p {
    background: #ebebeb none repeat scroll 0 0;
    border-radius: 3px;
    color: #646464;
    font-size: 14px;
    margin: 0;
    padding: 5px 10px 5px 12px;
    width: 100%;
}

.time_date {
    color: #747474;
    display: block;
    font-size: 12px;
    margin: 8px 0 0;
}

.received_withd_msg {
    width: 57%;
    /*padding-right: 30px;*/
}

.mesgs {
    float: left;
    padding: 30px 15px 0 25px;
    width: 60%;
}

.sent_msg p {
    background: #05728f none repeat scroll 0 0;
    border-radius: 3px;
    font-size: 14px;
    margin: 0;
    color: #fff;
    padding: 5px 10px 5px 12px;
    width: 100%;
}

.outgoing_msg {
    overflow: hidden;
    margin: 5px 0 5px;
}

.sent_msg {
    float: left;
    width: 60%;
    display: block;
}

.input_msg_write textarea {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    border: medium none;
    color: #4c4c4c;
    font-size: 15px;
    min-height: 70px;
    width: 100%;
    padding-right: 42px;
}

.type_msg {
    border-top: 1px solid #c4c4c4;
    position: relative;
}

.msg_send_btn {
    background: #00b7e7 none repeat scroll 0 0;
    border: medium none;
    border-radius: 50%;
    color: #fff;
    cursor: pointer;
    font-size: 17px;
    height: 33px;
    position: absolute;
    right: 5px;
    bottom: 4px;
    width: 33px;
}


.btn-file {
    overflow: hidden;
    position: absolute;
    right: 5px;
    bottom: 40px;
    width: 33px;
    background: #fff;
    color: #000;
    font-weight: 900;
    cursor: pointer;
}

.btn-file input[type=file] {
    cursor: pointer;
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}


.messaging {
    padding: 0 0 50px 0;
}

.msg_history {
    height: 516px;
    overflow-y: auto;
}

.chat-image {
    margin-right: 20% !important;
    max-width: 80% !important;
}

@media screen(max-size: 775) {
}
</style>

<!-- notification alert styles -->

<style>
.notification-box {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    position: absolute;
    right: 20px;
    /*bottom: 20px;*/
    width: 30%;
    height: 100px;
    background-color: #f1f1f1;
    z-index: 999;
    box-shadow: #000 -2px 2px 24px;
    border-radius: 5px;
}

#title {
    font-size: 14px;
    font-weight: 800;
    color: #001320;
}
#subject {
    font-size: 15px;
    font-weight: 500;
    color: #484848;
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
    cursor: pointer;
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


@media only screen and (max-width: 600px) {
    .mesgs, .inbox_people {
        width: 100%
    }
}


</style>
