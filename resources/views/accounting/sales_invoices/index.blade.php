@extends('layouts.menus.accounting')
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-12 col-sm-12 col-lg-12">
            <div class="card">

                <div class="card-body">
                    <div class="card-title header-elements">
                        <h5 class="m-0 me-2">
                            Sales Invoices
                        </h5>
                        <div class="card-title-elements ms-auto">
                            <a href="{{ route('sales_invoices.create') }}"
                                class="dt-button create-new btn btn-primary btn-sm">
                                <span>
                                    <i class="bx bx-plus me-sm-2"></i>
                                    <span class="d-none d-sm-inline-block">Create</span>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="table-responsive text-nowrap rowheaders table-scroll outer-wrapper" role="region"
                    aria-labelledby="HeadersCol" tabindex="0">
                    <table class="table table-bordered main-table" id="export_excel">
                        <thead class="tbbg">
                            <th style="color: white; text-align: center; width: 1%;">Sr.No</th>
                            <th style="color: white; text-align: center; width: 10%;">Invoice No.</th>
                            <th style="color: white; text-align: center; width: 10%;">Date</th>
                            <th style="color: white; text-align: center; width: 10%;">Company Name</th>
                            <th style="color: white; text-align: center; width: 10%;">Dealer Name</th>
                            <th style="color: white; text-align: center; width: 10%;">Brand Name</th>
                            <th style="color: white; text-align: center; width: 10%;">Type</th>
                            <th style="color: white; text-align: center; width: 10%;">Model</th>
                            <th style="color: white; text-align: center; width: 10%;">Color</th>
                            <th style="color: white; text-align: center; width: 10%;">Chassis No.</th>
                            <th style="color: white; text-align: center; width: 10%;">Vehicle No. </th>
                            <th style="color: white; text-align: center; width: 10%;">Qty</th>
                            <th style="color: white; text-align: center; width: 10%;">Unit Price</th>
                            <th style="color: white; text-align: center; width: 10%;">Sales Value</th>
                            <th style="color: white; text-align: center; width: 10%;">Total Amount</th>
                            <th style="color: white; text-align: center; width: 10%;">Down Payment</th>
                            <th style="color: white; text-align: center; width: 10%;">Discount</th>
                            <th style="color: white; text-align: center; width: 10%;">Dealer Percentage</th>
                            <th style="color: white; text-align: center; width: 10%;">Balance to Pay</th>
                            <th style="color: white; text-align: center; width: 10%;">Action</th>
                        </thead>
                        <tbody class="table-border-bottom-0 row_position" id="tablecontents">
                            @if ($form_status == 'is_create')
                                @include('accounting.sales_invoices.form.create_form')
                            @endif
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
@endsection

@section('script')
@endsection
