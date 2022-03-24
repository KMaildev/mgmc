@extends('layouts.menus.accounting')
@section('content')
    <div class="row justify-content-center py-5">
        <div class="col-md-12 col-sm-12 col-lg-12">
            <a href="{{ route('cashbook.create') }}">
                Create
            </a>
        </div>
    </div>
@endsection
