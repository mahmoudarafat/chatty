<template>
    <div>
        <div class="chat_img"  :class="{'not_widthed' : in_chat }" >

            <img v-bind:src="user_profile" alt="user"  class="img-responsive profile-photo">
            <span v-if="is_online" class="online-dot"></span>
        </div>
    </div>
</template>


<script>
    export default{
        name: "userImage",
        props: {
            userData: Object
        },
        created(){

        },
        computed: {
            user_profile: function(){
                return this.$host +  this.userData.profile_image;
            },
            is_online: function (){
                return this.userData.online;
            },
            in_chat: function (){
                return this.userData.in_chat;
            }
        }
    }


</script>

<style scoped>
    span.online-dot {
        background: linear-gradient(to bottom, rgba(141, 198, 63, 1), rgba(0, 148, 68, 1));
        /*background: linear-gradient(to bottom, rgb(150, 154, 145), rgb(91, 112, 101));*/
        border: none;
        height: 12px;
        width: 12px;
        border-radius: 50%;
        position: absolute;
        bottom: -6px;
        border: 2px solid #fff;
        left: 0;
        right: 0;
        /*margin: auto;*/
    }
    img.profile-photo {
        height: 100%;
        width: 100%;
        border-radius: 50%;
    }

    .not_widthed{
        width: unset !important;
    }
    .user_name{
        position: absolute;
        right: 35px;
        width: max-content;
        bottom: 18px;
        color: navy;
        font-weight: 600;
    }

    @media only screen and (max-width: 600px) {
        .user_name{

            bottom: 5px !important;

        }
    }
    @media only screen and (max-width: 900px) {
        .user_name{

            bottom: 7px !important;

        }
    }
    @media only screen and (max-width: 1200px) {
        .user_name{

            bottom: 10px !important;

        }
    }


</style>
