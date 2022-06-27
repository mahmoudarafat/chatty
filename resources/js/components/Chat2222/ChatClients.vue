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


            <ul class="nav nav-tabs contact-list scrollbar-wrapper scrollbar-outer">
                <li :class="{'active' : chat.open }" :key="chat.id + 'client'" v-for="(chat) in filteredClients" @click="initializeChat(chat)">

                    <div class="contact">

                        <user-img :userData="{profile_image: 'assets/img/chat-person.png', online: 1 }" ></user-img>

                        <div class="msg-preview">
                            <h6>{{ chat.account_name }}<span class="chat_date">{{ chat.last_message_time }}</span></h6>
                            <p>{{ chat.last_message }}</p>
                        </div>
                    </div>
                </li>
            </ul>



        </div>

    </div>


</template>

<script>

import userImg from './components/userImg'

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
            clientSearch: ""
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
