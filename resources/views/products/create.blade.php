@extends('layouts.menus.accounting')
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-9 col-lg-9 col-sm-12">
            <div class="card mb-4">
                <h5 class="card-header">Product</h5>
                <form class="card-body" autocomplete="off" action="{{ route('products.store') }}" method="POST"
                    id="create-form">
                    @csrf
                    <div class="row g-3">

                        <div class="col-md-6">
                            <label class="form-label" for="multicol-country">Brand</label>
                            <select class="select2 form-select" data-allow-clear="true" name="brand_id">
                                <option value="">Select</option>
                                @foreach ($brands as $brand)
                                    <option value="{{ $brand->id }}">
                                        {{ $brand->name }}
                                    </option>
                                @endforeach
                            </select>
                            @error('brand_id')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Product</label>
                            <input type="text" class="form-control @error('product') is-invalid @enderror" name="product"
                                value="{{ old('product') }}" />
                            @error('product')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Type</label>
                            <input type="text" class="form-control @error('type') is-invalid @enderror" name="type"
                                value="{{ old('type') }}" />
                            @error('type')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Model No</label>
                            <input type="text" class="form-control @error('model_no') is-invalid @enderror" name="model_no"
                                value="{{ old('model_no') }}" />
                            @error('model_no')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Model Year</label>
                            <input type="text" class="form-control @error('model_year') is-invalid @enderror"
                                name="model_year" value="{{ old('model_year') }}" />
                            @error('model_year')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Configuration</label>
                            <input type="text" class="form-control @error('configuration') is-invalid @enderror"
                                name="configuration" value="{{ old('configuration') }}" />
                            @error('configuration')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Body Color</label>
                            <input type="text" class="form-control @error('body_color') is-invalid @enderror"
                                name="body_color" value="{{ old('body_color') }}" />
                            @error('body_color')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Interior Color</label>
                            <input type="text" class="form-control @error('interior_color') is-invalid @enderror"
                                name="interior_color" value="{{ old('interior_color') }}" />
                            @error('interior_color')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Engine Power</label>
                            <input type="text" class="form-control @error('engine_power') is-invalid @enderror"
                                name="engine_power" value="{{ old('engine_power') }}" />
                            @error('engine_power')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Chessi No</label>
                            <input type="text" class="form-control @error('chessi_no') is-invalid @enderror"
                                name="chessi_no" value="{{ old('chessi_no') }}" />
                            @error('chessi_no')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Engine No</label>
                            <input type="text" class="form-control @error('engine_no') is-invalid @enderror"
                                name="engine_no" value="{{ old('engine_no') }}" />
                            @error('engine_no')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Weight</label>
                            <input type="text" class="form-control @error('weight') is-invalid @enderror" name="weight"
                                value="{{ old('weight') }}" />
                            @error('weight')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Door</label>
                            <input type="text" class="form-control @error('door') is-invalid @enderror" name="door"
                                value="{{ old('door') }}" />
                            @error('door')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Seater</label>
                            <input type="text" class="form-control @error('seater') is-invalid @enderror" name="seater"
                                value="{{ old('seater') }}" />
                            @error('seater')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Vehicle No</label>
                            <input type="text" class="form-control @error('vehicle_no') is-invalid @enderror"
                                name="vehicle_no" value="{{ old('vehicle_no') }}" />
                            @error('vehicle_no')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Quantity</label>
                            <input type="text" class="form-control @error('quantity') is-invalid @enderror" name="quantity"
                                value="0" />
                            @error('quantity')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>

                        <div class="col-md-12">
                            <label class="form-label">Remark</label>
                            <input type="text" class="form-control @error('remark') is-invalid @enderror" name="remark"
                                value="{{ old('remark') }}" />
                            @error('remark')
                                <div class="invalid-feedback"> {{ $message }} </div>
                            @enderror
                        </div>
                    </div>
                    <div class="pt-4">
                        <button type="submit" class="btn btn-primary me-sm-3 me-1">Save</button>
                        <a href="{{ route('products.index') }}" class="btn btn-label-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\StoreProducts', '#create-form') !!}
@endsection
