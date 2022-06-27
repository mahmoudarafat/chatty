<template>

    <div class="inbox_people">

        <div class="headind_srch">
            <div class="recent_heading">
                <h4>Recent</h4>
            </div>
            <div class="srch_bar">
                <div class="stylish-input-group">
                    <input type="text" class="search-bar" placeholder="Search" v-model="clientSearch">
                </div>
            </div>
        </div>

        <div class="inbox_chat">

            <div class="chat_list" :class="{'active_chat' : chat.open }" :key="chat.id + 'client'"
                v-for="(chat) in filteredClients" @click="initializeChat(chat)">
                <div class="chat_people">

                    <user-img :userData="{profile_image: 'assets/img/chat-person.png', online: chat.online_status }" ></user-img>

                    <div class="chat_ib">
                        <h5>{{ chat.account_name }}<span class="chat_date">
                            <timeago :datetime="chat.last_message_created" :auto-update="60"  :title="chat.last_message_created"></timeago></span></h5>
                        <p>{{ chat.last_message }}</p>
                    </div>

                </div>
            </div>

        </div>

    </div>

</template>

<script>

import userImg from './components/userImg'

import VueTimeago from "vue-timeago";

Vue.use(VueTimeago, {
    name: 'Timeago',
    locale: 'en',

})
export default {
    name: "ChatClients",
    components: {
      userImg
    },
    props: {
        recentchats: Array,
    },
    data() {
        return {
            clientSearch: "",
        };
    },
    created() {
        console.log(this.recentchats)
    },
    methods: {
        initializeChat(chat){
            chat.open = true;
            this.$emit("init-chat", {
                id : chat.id
            });

        }
    },
    computed: {
        filteredClients: function(){
            return this.recentchats.filter((chat) => chat.account_name.includes(this.clientSearch));
        }
    }

}
</script>
