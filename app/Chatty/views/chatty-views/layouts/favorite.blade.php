<div class="favorite-list-item">
    <div data-id="{{ $user->id }}" data-action="0" class="avatar av-m"
         style="background-image: url('{{ $chattyObject->getUserWithAvatar($user)->avatar }}');">
    </div>
    <p>{{ strlen($user->name) > 5 ? substr($user->name,0,6).'chatify' : $user->name }}</p>
</div>
