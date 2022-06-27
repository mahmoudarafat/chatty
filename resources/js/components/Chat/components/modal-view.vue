<template>

    <!-- The Modal -->
    <div id="myModal" class="modal">

        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-body">
                    <center>
                        <img v-if="sourceImg.type == 'image'" class="imagepreview" :src="sourceImg.url" />

                        <video v-if="sourceImg.type == 'video'"
                               id="my-video"
                               class="video-js"
                               controls
                               preload="auto"
                               v-bind:poster="sourceImg.sourceImg"
                               data-setup="{}">
                            <source v-bind:src="sourceImg.sourceImg" type="video/mp4"/>

                        </video>

                        <h2 class="alert alert-danger" v-if=" sourceImg.type == '' ">Please upload an supported File Type { image / video } </h2>

                    </center>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" @click="closeMe">Close</button>
                    <button v-if=" sourceImg.type != '' "type="button" class="btn btn-primary" @click="confirmUpload">Save changes</button>
                </div>
            </div>
        </div>

    </div>


</template>

<script>


export default{
    name: "ModalView",
    props: {
        sourceImg: Object
    },
    methods: {
        closeMe(){
            this.$emit('close-modal');
        },
        confirmUpload(){
            var This = this;
            this.$emit('confirm-file-modal');
            this.$nextTick(() => {
                This.closeMe()
            })
        },

    }
}
</script>


<style scoped>

.imagepreview{
    max-height: 500px;
    width: auto;
}
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}


</style>
