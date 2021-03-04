@extends('voyager::master')

@section('css')
    <link rel="stylesheet" href="{{ voyager_asset('css/profile-blade.css') }}">

@stop

@section('content')
    <div class="profile-blade-img-1" style=" background-image: url({{ Voyager::image( Voyager::setting('admin.bg_image'), voyager_asset('/images/bg.jpg')) }}); "></div>
    <div class="profile-blade-style-1"></div>
    <div class="profile-blade-style-2">
        <img src="@if( !filter_var(Auth::user()->avatar, FILTER_VALIDATE_URL)){{ Voyager::image( Auth::user()->avatar ) }}@else{{ Auth::user()->avatar }}@endif"
             class="profile-blade-img-2 avatar"
             
             alt="{{ Auth::user()->name }} avatar">
        <h4>{{ ucwords(Auth::user()->name) }}</h4>
        <div class="user-email text-muted">{{ ucwords(Auth::user()->email) }}</div>
        <p>{{ Auth::user()->bio }}</p>
        @if ($route != '')
            <a href="{{ $route }}" class="btn btn-primary">{{ __('voyager::profile.edit') }}</a>
        @endif
    </div>
@stop
