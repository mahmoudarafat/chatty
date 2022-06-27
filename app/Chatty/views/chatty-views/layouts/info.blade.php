{{-- user info and avatar --}}
<div class="avatar av-l chatify-d-flex"></div>
<p class="info-name">{{ config('chatify.name') }}</p>

<p>Shop ID: <span class="info-id">--</span></p>
<p><span class="info-country"></span></p>
<p><span class="info-mobile"></span></p>
<p>Opened Tasks: <a target="_blank" href="javascript:void(0)" class="support_code_tasks"><span class="info-opened-tasks" style="color: salmon;"></span></a></p>
<div class="messenger-infoView-btns">
    {{-- <a href="#" class="default"><i class="fas fa-camera"></i> default</a> --}}
    <a href="#" class="danger delete-conversation"><i class="fas fa-trash-alt"></i> Delete Conversation</a>
</div>
{{-- shared photos --}}
<div class="messenger-infoView-shared">
    <p class="messenger-title">shared photos</p>
    <div class="shared-photos-list"></div>
</div>
