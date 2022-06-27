<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="facebook"> <b>  فيسبوك </b> </label>
            {!! Form::text('facebook',null,[
                'class' => 'form-control',
                'placeholder' => 'فيسبوك '
            ]) !!}
            @error('facebook')
            <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="twitter"> <b> توتير  </b> </label>
            {!! Form::text('twitter',null,[
                'class' => 'form-control',
                'placeholder' => 'توتير '
            ]) !!}
            @error('twitter')
            <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="instagram"> <b>  انستجرام </b> </label>
            {!! Form::text('instagram',null,[
                'class' => 'form-control',
                'placeholder' => 'انستجرام '
            ]) !!}
            @error('instagram')
            <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="google"> <b> جوجل  </b> </label>
            {!! Form::text('google',null,[
                'class' => 'form-control',
                'placeholder' => 'جوجل '
            ]) !!}
            @error('google')
            <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="youtube"> <b>  يوتيوب </b> </label>
            {!! Form::text('youtube',null,[
                'class' => 'form-control',
                'placeholder' => 'يوتيوب '
            ]) !!}
            @error('youtube')
            <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label for="snap_chat"> <b> سناب شات  </b> </label>
            {!! Form::text('snap_chat',null,[
                'class' => 'form-control',
                'placeholder' => 'سناب شات '
            ]) !!}
            @error('snap_chat')
            <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label for="terms_condition"> <b>  الشروط والاحكام </b> </label>
            {!! Form::textarea('terms_condition',null,[
                'class' => 'form-control',
                'placeholder' => 'الشروط والاحكام',
                'rows' =>'6'
            ]) !!}
            @error('terms_condition')
            <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <label for="about_app"> <b>عن التطبيق </b> </label>
            {!! Form::textarea('about_app',null,[
                'class' => 'form-control',
                'placeholder' => 'عن التطبيق',
                'rows' =>'6'
            ]) !!}
            @error('about_app')
            <span class="text-danger">{{ $message }}</span>
            @enderror
        </div>
    </div>

</div>
