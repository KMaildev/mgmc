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
                    aria-labelledby="HeadersCol">
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

                            @foreach ($sales_invoices as $key => $sales_invoice)
                                <tr>
                                    <td rowspan="3">
                                        {{ $key + 1 }}
                                    </td>

                                    <td rowspan="3">
                                        {{ $sales_invoice->invoice_no }}
                                    </td>

                                    <td rowspan="3">
                                        {{ $sales_invoice->invoice_date }}
                                    </td>

                                    <td rowspan="3">
                                        {{ $sales_invoice->customers_table->company_name ?? '' }}
                                    </td>

                                    <td rowspan="3">
                                        {{ $sales_invoice->customers_table->name ?? '' }}
                                    </td>

                                    @foreach ($sales_invoice->sales_items_table as $sales_items)
                                        {{-- sales_items --}}
                                        <td>
                                            {{ $sales_items->products_table->brand_name ?? '' }}
                                        </td>

                                        <td>
                                            {{ $sales_items->products_table->type ?? '' }}
                                        </td>

                                        <td>
                                            {{ $sales_items->products_table->model_no ?? '' }}
                                        </td>

                                        <td>
                                            {{ $sales_items->products_table->body_color ?? '' }}
                                        </td>

                                        <td>
                                            {{ $sales_items->products_table->chessi_no ?? '' }}
                                        </td>

                                        <td>
                                            {{ $sales_items->products_table->vehicle_no ?? '' }}
                                        </td>

                                        <td>
                                            {{ $sales_items->qty ?? 0 }}
                                        </td>

                                        <td>
                                            {{ $sales_items->unit_price ?? 0 }}
                                        </td>


                                        {{-- Sales Value --}}
                                        <td>
                                            @php
                                                $qty = $sales_items->qty;
                                                $unit_price = $sales_items->unit_price;
                                                $sale_value = $qty * $unit_price;
                                                echo $sale_value;
                                            @endphp
                                        </td>

                                        {{-- Total Amount --}}
                                        <td>
                                            @php
                                                $qty = $sales_items->qty;
                                                $unit_price = $sales_items->unit_price;
                                                $sale_value = $qty * $unit_price;
                                                echo $sale_value;
                                            @endphp
                                        </td>
                                    @endforeach

                                    {{-- Down Payment --}}
                                    <td rowspan="3">
                                        @php
                                            $down_payment = $sales_invoice->sales_invoices_payments_table->down_payment ?? 0;
                                            echo $down_payment;
                                        @endphp
                                    </td>

                                    {{-- Discount --}}
                                    <td rowspan="3">
                                        @php
                                            $discount = $sales_invoice->sales_invoices_payments_table->discount;
                                            echo $discount;
                                        @endphp
                                    </td>

                                    {{-- dealer_ercentage --}}
                                    <td rowspan="3">
                                        @php
                                            $dealer_ercentage = $sales_invoice->sales_invoices_payments_table->dealer_ercentage;
                                            echo $dealer_ercentage;
                                            echo '%';
                                        @endphp
                                    </td>

                                </tr>
                            @endforeach
                        </tbody>



                        @foreach ($sales_invoices as $key => $sales_invoice)
                            <tr>
                                <td rowspan="{{ count($sales_invoice->sales_items_table) }}">
                                    {{ $key + 1 }}
                                </td>
                                <td rowspan="{{ count($sales_invoice->sales_items_table) }}">
                                    {{ $sales_invoice->invoice_no }}
                                </td>
                                <td rowspan="{{ count($sales_invoice->sales_items_table) }}">
                                    {{ $sales_invoice->invoice_date }}
                                </td>
                            </tr>
                            @foreach ($sales_invoice->sales_items_table as $sales_items)
                                <tr>
                                    <td>
                                        {{ $sales_items->products_table->brand_name ?? '' }}
                                    </td>

                                    <td>
                                        {{ $sales_items->products_table->type ?? '' }}
                                    </td>

                                    <td>
                                        {{ $sales_items->products_table->model_no ?? '' }}
                                    </td>
                                </tr>
                            @endforeach
                        @endforeach
                    </table>
                </div>


                <table>
                    @foreach ($sales_invoices as $key => $sales_invoice)
                        <tr>
                            <td rowspan="3">
                                {{ $key + 1 }}
                            </td>
                            <td rowspan="3">
                                {{ $sales_invoice->invoice_no }}
                            </td>
                            <td rowspan="3">
                                {{ $sales_invoice->invoice_date }}
                            </td>
                        </tr>
                        @foreach ($sales_invoice->sales_items_table as $sales_items)
                            <tr>
                                <td>
                                    {{ $sales_items->products_table->brand_name ?? '' }}
                                </td>

                                <td>
                                    {{ $sales_items->products_table->type ?? '' }}
                                </td>

                                <td>
                                    {{ $sales_items->products_table->model_no ?? '' }}
                                </td>
                            </tr>
                        @endforeach
                    @endforeach
                </table>







                <table>
                    <tr>
                        <td>IV-0001/20</td>
                        <td>16-May-20</td>
                        <td>Karry</td>
                        <td>Q22D</td>
                        <td>#REF!</td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td>Karry</td>
                        <td>asdf</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>Karry</td>
                        <td>asdf</td>
                        <td></td>
                    </tr>
                </table>


            </div>
        </div>
    </div>
@endsection

@section('script')
@endsection
