<template>


    <div class="row">
        <div class="col-md-9">
            <div class="ibox chat-view">
                <div class="ibox-title ">
                    <div class="row">

                        <div class="col-md-4">
                            الرسايل
                        </div>
                        <div class=" col-md-4 text-center">

                            <h3 v-bind:class="counterClass">
                                {{ countDown }}
                            </h3>
                            <button v-bind:class="buttonClass" class="btn btn-danger"> إنهاء المحادثة</button>
                        </div>


                        <div class="col-md-4">

                            <small class="pull-left text-muted">{{lastMessage }}</small>
                        </div>
                    </div>

                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="messages-part">
                                <div class="sidebar-panel">


                                    <div>
                                        <h4>الرسائل <span class="badge badge-info pull-left"></span></h4>
                                        <div class="search-form">
                                            <form action="" method="get">
                                                <div class="input-group">
                                                    <input class="form-control" name="search" placeholder="بحث"
                                                           type="text">
                                                    <div class="input-group-btn">
                                                        <button class="btn  btn-primary" type="submit">
                                                            بحث
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div>
                                            <a v-for="chat in chats" :key=chat.id
                                               v-on:click="getMessages(chat,chat.account_id) ; getClientInfo(chat.account_id)">
                                                <div class="feed-element">
                                                    <a class="pull-right" href="#">
                                                        <img alt="image" class="img-circle"
                                                             src="assets/img/chat-person.png">
                                                    </a>
                                                    <div class="media-body">
                                                        <div class="nk-msg-sender col-md-12">

                                                            <div class="name">{{ chat.account_name }}</div>
                                                            <div class="lable-tag dot bg-pink"></div>

                                                            <span v-if="chat.agentUnreadCount > 0"
                                                                  class="text-danger">{{
                                                                    chat.agentUnreadCount
                                                                }}</span>
                                                        </div>
                                                        <br>
                                                        {{ chat.last_message }}
                                                        <br>
                                                        <small class="text-muted">{{ chat.last_message_time }}</small>
                                                        <br>
                                                        <small class="text-muted">مقدم الخدمة : على محمد</small>
                                                        <br>
                                                        <small class="text-muted"> حالة الرسالة : تم التواصل</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9 ">
                            <div class="message-content-part">
                                <div v-chat-scroll class="chat-discussion">
                                    <div class="nk-msg-head">
                                        <h4 class="title d-none d-lg-block">البرنامج بيهنج</h4>
                                        <div class="nk-msg-head-meta">
                                            <div class="d-none d-lg-block">
                                                <ul class="nk-msg-tags">
                                                    <li><span class="label-tag"><em
                                                        class="icon ni ni-flag-fill"></em> <span>الدعم الفني </span></span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <ul class="nk-msg-actions">
                                                <li class="dropdown">
                                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                                        <i class="fa fa-ellipsis-h fa-x"></i>
                                                    </a>
                                                    <ul class="dropdown-menu dropdown-user">
                                                        <li><a v-if="open" href="" @click.prevent="close">تميز المحادثة
                                                            كمنتهيه </a>
                                                        </li>
                                                        <li><a href="#">التحويل الى مقدم اخر </a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </div>
                                        <a class="nk-msg-profile-toggle profile-toggle active" href="#"><em
                                            class="icon ni ni-arrow-left"></em></a>
                                    </div>

                                    <div v-for="message in messages">

                                        <div class="chat-message "
                                             v-bind:class="{ right: message.sender_type == 'account'  , left:message.sender_type == 'agent' ,system:message.sender_type == 'system'}">
                                            <img alt="" class="message-avatar" src="assets/img/chat-person.png">
                                            <div class="message">
                                                <a class="message-author" href="#"> {{ message.sender_name }} </a>
                                                <span class="message-date"> {{ message.time }} </span>
                                                <span class="message-content">

                                    {{ message.message }}
                                </span>

                                            </div>
                                            <div v-if="message.type == 'image'">
                                                <img class=" chat-image" v-bind:src="message.file_path">


                                            </div>


                                            <video v-if="message.type == 'video'"
                                                   id="my-video"
                                                   class="video-js"
                                                   controls
                                                   preload="auto"
                                                   v-bind:poster="message.thumbnail"
                                                   data-setup="{}"
                                            >
                                                <source v-bind:src="message.file_path" type="video/mp4"/>
                
                                            </video>


                                        </div>

                                    </div>
                                </div>
                                
                                <form class="form-group" @submit.prevent="send">
                                    <div class="nk-reply-form">
                                        <div class="nk-reply-form-editor">
                                            <div class="nk-reply-form-field">
                                                            <textarea id="message"
                                                                      class="form-control form-control-simple no-resize"
                                                                      placeholder=""></textarea></div>
                                            <div class="nk-reply-form-tools">
                                                <ul class="nk-reply-form-actions g-1">
                                                    <li class="mr-2">
                                                        <button class="btn btn-primary" type="submit">رد
                                                        </button>
                                                    </li>

                                                    <li>


                                                        <div id="" class="">
                                                            <div id="image-holder"></div>
                                                            <div class="upload-btn-wrapper">
                                                                <p class="btn-add-image"><i
                                                                    class="icon fa fa-file fa-2x"></i>
                                                                </p>
                                                                <input type="file" @change="uploadFile" ref="file">


                                                            </div>
                                                        </div>

                                                    </li>
                                                        <!-- <a class="btn btn-icon btn-sm" data-toggle="tooltip" data-placement="top" title="" href="#" data-original-title="Upload Attachment">
                                                        <em class="icon fa fa-paperclip fa-2x"></em></a></li> -->
