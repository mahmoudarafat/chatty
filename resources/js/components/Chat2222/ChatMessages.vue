<template>


    <section id="chat-content">
        <div class="tab-content scrollbar-wrapper wrapper scrollbar-outer" id="chat-scroll">
            <div class="chat-body">
                <ul class="chat-message">


                    <li v-if="chat_messages.length" v-for="message in chat_messages" :key="message.id + 'msg'"
                        :class="{ 'left' : message.sender_type == 'agent' , 'right' : message.sender_type != 'agent' }">

                        <user-img
                            :userData="{profile_image: 'assets/img/chat-person.png', online: 1, in_chat: 1, alignRight: message.sender_type != 'agent' }"></user-img>

                        <div class="chat-item">
                            <div class="chat-item-header"><h5>{{ message.sender_name }}</h5> <small
                                class="text-muted">{{ message.time }}</small></div>

                            <p v-if="message.type == 'text'">{{ message.message }}</p>



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



                        </div>
                    </li>

                    <li v-else>
                        <h3 class="text-center text-muted">Select Client To Start Chat</h3>
                    </li>

                </ul>
            </div>
        </div>

        <div class="send-message">

            <div class="input-group"><input type="text" class="form-control" v-model="new_msg"
                                            placeholder="type a message..."
                                            id="message_text">
                <span class="input-group-btn"> <button @click="sendNewMessage"
                    class="btn btn-default" id="send-message"><i
                    class="fa fa-edit"></i></button> </span></div>

        </div>
    </section>



</template>

<script>

import userImg from './components/userImg'

export default {
    name: "ChatMessages",
    props: {
        chat_messages: Array
    },
    components: {
        userImg
    },
    data() {
        return {
            new_msg: ""
        }
    },
    created() {
        this.scrollAction()
    },
    updated() {
        this.scrollAction()
    },
    methods: {
        scrollAction: function () {

            var container = this.$el.querySelector(".msg_history");
            container.scrollTop = container.scrollHeight;
        },
        sendNewMessage() {
            var theMsg = this.new_msg
            this.$emit("send-message", {
                msg: theMsg
            });
            this.new_msg = '';
        }
    }
}
</script>

<style scoped>

</style>
