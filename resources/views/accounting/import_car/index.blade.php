@extends('layouts.menus.accounting')
@section('content')
    <div class="row justify-content-center outer-wrapper">
        <div class="col-md-12 col-sm-12 col-lg-12 inner-wrapper">
            <div class="card">
                <div class="card-body">
                    <div class="card-title header-elements">
                        <h5 class="m-0 me-2">Import Car List</h5>
                        <div class="card-title-elements ms-auto">
                            <div class="btn-group">
                                <button type="button" class="btn btn-success btn-sm dropdown-toggle"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    Export
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a class="dropdown-item" href="{{ route('cashbook_export') }}">Excel
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="table-responsive text-nowrap rowheaders table-scroll outer-wrapper">
                    <table class="table table-bordered main-table py-5" style="margin-bottom: 1px !important;"
                        id="tbl_exporttable_to_xls">
                        <thead class="tbbg">
                            <th style="color: white; text-align: center; width: 1%;">
                                #
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Commodity
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                ID No
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                A/U
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Qty
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Rate USD
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Amount USD
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Exchange Rate
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Con; Kyats
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Adjustment Value AD
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Total Value
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Import Duty & Other Tax
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Commercial tax
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Maccs Service Fee
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Security Fee
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Redemption Fine
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                AV Rates
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                AV Value Kyats
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Advance Tax
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Total Expenses
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Custom Duty
                            </th>

                            <th style="color: white; text-align: center; width: 10%;">
                                Action
                            </th>

                        </thead>
                        <tbody class="table-border-bottom-0 t">
                            @foreach ($products as $key => $product)
                                <tr>
                                    <td>
                                        {{ $key + 1 }}
                                    </td>

                                    <td style="text-align: left;">
                                        {{ $product->commodity ?? '' }}
                                    </td>

                                    <td style="text-align: left;">
                                        {{ $product->id_no ?? '' }}
                                    </td>

                                    <td style="text-align: left;">
                                        {{ $product->unit ?? '' }}
                                    </td>

                                    <td style="text-align: right;">
                                        {{ $product->quantity ?? '' }}
                                    </td>

                                    {{-- Rate USD --}}
                                    <td style="text-align: right;">
                                        {{ number_format($product->amount_usd / $product->quantity) }}
                                    </td>

                                    {{-- Amount USD --}}
                                    <td style="text-align: right;">
                                        {{ $product->amount_usd ?? '' }}
                                    </td>

                                    {{-- Exchange Rate --}}
                                    <td style="text-align: right;">
                                        {{ $product->exchange_rate ?? '' }}
                                    </td>

                                    {{-- Con; Kyats --}}
                                    <td style="text-align: right;">
                                        {{ $product->amount_usd * $product->exchange_rate }}
                                    </td>

                                    {{-- Adjustment Value AD --}}
                                    <td style="text-align: right;">
                                        {{ $product->adjustment_value_ad ?? '' }}
                                    </td>

                                    {{-- Total Value --}}
                                    <td style="text-align: right;">
                                        {{ $product->amount_usd + $product->adjustment_value_ad }}
                                    </td>

                                    {{-- Import Duty & Other Tax --}}
                                    <td style="text-align: right;">
                                        {{ $product->amount_usd + $product->adjustment_value_ad }}
                                    </td>

                                    {{-- Commercial tax --}}
                                    <td style="text-align: right;">
                                        {{ $product->id_no ?? '' }}
                                    </td>

                                    {{-- Maccs Service Fee --}}
                                    <td style="text-align: right;">
                                        {{ $product->maccs_service_fee ?? '' }}
                                    </td>

                                    <td style="text-align: right;">
                                        {{ $product->security_fee ?? '' }}
                                    </td>

                                    {{-- Redemption Fine --}}
                                    <td style="text-align: right;">
                                        {{ $product->redemption_fine ?? '' }}
                                    </td>

                                    {{-- AV Rates --}}
                                    <td style="text-align: right;">
                                        {{ round($product->avg('exchange_rate'), 2) }}
                                    </td>

                                    {{-- AV Value Kyats --}}
                                    <td style="text-align: right;">
                                        @php
                                            $av_value_kyats = ($product->amount_usd + $product->adjustment_value_ad) * round($product->avg('exchange_rate'), 2);
                                            echo $av_value_kyats;
                                        @endphp
                                    </td>

                                    {{-- Advance Tax --}}
                                    <td style="text-align: right;">
                                        @php
                                            $advance_tax = $av_value_kyats * $product->advance_tax_percent;
                                            echo $advance_tax;
                                        @endphp
                                    </td>

                                    {{-- Total Expenses --}}
                                    <td style="text-align: right;">
                                        {{ $product->id_no ?? '' }}
                                    </td>

                                    <td style="text-align: right;">
                                        {{ $product->id_no ?? '' }}
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="pseduo-track"></div>
            </div>
        </div>
    </div>
@endsection

@section('script')
@endsection
