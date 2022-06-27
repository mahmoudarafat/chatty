<template>

    <div class="mesgs">


        <div class="msg_history" @scroll="handleScroll">

            <center><i v-if="loading" class="fa fa-spinner fa-spin fa-5x h1"></i></center>

            <div v-if="chat_messages.length">
                <div v-for="message in chat_messages" :key="message.id + 'msg'"
                     :class="{ 'incoming_msg' : message.sender_type == 'agent' , 'outgoing_msg' : message.sender_type != 'agent' }">

                    <div :class="{ 'received_msg' : message.sender_type == 'agent' , 'outgoing_msg' : message.sender_type != 'agent' }">

                        <div v-if="message.sender_type == 'account'" class="incoming_msg_img">
                            <user-img
                                :userData="{ profile_image: 'assets/img/chat-person.png', online: onlineClient, in_chat: 1 }"></user-img>
                        </div>


                        <div :class="{ 'received_withd_msg' : message.sender_type == 'agent' , 'sent_msg' : message.sender_type != 'agent' }">

                            <div v-if="message.type == 'text'">
                                <p style="white-space: pre;" >{{ message.message }} </p>
                            </div>
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
                               data-setup="{}">
                            <source v-bind:src="message.file_path" type="video/mp4"/>

                        </video>


                        <span class="time_date" :class="{'left_content' : message.sender_type != 'agent' }" >


                            <span class="time_txt">
                                 <timeago :datetime="message.created_at" :auto-update="60"
                                          :title="message.created_at"></timeago>

                                    <span v-if="message.sender_type == 'agent'" class="user_name"> - {{ message.sender_name }}</span>

                            </span>

                        </span>

                    </div>
                </div>
            </div>
            <div v-else>
                <h3 class="text-center text-muted">Select Client To Start Chat</h3>
            </div>

        </div>


        <div class="type_msg">
            <div class="input_msg_write">
                <textarea :disabled="cannotSendMsg" type="text" class="write_msg" v-model="new_msg"
                          placeholder="Type a message"></textarea>
                <button :disabled="cannotSendMsg" class="msg_send_btn" type="button" @click="sendNewMessage"><i
                    class="fa fa-paper-plane-o"
                    aria-hidden="true"></i>
                </button>

                <span class="btn btn-default btn-file"><i class="fa fa-paperclip"> </i>
                    <input :disabled="cannotSendMsg" @change="fileUpload($event)"
                           accept="image/*,audio/*,video/*"
                           name="status_attachment" id="status_attachment" type="file"> </span>

            </div>
        </div>

        <div>
            <modal-view
                @confirm-file-modal="confirmFileModal"
                @close-modal="closeModal"
                :sourceImg="imageUploadedData"></modal-view>

        </div>


    </div>

</template>

<script>
import VueTimeago from 'vue-timeago'
import ModalView from "./components/modal-view";

import userImg from './components/userImg'

Vue.use(VueTimeago, {
    name: 'Timeago',
    locale: 'en',

})

var container = document.getElementsByClassName("msg_history");

export default {
    name: "ChatMessages",
    props: {
        chat_messages: Array,
        cannotSendMsg: Boolean,
        onlineClient: Boolean,
        page: Number,
        current_scroll: Boolean,
        loading: Boolean,

    },
    components: {
        userImg,
        ModalView,
    },
    data() {
        return {
            new_msg: "",
            imageUploaded: "",
            imageUploadedData: {},
            prev_height: 0,
            file_type: 'text'
        }
    },
    created() {


    },
    updated() {
        this.scrollActionBottom()
    },
    destroyed() {
        // var container = this.$el.querySelector(".msg_history");
        if (container.length) {
            container.removeEventListener('scroll', this.handleScroll);
        }
    },
    methods: {
        handleScroll() {
            var This = this;
            var container = document.querySelector(".msg_history");
            if (container.scrollTop < 20) {

                this.$emit('old-messages', {page: this.page});
                this.$nextTick(() => {
                    This.scrollActionBottom();
                });
            }
        },
        scrollActionBottom: function () {

            var container = this.$el.querySelector(".msg_history");
            if (this.chat_messages.length && !this.current_scroll) {
                // container.scrollTop = this.prev_height;
                if (this.prev_height == 0) {
                    container.scrollTop = container.scrollHeight;
                } else {
                    this.prev_height = Number(container.scrollHeight) - Number(this.prev_height);
                    container.scrollTop = this.prev_height;
                }

            }
        },
        sendNewMessage() {
            var theMsg = this.new_msg
            this.$emit("send-message", {
                msg: theMsg
            });
            this.new_msg = '';
        },
        fileUpload(event) {

            var file = event.target.files[0];

            console.log(">>>>>>>>>", file.type);
            var fileType = file.type;

            var tagType = '';
            if (fileType.includes('image/')) {
                tagType = 'image';
            } else if (fileType.includes('video/')) {
                tagType = 'video';
            } else if (fileType.includes('audio/')) {
                tagType = 'audio';
            }
            this.file_type = tagType
            this.imageUploadedData = {url: URL.createObjectURL(file), type: tagType};
            this.imageUploaded = file;

            this.$emit("upload-file", {
                fileUploaded: file,
                fileType: this.file_type
            });

            this.openModal();

            this.new_msg = '';
        },

        openModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "block";
        },
        closeModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        },
        confirmFileModal() {
            var This = this;
            this.$emit('confirm-upload-file', {
                fileUploaded: this.imageUploaded,
                fileType: this.file_type
            });

        },

    },
    computed: {}
}
</script>

<style scoped>

.user_name {
    width: max-content;
    color: navy;
    font-weight: 600;
    display: block;
    direction: ltr;
}

.time_txt {
    display: inline-flex;
    direction: ltr;
}

.left_content{
    width: 100%;
    text-align: left;
    float: left;
}

</style>
