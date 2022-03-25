@extends('layouts.menus.accounting')
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-10 col-sm-12 col-lg-10">
            <div class="col">
                <h6 class="mt-4">
                    New Customer
                </h6>
                <div class="card mb-3">

                    <div class="card-header border-bottom">
                        <ul class="nav nav-tabs card-header-tabs" role="tablist">
                            <li class="nav-item">
                                <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#form-tabs-personal"
                                    role="tab" aria-selected="true">Dealer</button>
                            </li>
                            <li class="nav-item">
                                <button class="nav-link " data-bs-toggle="tab" data-bs-target="#form-tabs-account"
                                    role="tab" aria-selected="false">HP</button>
                            </li>
                        </ul>
                    </div>

                    <div class="tab-content">

                        {{-- Dealer --}}
                        <div class="tab-pane fade active show" id="form-tabs-personal" role="tabpanel">
                            <span class="badge bg-label-success">
                                Dealer Customer Create
                            </span>
                            <form class="card-body" autocomplete="off" action="{{ route('customer.store') }}"
                                method="POST" id="create-form">
                                @csrf

                                <input type="hidden" value="dealer" name="dealer_or_hp">
                                <input type="hidden" value="0" name="dealer_customer_id">

                                <h6 class="mb-3 fw-normal">1. Personal Info</h6>

                                <div class="row g-3">

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">Name</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror"
                                            name="name" value="{{ old('name') }}" />
                                        @error('name')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">Background</label>
                                        <select id="CustomerId" class="select2 form-select form-select-lg"
                                            data-allow-clear="false" name="background">
                                            <option value="Individual">
                                                Individual
                                            </option>
                                            <option value="Company">
                                                Company
                                            </option>
                                        </select>
                                        @error('customer')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">NRC NO</label>
                                        <input type="text" class="form-control @error('nrc_no') is-invalid @enderror"
                                            name="nrc_no" value="{{ old('nrc_no') }}" />
                                        @error('nrc_no')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-email">Phone</label>
                                        <div class="input-group input-group-merge">
                                            <input type="text" class="form-control @error('phone') is-invalid @enderror"
                                                name="phone" value="{{ old('phone') }}" />
                                            @error('phone')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-email">Email</label>
                                        <div class="input-group input-group-merge">
                                            <input type="text" class="form-control @error('email') is-invalid @enderror"
                                                name="email" value="{{ old('email') }}" />
                                            @error('email')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-password-toggle">
                                            <label class="form-label" for="formtabs-password">Address</label>
                                            <div class="input-group input-group-merge">
                                                <input type="text"
                                                    class="form-control @error('address') is-invalid @enderror"
                                                    name="address" value="{{ old('address') }}" />
                                                @error('address')
                                                    <div class="invalid-feedback"> {{ $message }} </div>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">Country</label>
                                        <input type="text" class="form-control @error('country') is-invalid @enderror"
                                            name="country" value="{{ old('country') }}" />
                                        @error('country')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">City</label>
                                        <input type="text" class="form-control @error('city') is-invalid @enderror"
                                            name="city" value="{{ old('city') }}" />
                                        @error('city')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">State</label>
                                        <input type="text" class="form-control @error('state') is-invalid @enderror"
                                            name="state" value="{{ old('state') }}" />
                                        @error('state')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label" for="formtabs-username">Description</label>
                                        <input type="text" class="form-control @error('description') is-invalid @enderror"
                                            name="description" value="{{ old('description') }}" />
                                        @error('description')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">Opening Balance</label>
                                        <input type="text"
                                            class="form-control @error('opening_balance') is-invalid @enderror"
                                            name="opening_balance" value="{{ old('opening_balance') }}" />
                                        @error('opening_balance')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">Opening Balance as At
                                            Date</label>
                                        <input type="date"
                                            class="form-control @error('opening_balance_date') is-invalid @enderror"
                                            name="opening_balance_date" value="{{ old('opening_balance_date') }}" />
                                        @error('opening_balance_date')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="pt-4">
                                    <button type="submit" class="btn btn-primary me-sm-3 me-1">Save</button>
                                    <a href="{{ route('customer.index') }}" class="btn btn-label-secondary">Cancel</a>
                                </div>
                            </form>
                        </div>

                        {{-- HP --}}
                        <div class="tab-pane fade" id="form-tabs-account" role="tabpanel">
                            <span class="badge  bg-label-success">
                                HP Customer Create
                            </span>
                            <form class="card-body" autocomplete="off" action="{{ route('customer.store') }}"
                                method="POST" id="create-hp-form">
                                @csrf
                                <input type="hidden" value="hp" name="dealer_or_hp">
                                <h6 class="mb-3 fw-normal">1. Personal Info</h6>

                                <div class="row g-3">

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">Name</label>
                                        <input type="text" class="form-control @error('name') is-invalid @enderror"
                                            name="name" value="{{ old('name') }}" />
                                        @error('name')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">Dealer</label>
                                        <select class="select2 form-select form-select-lg" data-allow-clear="false"
                                            name="dealer_customer_id">
                                            <option value="">--Select Dealer--</option>
                                            @foreach ($customers as $customer)
                                                <option value="{{ $customer->id }}">
                                                    {{ $customer->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('dealer_customer_id')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">Background</label>
                                        <select class="select2 form-select form-select-lg" data-allow-clear="false"
                                            name="background">
                                            <option value="Individual">
                                                Individual
                                            </option>
                                            <option value="Company">
                                                Company
                                            </option>
                                        </select>
                                        @error('customer')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">NRC NO</label>
                                        <input type="text" class="form-control @error('nrc_no') is-invalid @enderror"
                                            name="nrc_no" value="{{ old('nrc_no') }}" />
                                        @error('nrc_no')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-email">Phone</label>
                                        <div class="input-group input-group-merge">
                                            <input type="text" class="form-control @error('phone') is-invalid @enderror"
                                                name="phone" value="{{ old('phone') }}" />
                                            @error('phone')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-email">Email</label>
                                        <div class="input-group input-group-merge">
                                            <input type="text" class="form-control @error('email') is-invalid @enderror"
                                                name="email" value="{{ old('email') }}" />
                                            @error('email')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-password-toggle">
                                            <label class="form-label" for="formtabs-password">Address</label>
                                            <div class="input-group input-group-merge">
                                                <input type="text"
                                                    class="form-control @error('address') is-invalid @enderror"
                                                    name="address" value="{{ old('address') }}" />
                                                @error('address')
                                                    <div class="invalid-feedback"> {{ $message }} </div>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">Country</label>
                                        <input type="text" class="form-control @error('country') is-invalid @enderror"
                                            name="country" value="{{ old('country') }}" />
                                        @error('country')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">City</label>
                                        <input type="text" class="form-control @error('city') is-invalid @enderror"
                                            name="city" value="{{ old('city') }}" />
                                        @error('city')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">State</label>
                                        <input type="text" class="form-control @error('state') is-invalid @enderror"
                                            name="state" value="{{ old('state') }}" />
                                        @error('state')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label" for="formtabs-username">Description</label>
                                        <input type="text" class="form-control @error('description') is-invalid @enderror"
                                            name="description" value="{{ old('description') }}" />
                                        @error('description')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">Opening Balance</label>
                                        <input type="text"
                                            class="form-control @error('opening_balance') is-invalid @enderror"
                                            name="opening_balance" value="{{ old('opening_balance') }}" />
                                        @error('opening_balance')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                    <div class="col-md-3">
                                        <label class="form-label" for="formtabs-username">Opening Balance as At
                                            Date</label>
                                        <input type="date"
                                            class="form-control @error('opening_balance_date') is-invalid @enderror"
                                            name="opening_balance_date" value="{{ old('opening_balance_date') }}" />
                                        @error('opening_balance_date')
                                            <div class="invalid-feedback"> {{ $message }} </div>
                                        @enderror
                                    </div>

                                </div>
                                <div class="pt-4">
                                    <button type="submit" class="btn btn-primary me-sm-3 me-1">Save</button>
                                    <a href="{{ route('customer.index') }}" class="btn btn-label-secondary">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\StoreCustomer', '#create-form') !!}
    {!! JsValidator::formRequest('App\Http\Requests\StoreHpCustomer', '#create-hp-form') !!}
@endsection
