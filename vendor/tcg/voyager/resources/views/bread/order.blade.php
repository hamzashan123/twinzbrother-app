@extends('voyager::master')

@section('page_title', $dataType->getTranslatedAttribute('display_name_plural') . ' ' . __('voyager::bread.order'))

@section('page_header')
<h1 class="page-title">
    <i class="voyager-list"></i>{{ $dataType->getTranslatedAttribute('display_name_plural') }} {{ __('voyager::bread.order') }}
</h1>
@stop

@section('css')
<link rel="stylesheet" href="{{ voyager_asset('css/bread-order-blade.css') }}">

@stop

@section('content')
<div class="page-content container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-bordered">
                <div class="panel-heading">
                    <p class="bread-order-blade-panel-title panel-title" >{{ __('voyager::generic.drag_drop_info') }}</p>
                </div>

                <div class="bread-order-blade-panel-body panel-body">
                    <div class="dd">
                        <ol class="dd-list">
                            @foreach ($results as $result)
                            <li class="dd-item" data-id="{{ $result->getKey() }}">
                                <div class="bread-order-blade-dd-handle dd-handle">
                                    @if (isset($dataRow->details->view))
                                        @include($dataRow->details->view, ['row' => $dataRow, 'dataType' => $dataType, 'dataTypeContent' => $result, 'content' => $result->{$display_column}, 'action' => 'order'])
                                    @elseif($dataRow->type == 'image')
                                        <span>
                                            <img class="bread-order-blade-img-1" src="@if( !filter_var($result->{$display_column}, FILTER_VALIDATE_URL)){{ Voyager::image( $result->{$display_column} ) }}@else{{ $result->{$display_column} }}@endif" >
                                        </span>
                                    @else
                                        <span>{{ $result->{$display_column} }}</span>
                                    @endif
                                </div>
                            </li>
                            @endforeach
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@stop

@section('javascript')

    
<script>
	$(document).ready(function () {
		$('.dd').nestable({
			maxDepth: 1
		});

		/**
		* Reorder items
		*/
		$('.dd').on('change', function (e) {
			$.post('{{ route('voyager.'.$dataType->slug.'.order') }}', {
				order: JSON.stringify($('.dd').nestable('serialize')),
				_token: '{{ csrf_token() }}'
			}, function (data) {
				toastr.success("{{ __('voyager::bread.updated_order') }}");
			});
		});
	});
</script>

@stop
