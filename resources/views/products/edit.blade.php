@extends('layouts.menus.accounting')
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-9 col-lg-9 col-sm-12">
            <div class="col-xxl">
                <div class="card mb-4">
                    <h5 class="card-header">Product Edit</h5>
                    <form class="card-body" autocomplete="off" action="{{ route('products.update', $product->id) }}"
                        method="POST" id="edit-form">
                        @csrf
                        @method('PUT')

                        <h6 class="mb-3" style="font-weight: bold">Product Information</h6>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6 col-lg-6">
                                    <div class="row mb-3">
                                        <label class="col-sm-3 col-form-label text-sm-end"
                                            for="alignment-full-name">Name*</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                                name="name" value="{{ $product->name }}" />
                                            @error('name')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label class="col-sm-3 col-form-label text-sm-end"
                                            for="alignment-full-name">Code</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control @error('item_code') is-invalid @enderror"
                                                name="item_code" value="{{ $product->item_code }}" />
                                            @error('item_code')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label class="col-sm-3 col-form-label text-sm-end"
                                            for="alignment-full-name">Description</label>
                                        <div class="col-sm-9">
                                            <textarea id="basic-default-message"
                                                class="form-control @error('description') is-invalid @enderror">{{ $product->description }}</textarea>
                                            @error('description')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-lg-6">
                                    <div class="row mb-3">
                                        <label class="col-sm-3 col-form-label text-sm-end" for="alignment-full-name">Opening
                                            Cost</label>
                                        <div class="col-sm-9">
                                            <input type="text"
                                                class="form-control @error('opening_cost') is-invalid @enderror"
                                                name="opening_cost" value="{{ $product->opening_cost }}" />
                                            @error('opening_cost')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>


                                    <div class="row mb-3">
                                        <label class="col-sm-3 col-form-label text-sm-end" for="alignment-full-name">Opening
                                            Quantity</label>
                                        <div class="col-sm-9">
                                            <input type="text"
                                                class="form-control @error('opening_quantity') is-invalid @enderror"
                                                name="opening_quantity" value="{{ $product->opening_quantity }}" />
                                            @error('opening_quantity')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label class="col-sm-3 col-form-label text-sm-end" for="alignment-full-name">Opening
                                            Quantity as
                                            At Date</label>
                                        <div class="col-sm-9">
                                            <input type="date"
                                                class="form-control @error('qty_at_date') is-invalid @enderror"
                                                name="qty_at_date" value="{{ $product->qty_at_date }}" />
                                            @error('qty_at_date')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr class="my-4 mx-n4" />

                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <h6 class="mb-b" style="font-weight: bold">Selling Product Details</h6>
                                    <div class="row mb-3">
                                        <label class="col-sm-3 col-form-label text-sm-end" for="alignment-username">
                                            Selling Price
                                        </label>
                                        <div class="col-sm-9">
                                            <input type="text"
                                                class="form-control @error('selling_price') is-invalid @enderror"
                                                name="selling_price" value="{{ $product->selling_price }}" />
                                            @error('selling_price')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>


                                    <div class="row mb-3">
                                        <label class="col-sm-3 col-form-label text-sm-end" for="SaleAccountID">Sales
                                            Account*</label>
                                        <div class="col-sm-9">
                                            <select id="SaleAccountID" class="select2 form-select form-select-lg"
                                                data-allow-clear="true" name="sale_account_id">
                                                @foreach ($chartof_accounts as $chartof_account)
                                                    <option value="{{ $chartof_account->id }}"
                                                        @if ($chartof_account->id == $product->sale_account_id) selected @endif>
                                                        {{ $chartof_account->coa_number }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @error('sale_account_id')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <h6 class="mb-b" style="font-weight: bold">Buying Product Details</h6>
                                    <div class="row mb-3">
                                        <label class="col-sm-3 col-form-label text-sm-end" for="alignment-username">Cost
                                            of unit</label>
                                        <div class="col-sm-9">
                                            <input type="text"
                                                class="form-control @error('cost_of_unit') is-invalid @enderror"
                                                name="cost_of_unit" value="{{ $product->cost_of_unit }}" />
                                            @error('cost_of_unit')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label class="col-sm-3 col-form-label text-sm-end" for="PurchaseAccountID">Purchase
                                            Account*</label>
                                        <div class="col-sm-9">
                                            <select id="PurchaseAccountID" class="select2 form-select form-select-lg"
                                                data-allow-clear="true" name="purchase_account_id">
                                                @foreach ($chartof_accounts as $chartof_account)
                                                    <option value="{{ $chartof_account->id }}"
                                                        @if ($chartof_account->id == $product->purchase_account_id) selected @endif>
                                                        {{ $chartof_account->coa_number }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @error('purchase_account_id')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="pt-4">
                            <div class="row">
                                <div class="col-md-12">
                                    <center>
                                        <button type="submit" class="btn btn-primary me-sm-2 me-1">Save</button>
                                        <a href="{{ route('products.index') }}"
                                            class="btn btn-label-secondary">Cancel</a>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\UpdateProducts', '#edit-form') !!}
@endsection
