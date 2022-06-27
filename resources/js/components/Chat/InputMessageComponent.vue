<template>
    <div class="nk-reply-form">

        <div class="nk-reply-form-editor">
            <div class="nk-reply-form-field">
                <textarea class="form-control form-control-simple no-resize" placeholder=""></textarea></div>
            <div class="nk-reply-form-tools">
                <ul class="nk-reply-form-actions g-1">
                    <li class="mr-2"><button class="btn btn-primary" type="submit">رد</button></li>

                    <li>


                        <div id="" class="">
                            <div id="image-holder"></div>
                            <div class="upload-btn-wrapper">
                                <p class="btn-add-image"><i class="icon fa fa-image fa-2x"></i></p>
                                <input id="fileUpload" type="file" multiple name="place_images[]"/>


                            </div>
                        </div>
                        <!-- <a class="btn btn-icon btn-sm" data-toggle="tooltip" data-placement="top" title="" href="#" data-original-title="Upload Attachment">
                        <em class="icon fa fa-paperclip fa-2x"></em></a></li> -->
                    <li><a class="btn btn-icon btn-sm" data-toggle="tooltip" data-placement="top" title="" href="#" data-original-title="Upload Images">
                        <em class="icon fa fa-paperclip fa-2x"></em></a></li>
                </ul>

            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
