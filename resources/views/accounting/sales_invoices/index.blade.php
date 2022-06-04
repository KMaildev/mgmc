@extends('layouts.menus.accounting')
@section('content')
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
        }

    </style>
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

                <div class="second_table outer-wrapper">
                    <table class="">
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

                            @foreach ($sales_invoices as $key => $sales_invoice)
                                <tr style="background-color: white;">
                                    <td>
                                        {{ $key + 1 }}
                                    </td>

                                    <td>
                                        {{ $sales_invoice->invoice_no }}
                                    </td>

                                    <td>
                                        {{ $sales_invoice->invoice_date }}
                                    </td>

                                    <td>
                                        {{ $sales_invoice->customers_table->company_name ?? '' }}
                                    </td>

                                    <td>
                                        {{ $sales_invoice->customers_table->name ?? '' }}
                                    </td>

                                    {{-- Brand Name --}}
                                    <td>
                                        @foreach ($sales_invoice->sales_items_table as $sales_items)
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        {{ $sales_items->products_table->brand_name ?? '' }}
                                                    </td>
                                                </tr>
                                            </table>
                                        @endforeach
                                    </td>

                                    {{-- Type --}}
                                    <td>
                                        @foreach ($sales_invoice->sales_items_table as $sales_items)
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        {{ $sales_items->products_table->type ?? '' }}
                                                    </td>
                                                </tr>
                                            </table>
                                        @endforeach
                                    </td>

                                    {{-- Model --}}
                                    <td>
                                        @foreach ($sales_invoice->sales_items_table as $sales_items)
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        {{ $sales_items->products_table->model_no ?? '' }}
                                                    </td>
                                                </tr>
                                            </table>
                                        @endforeach
                                    </td>

                                    {{-- Color --}}
                                    <td>
                                        @foreach ($sales_invoice->sales_items_table as $sales_items)
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        {{ $sales_items->products_table->body_color ?? '' }}
                                                    </td>
                                                </tr>
                                            </table>
                                        @endforeach
                                    </td>

                                    {{-- Chassis No --}}
                                    <td>
                                        @foreach ($sales_invoice->sales_items_table as $sales_items)
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        {{ $sales_items->products_table->chessi_no ?? '' }}
                                                    </td>
                                                </tr>
                                            </table>
                                        @endforeach
                                    </td>

                                    {{-- Vehicle No. --}}
                                    <td>
                                        @foreach ($sales_invoice->sales_items_table as $sales_items)
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        {{ $sales_items->products_table->vehicle_no ?? '' }}
                                                    </td>
                                                </tr>
                                            </table>
                                        @endforeach
                                    </td>

                                    {{-- Qty --}}
                                    <td>
                                        @foreach ($sales_invoice->sales_items_table as $sales_items)
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        {{ $sales_items->qty ?? 0 }}
                                                    </td>
                                                </tr>
                                            </table>
                                        @endforeach
                                    </td>

                                    {{-- Unit Price --}}
                                    <td>
                                        @foreach ($sales_invoice->sales_items_table as $sales_items)
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        {{ $sales_items->unit_price ?? 0 }}
                                                    </td>
                                                </tr>
                                            </table>
                                        @endforeach
                                    </td>

                                    {{-- Sales Value --}}
                                    <td>
                                        @php
                                            $total_amount = [];
                                        @endphp
                                        @foreach ($sales_invoice->sales_items_table as $sales_items)
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        @php
                                                            $qty = $sales_items->qty;
                                                            $unit_price = $sales_items->unit_price;
                                                            $sale_value = $qty * $unit_price;
                                                            echo $sale_value;
                                                            $total_amount[] = $sale_value;
                                                        @endphp
                                                    </td>
                                                </tr>
                                            </table>
                                        @endforeach
                                    </td>

                                    {{-- Total Amount --}}
                                    <td>
                                        @php
                                            $amount_total = array_sum($total_amount);
                                            echo $amount_total;
                                        @endphp
                                    </td>

                                    {{-- Down Payment --}}
                                    <td>
                                        @php
                                            $down_payment = $sales_invoice->sales_invoices_payments_table->down_payment ?? 0;
                                            echo $down_payment;
                                        @endphp
                                    </td>

                                    {{-- Discount --}}
                                    <td>
                                        @php
                                            $discount = $sales_invoice->sales_invoices_payments_table->discount ?? 0;
                                            echo $discount;
                                        @endphp
                                    </td>

                                    {{-- dealer_ercentage --}}
                                    <td>
                                        @php
                                            $amount_total = array_sum($total_amount);
                                            $dealer_ercentage = $sales_invoice->sales_invoices_payments_table->dealer_ercentage ?? 0;
                                            $dealer_ercentage_total = $amount_total * ($dealer_ercentage / 100);
                                            echo $dealer_ercentage_total;
                                        @endphp
                                    </td>

                                    {{-- Balance to Pay --}}
                                    <td>
                                        @php
                                            $amount_total = array_sum($total_amount);
                                            $down_payment = $sales_invoice->sales_invoices_payments_table->down_payment ?? 0;
                                            $discount = $sales_invoice->sales_invoices_payments_table->discount ?? 0;
                                            $dealer_ercentage_total = $dealer_ercentage_total;
                                            $balance_to_pay = $amount_total - $down_payment - $discount - $dealer_ercentage_total;
                                            echo $balance_to_pay;
                                        @endphp
                                    </td>

                                    <td>Edit</td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
@endsection
