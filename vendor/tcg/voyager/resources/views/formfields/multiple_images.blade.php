<br>
@if(isset($dataTypeContent->{$row->field}))
    <?php $images = json_decode($dataTypeContent->{$row->field}); ?>
    @if($images != null)
        @foreach($images as $image)
            <div class="img_settings_container formfields-multiple-image-blade-setting-container" data-field-name="{{ $row->field }}">
                <a href="#" class="voyager-x remove-multi-image position-absolute"></a>
                <img class="formfields-multiple-image-blade-img-1" src="{{ Voyager::image( $image ) }}" data-file-name="{{ $image }}" data-id="{{ $dataTypeContent->getKey() }}" >
            </div>
        @endforeach
    @endif
@endif
<div class="clearfix"></div>
<input @if($row->required == 1 && !isset($dataTypeContent->{$row->field})) required @endif type="file" name="{{ $row->field }}[]" multiple="multiple" accept="image/*">
