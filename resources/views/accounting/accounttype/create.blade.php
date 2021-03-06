@extends('layouts.menus.accounting')
@section('content')

    <div class="row justify-content-center">
        <div class="col-xl-6">
            <div class="card mb-4">
                <h5 class="card-header">Account Type</h5>
                <div class="card-body">

                    <form action="{{ route('accounttype.store') }}" method="POST" autocomplete="off" id="my-form"
                        role="form">
                        @csrf

                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Account Type</label>
                            <div class="col-md-9">
                                <select id="defaultSelect" class="form-select @error('account_type') is-invalid @enderror"
                                    name="account_type">
                                    <option value="">--Please Select Account Type--</option>
                                    @foreach ($account_classifications as $account_classification)
                                        <option value="{{ $account_classification->id }}">
                                            {{ $account_classification->name }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('account_type')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Account Number</label>
                            <div class="col-md-9">
                                <div class="input-group">

                                    <span class="input-group-text ac_number" id="ac_number"></span>
                                    <input type="hidden" id="ac_number_hidden" name="account_number">

                                    <input type="text" class="form-control @error('account_number') is-invalid @enderror"
                                        oninput="getValue();" id="account_number" />
                                    @error('account_number')
                                        <div class="invalid-feedback"> {{ $message }} </div>
                                    @enderror
                                </div>
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Description</label>
                            <div class="col-md-9">
                                <input class="form-control @error('description') is-invalid @enderror" type="text"
                                    name="description" value="{{ old('description') }}" />
                                @error('description')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="html5-text-input" class="col-md-3 col-form-label">Financial Statement</label>
                            <div class="col-md-9">
                                <select id="defaultSelect"
                                    class="form-select @error('financial_statement') is-invalid @enderror"
                                    name="financial_statement">
                                    <option value="">--Please Select Financial Statement--</option>
                                    <option value="BalanceSheet">Balance Sheet</option>
                                    <option value="IncomeStatement">Income Statement</option>
                                </select>
                                @error('financial_statement')
                                    <div class="invalid-feedback"> {{ $message }} </div>
                                @enderror
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="html5-search-input" class="col-md-3 col-form-label"></label>
                            <div class="col-md-9">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <a href="{{ route('accounttype.index') }}" class="btn btn-success">Cancel</a>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script type="text/javascript">
        var ac_number_hidden = document.getElementById("ac_number_hidden");
        var account_number = document.getElementById("account_number");

        $(document).ready(function() {
            $('select[name="account_type"]').on('change', function() {
                var classificationID = $(this).val();
                if (classificationID) {
                    $.ajax({
                        url: '/classificationdependent/ajax/' + classificationID,
                        type: "GET",
                        dataType: "json",
                        success: function(data) {
                            let text = data.ac_code
                            let acnumber = text.charAt(0);
                            document.getElementById("ac_number").innerHTML = acnumber + '-';

                            account_number.value = '';
                            ac_number_hidden.value = '';
                        }
                    });
                }

            });
        });

        function getValue() {
            var ac_number = document.querySelector(".ac_number").innerHTML;
            var account_number = document.getElementById("account_number").value;
            var classify_acnumber = ac_number + account_number;
            ac_number_hidden.value = classify_acnumber;
        }
    </script>
@endsection
