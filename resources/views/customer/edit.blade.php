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
                            @if ($customer->dealer_or_hp == 'dealer')
                                <li class="nav-item">
                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#form-tabs-personal"
                                        role="tab" aria-selected="true">Dealer</button>
                                </li>
                            @elseif ($customer->dealer_or_hp == 'hp')
                                <li class="nav-item">
                                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#form-tabs-account"
                                        role="tab" aria-selected="false">HP</button>
                                </li>
                            @endif
                        </ul>
                    </div>

                    <div class="tab-content">
                        {{-- Dealer --}}
                        @if ($customer->dealer_or_hp == 'dealer')
                            <div class="tab-pane fade active show" id="form-tabs-personal" role="tabpanel">
                                <form class="card-body" autocomplete="off"
                                    action="{{ route('customer.update', $customer->id) }}" method="POST" id="edit-form">
                                    @csrf
                                    @method('PUT')

                                    <input type="hidden" value="dealer" name="dealer_or_hp">
                                    <input type="hidden" value="{{ $customer->dealer_customer_id }}"
                                        name="dealer_customer_id">

                                    <h6 class="mb-3 fw-normal">1. Personal Info</h6>

                                    <div class="row g-3">

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">Name</label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                                name="name" value="{{ $customer->name }}" />
                                            @error('name')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">Background</label>
                                            <select id="CustomerId" class="select2 form-select form-select-lg"
                                                data-allow-clear="false" name="background">
                                                <option value="Individual"
                                                    @if ($customer->background == 'Individual') selected @endif>
                                                    Individual
                                                </option>
                                                <option value="Company" @if ($customer->background == 'Company') selected @endif>
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
                                                name="nrc_no" value="{{ $customer->nrc_no }}" />
                                            @error('nrc_no')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-email">Phone</label>
                                            <div class="input-group input-group-merge">
                                                <input type="text" class="form-control @error('phone') is-invalid @enderror"
                                                    name="phone" value="{{ $customer->phone }}" />
                                                @error('phone')
                                                    <div class="invalid-feedback"> {{ $message }} </div>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-email">Email</label>
                                            <div class="input-group input-group-merge">
                                                <input type="text" class="form-control @error('email') is-invalid @enderror"
                                                    name="email" value="{{ $customer->email }}" />
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
                                                        name="address" value="{{ $customer->address }}" />
                                                    @error('address')
                                                        <div class="invalid-feedback"> {{ $message }} </div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">Country</label>
                                            <input type="text" class="form-control @error('country') is-invalid @enderror"
                                                name="country" value="{{ $customer->country }}" />
                                            @error('country')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">City</label>
                                            <input type="text" class="form-control @error('city') is-invalid @enderror"
                                                name="city" value="{{ $customer->city }}" />
                                            @error('city')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">State</label>
                                            <input type="text" class="form-control @error('state') is-invalid @enderror"
                                                name="state" value="{{ $customer->state }}" />
                                            @error('state')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" for="formtabs-username">Description</label>
                                            <input type="text"
                                                class="form-control @error('description') is-invalid @enderror"
                                                name="description" value="{{ $customer->description }}" />
                                            @error('description')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">Opening Balance</label>
                                            <input type="text"
                                                class="form-control @error('opening_balance') is-invalid @enderror"
                                                name="opening_balance" value="{{ $customer->opening_balance }}" />
                                            @error('opening_balance')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">Opening Balance as At
                                                Date</label>
                                            <input type="date"
                                                class="form-control @error('opening_balance_date') is-invalid @enderror"
                                                name="opening_balance_date"
                                                value="{{ $customer->opening_balance_date }}" />
                                            @error('opening_balance_date')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                    </div>
                                    <div class="pt-4">
                                        <button type="submit" class="btn btn-primary me-sm-3 me-1">Save</button>
                                        <a href="{{ route('customer.index') }}"
                                            class="btn btn-label-secondary">Cancel</a>
                                    </div>
                                </form>
                            </div>
                        @elseif ($customer->dealer_or_hp == 'hp')
                            {{-- HP --}}
                            <div class="tab-pane fade active show" id="form-tabs-account" role="tabpanel">
                                <form class="card-body" autocomplete="off"
                                    action="{{ route('customer.update', $customer->id) }}" method="POST"
                                    id="edit-hp-form">
                                    @csrf
                                    @method('PUT')

                                    <input type="hidden" value="dealer" name="dealer_or_hp">

                                    <h6 class="mb-3 fw-normal">1. Personal Info</h6>

                                    <div class="row g-3">

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">Name</label>
                                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                                name="name" value="{{ $customer->name }}" />
                                            @error('name')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">Dealer</label>
                                            <select class="select2 form-select form-select-lg" data-allow-clear="false"
                                                name="dealer_customer_id">
                                                <option value="">--Select Dealer--</option>
                                                @foreach ($customers as $customer_list)
                                                    <option value="{{ $customer_list->id }}"
                                                        @if ($customer_list->id == $customer->dealer_customer_id) selected @endif>
                                                        {{ $customer_list->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @error('dealer_customer_id')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">Background</label>
                                            <select id="CustomerId" class="select2 form-select form-select-lg"
                                                data-allow-clear="false" name="background">
                                                <option value="Individual"
                                                    @if ($customer->background == 'Individual') selected @endif>
                                                    Individual
                                                </option>
                                                <option value="Company" @if ($customer->background == 'Company') selected @endif>
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
                                                name="nrc_no" value="{{ $customer->nrc_no }}" />
                                            @error('nrc_no')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-email">Phone</label>
                                            <div class="input-group input-group-merge">
                                                <input type="text"
                                                    class="form-control @error('phone') is-invalid @enderror" name="phone"
                                                    value="{{ $customer->phone }}" />
                                                @error('phone')
                                                    <div class="invalid-feedback"> {{ $message }} </div>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-email">Email</label>
                                            <div class="input-group input-group-merge">
                                                <input type="text"
                                                    class="form-control @error('email') is-invalid @enderror" name="email"
                                                    value="{{ $customer->email }}" />
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
                                                        name="address" value="{{ $customer->address }}" />
                                                    @error('address')
                                                        <div class="invalid-feedback"> {{ $message }} </div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">Country</label>
                                            <input type="text" class="form-control @error('country') is-invalid @enderror"
                                                name="country" value="{{ $customer->country }}" />
                                            @error('country')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">City</label>
                                            <input type="text" class="form-control @error('city') is-invalid @enderror"
                                                name="city" value="{{ $customer->city }}" />
                                            @error('city')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">State</label>
                                            <input type="text" class="form-control @error('state') is-invalid @enderror"
                                                name="state" value="{{ $customer->state }}" />
                                            @error('state')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label" for="formtabs-username">Description</label>
                                            <input type="text"
                                                class="form-control @error('description') is-invalid @enderror"
                                                name="description" value="{{ $customer->description }}" />
                                            @error('description')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">Opening Balance</label>
                                            <input type="text"
                                                class="form-control @error('opening_balance') is-invalid @enderror"
                                                name="opening_balance" value="{{ $customer->opening_balance }}" />
                                            @error('opening_balance')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label" for="formtabs-username">Opening Balance as At
                                                Date</label>
                                            <input type="date"
                                                class="form-control @error('opening_balance_date') is-invalid @enderror"
                                                name="opening_balance_date"
                                                value="{{ $customer->opening_balance_date }}" />
                                            @error('opening_balance_date')
                                                <div class="invalid-feedback"> {{ $message }} </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="pt-4">
                                        <button type="submit" class="btn btn-primary me-sm-3 me-1">Save</button>
                                        <a href="{{ route('customer.index') }}"
                                            class="btn btn-label-secondary">Cancel</a>
                                    </div>
                                </form>
                            </div>
                        @endif

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    {!! JsValidator::formRequest('App\Http\Requests\UpdateCustomer', '#create-form') !!}
    {!! JsValidator::formRequest('App\Http\Requests\UpdateHpCustomer', '#create-hp-form') !!}
@endsection