<!--                                                    <li><a class="btn btn-icon btn-sm"-->
<!--                                                           data-original-title="Upload Images"-->
<!--                                                           data-placement="top" data-toggle="tooltip" href="#"-->
<!--                                                           title="">-->
<!--                                                        <em class="icon fa fa-paperclip fa-2x"></em></a>-->
<!--                                                    </li>-->
                                                </ul>

                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-md-3">

            <div class="card">
                <div class="card-inner-group">
                    <div class="card-inner">
                        <div class="user-card user-card-s2 mb-2">
                            <div class="user-avatar md">
                                <span><img class="img-circle" src="assets/img/a1.jpg"></span>
                            </div>
                            <div class="user-info">
                                <h3>اسلام محمد</h3>
                                <span class="sub-text">عميل </span>
                            </div>
                        </div>

                    </div>
                    <div class="card-inner">
                        <div class="aside-wg">
                            <h6 class="overline-title-alt mb-2">بيانات العميل
                                <a class="btn btn-xs btn-primary pull-left" data-target="#myModal"
                                   data-toggle="modal">
                                    <i class="fa fa-edit"></i>
                                </a>

                            </h6>
                            <ul class="user-contacts">
                                <li><em class="icon fa fa-envelope"></em><span v-if="client">{{ client.email }}</span>
                                </li>
                                <li><em class="icon fa fa-mobile fa-2x"></em><span
                                    v-if="client">{{ client.phone }}</span>
                                </li>
                                <li>
                                    <em><img class="icon" src="assets/img/sudi.jpg}"></em>

                                    <span v-if="client"
                                          class="country-name">{{ client.address }}
                                                </span>

                                </li>
                            </ul>
                        </div>
                        <div class="aside-wg">
                            <h6 class="overline-title-alt mb-2">طلبات الدعم المفتوحه </h6>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th class=" text-center">الكود</th>
                                    <th class=" text-center">التاريخ</th>
                                    <th class=" text-center">الحالة</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="task in tasks">
                                    <td class=" text-center">{{ task.id }}</td>
                                    <td class=" text-center">{{ task.task_date }}</td>
                                    <td class="text-success text-center">{{ task.status }}</td>
                                </tr>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


</template>

<script type="application/javascript">
export default {
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
            lastMessage: ""

        }

    }, methods: {


        uploadFile() {
            this.Images = this.$refs.file.files[0];
        },
        send() {
            var message = $('#message').val();
            var channel = Echo.join('chat' + this.channel_id);

            // console.log(channel.subscription.members.count)
            if (channel.subscription.members.count > 1) {
                var push = 'push';
            } else {
                var push = 'notify';
            }
            var push = 'push';

            const formData = new FormData();
            formData.append('file', this.Images);
            formData.append('message', message);
            formData.append('push', push);


            const headers = { 'Content-Type': 'multipart/form-data' };

            if (message || this.Images) {

                axios.post(`send/` + this.channel_id, formData, { headers }).then(res => {

                        this.messages.push(res.data.data)
                        $('#message').val("")
                    }
                )
            }
        },
        close() {

            this.open = fasle;
        },
        getChats() {

            axios.post('getChats').then(res => {
                this.chats = res.data.data
                console.log(544444444);
                // this.chats.forEach(chat => {
                //
                //     this.listenForEveryChannel(chat);
                // })
            });
        },
        getMessages(channel, account_id) {
            this.channel_id = channel.id
            // console.log( 'channel_id = ',channel.id)

            Echo.join(`chat` + channel.id)
                .here((users) => {
                    console.log(users)
                });
            Echo.join('chat' + channel.id).listen("PrivateChatEvent", e => {
                // console.log(e)
                let account_id = account_id;
                if (e.content.channel_id == this.channel_id) {
                    this.messages.push(e.content);
                    this.countDown = 40;
                }
                axios.post('readMessage', {'id': e.message.id})

            });

            // Echo.private('chat' + channel_id).listen("PrivateChatEvent" , e=>{
            //     console.log(e)
            //
            // });
            channel.open = true;
            channel.agentUnreadCount = 0;
            this.channel_id = channel.id;
            axios.post('getMessages', {'id': channel.id}).then(res => {
                this.messages = res.data.data
                this.lastMessage = res.data.last_message;

                this.countDown = 40;
                this.countDownTimer();
            })

        },
        getClientInfo(account_id) {

            axios.post('getClientInfo', {'account_id': account_id}).then(res => {
                // console.log(res.data.data)
                this.tasks = res.data.data
                this.client = res.data.additional_data.client

            })
        }

        , countDownTimer() {
            if (this.countDown > 0) {
                setTimeout(() => {
                    this.countDown -= 1
                    this.countDownTimer()
                }, 1000)
            } else {
                this.buttonClass = '';
                this.counterClass = 'hidden';

            }
        }
        , transformSlotProps(props) {
            const formattedProps = {};

            Object.entries(props).forEach(([key, value]) => {
                formattedProps[key] = value < 10 ? `0${value}` : String(value);
            });

            return formattedProps;
        },

        // Echo.private('chat' + channel_id).listen("PrivateChatEvent" , e=>{
        //     console.log(e)
        //

        subscribe () {
            console.log(">>>> pusher >>>>")
            // let pusher = new Pusher('cbea31d584c2837044c0', { cluster: 'eu' })
            // pusher.subscribe('private-channel-' + this.channel_id)
            // pusher.bind('private-event-' + this.channel_id, data => {
            //     console.log(">>>> pusher >>>>", data)
            //     // this.messages.push(data.message)
            // })
        }

    }, created() {
        this.subscribe();
        this.getChats();
        this.$on('close', () => this.close());

    }, watch() {


    }, props: [
        // 'channel_id'
        // 'countDown'
    ]
}
</script>
