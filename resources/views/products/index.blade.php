@extends('layouts.menus.accounting')
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-12 col-sm-12 col-lg-12">
            <div class="card">

                <div class="card-body">
                    <div class="card-title header-elements">
                        <h5 class="m-0 me-2">List of Products</h5>
                        <div class="card-title-elements ms-auto">
                            @include('layouts.includes.export')

                            <a href="{{ route('products.create') }}" class="dt-button create-new btn btn-primary btn-sm">
                                <span>
                                    <i class="bx bx-plus me-sm-2"></i>
                                    <span class="d-none d-sm-inline-block">Create</span>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="table-responsive text-nowrap rowheaders table-scroll" role="region" aria-labelledby="HeadersCol"
                    tabindex="0">
                    <table class="table table-bordered main-table py-5" id="export_excel">
                        <thead class="tbbg">
                            <th style="color: white; text-align: center; width: 1%;">#</th>
                            <th style="color: white; text-align: center;">Name</th>
                            <th style="color: white; text-align: center;">Code</th>
                            <th style="color: white; text-align: center;">Description</th>
                            <th style="color: white; text-align: center;">Opening Cost</th>
                            <th style="color: white; text-align: center;">Quantity on Hand</th>
                            <th style="color: white; text-align: center;">Opening Quantity as At Date</th>
                            <th style="color: white; text-align: center;">Selling Price</th>
                            <th style="color: white; text-align: center;">Sales Account</th>
                            <th style="color: white; text-align: center;">Cost of unit</th>
                            <th style="color: white; text-align: center;">Purchase Account</th>
                            <th style="color: white; text-align: center;">Action</th>
                        </thead>
                        <tbody class="table-border-bottom-0">
                            @foreach ($products as $key => $product)
                                <tr>
                                    <td>
                                        {{ $key + 1 }}
                                    </td>
                                    <td style="text-align: center;">
                                        {{ $product->name }}
                                    </td>
                                    <td style="text-align: center;">
                                        {{ $product->item_code }}
                                    </td>
                                    <td style="text-align: center;">
                                        {{ $product->description }}
                                    </td>
                                    <td style="text-align: right;">
                                        {{ number_format($product->opening_cost) }}
                                    </td>
                                    <td style="text-align: right;">
                                        {{ number_format($product->opening_quantity) }}
                                    </td>
                                    <td style="text-align: center;">
                                        {{ $product->qty_at_date }}
                                    </td>
                                    <td style="text-align: right;">
                                        {{ number_format($product->selling_price) }}
                                    </td>
                                    <td style="text-align: center;">
                                        {{ $product->get_sale_account->coa_number }}
                                    </td>
                                    <td style="text-align: right;">
                                        {{ number_format($product->cost_of_unit) }}
                                    </td>
                                    <td style="text-align: center;">
                                        {{ $product->get_purchase_account->coa_number }}
                                    </td>

                                    <td style="text-align: center;">
                                        <div class="demo-inline-spacing">
                                            <div class="btn-group">
                                                <button class="btn btn-info btn-sm dropdown-toggle" type="button"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                    Action
                                                </button>
                                                <ul class="dropdown-menu">

                                                    <li>
                                                        <a class="dropdown-item" href="#">Detail</a>
                                                    </li>

                                                    <li>
                                                        <a class="dropdown-item"
                                                            href="{{ route('products.edit', $product->id) }}">Edit</a>
                                                    </li>

                                                    <li>
                                                        <form action="{{ route('products.destroy', $product->id) }}"
                                                            method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="button" class="dropdown-item del_confirm"
                                                                id="confirm-text" data-toggle="tooltip">Delete</button>
                                                        </form>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tr>
                            <td colspan="4">Total:</td>
                            <td style="text-align: right; font-weight: bold">
                                {{ number_format($products->sum('opening_cost'), 2) }}
                            </td>

                            <td style="text-align: right; font-weight: bold">
                                {{ number_format($products->sum('opening_quantity'), 2) }}
                            </td>

                            <td></td>

                            <td style="text-align: right; font-weight: bold">
                                {{ number_format($products->sum('selling_price'), 2) }}
                            </td>
                            <td></td>
                            <td style="text-align: right; font-weight: bold">
                                {{ number_format($products->sum('cost_of_unit'), 2) }}
                            </td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>
    </div>
@endsection

@section('script')
@endsection
