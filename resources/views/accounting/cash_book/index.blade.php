@extends('layouts.menus.accounting')
@section('content')
    <link rel="stylesheet" href="{{ asset('css/table.css') }}" />
    <div class="row justify-content-center outer-wrapper">
        <div class="col-md-12 col-sm-12 col-lg-12 inner-wrapper">
            <div class="card">

                <div class="card-body">
                    <div class="card-title header-elements">
                        <h5 class="m-0 me-2">Cash Book</h5>
                        <div class="card-title-elements ms-auto">
                            @include('layouts.includes.export')
                        </div>
                    </div>
                </div>

                <div class="table-responsive text-nowrap rowheaders table-scroll outer-wrapper">
                    <table class="table table-bordered main-table py-5" id="export_excel"
                        style="margin-bottom: 1px !important;">
                        <thead class="tbbg">
                            <th style="color: white; text-align: center; width: 1%;">#</th>
                            <th style="color: white; text-align: center;">
                                Date</th>
                            <th style="color: white; text-align: center;">
                                Month</th>
                            <th style="color: white; text-align: center;">
                                Year</th>
                            <th style="color: white; text-align: center;">
                                IV-No</th>
                            <th style="color: white; text-align: center;">
                                IV-No2</th>
                            <th style="color: white; text-align: center;">
                                A/C Code</th>
                            <th style="color: white; text-align: center;">
                                A/C Head</th>
                            <th style="color: white; text-align: center;">
                                A/C Name</th>
                            <th style="color: white; text-align: center;">
                                Description</th>
                            <th style="color: white; text-align: center;">
                                Cash AC</th>
                            <th style="color: white; text-align: center;">
                                Cash-In</th>
                            <th style="color: white; text-align: center;">
                                Cash-Out</th>
                            <th style="color: white; text-align: center;">
                                Cash-Balance</th>
                            <th style="color: white; text-align: center;">
                                Bank AC</th>
                            <th style="color: white; text-align: center;">
                                Bank-In</th>
                            <th style="color: white; text-align: center;">
                                Bank-Out</th>
                            <th style="color: white; text-align: center;">
                                Bank-Balance</th>
                            <th style="color: white; text-align: center;">
                                Deposit(Cash+Bank)</th>
                            <th style="color: white; text-align: center;">
                                Withdraw(Cash+Bank)</th>
                            <th style="color: white; text-align: center;">
                                Bank Name</th>
                            <th style="color: white; text-align: center;">
                                Action</th>
                        </thead>
                        <tbody class="table-border-bottom-0 t">

                            {{-- cash book create --}}
                            @if ($cash_book_form_status == 'is_create')
                                @include('accounting.cash_book.create_form', [
                                    'chartof_accounts' => $chartof_accounts,
                                ])
                            @elseif ($cash_book_form_status == 'is_edit')
                                @include('accounting.cash_book.edit_form', [
                                    'chartof_accounts' => $chartof_accounts,
                                    'edit_cash_book_data' => $edit_cash_book_data,
                                ])
                            @endif


                            <?php $cash_balance = 0; ?>
                            <?php $bank_balance = 0; ?>
                            <?php $closing_balance = 0; ?>
                            <?php $deposit = 0; ?>
                            <?php $withdraw = 0; ?>
                            @foreach ($cash_books as $key => $cash_book)
                                <tr>
                                    <td style="text-align: center;">
                                        {{ $key + 1 }}
                                    </td>

                                    <td style="text-align: center;">
                                        {{ $cash_book->cash_book_date }}
                                    </td>

                                    <td style="text-align: center;">
                                        {{ $cash_book->month }}
                                    </td>

                                    <td style="text-align: center;">
                                        {{ $cash_book->year }}
                                    </td>

                                    <td style="text-align: center;">
                                        {{ $cash_book->iv_one }}
                                    </td>

                                    <td style="text-align: center;">
                                        {{ $cash_book->iv_two }}
                                    </td>

                                    <td style="text-align: center;">
                                        {{ $cash_book->chartof_account_table->coa_number ?? '' }}
                                    </td>

                                    <td style="text-align: center;">
                                        {{ $cash_book->account_types_table->description ?? '' }}
                                    </td>

                                    <td style="text-align: center;">
                                        {{ $cash_book->chartof_account_table->description ?? '' }}
                                    </td>

                                    <td style="text-align: center;">
                                        {{ $cash_book->description }}
                                    </td>

                                    <td style="text-align: center;">
                                        {{ $cash_book->get_cash_account->coa_number ?? '' }}
                                    </td>


                                    <td style="text-align: right;">
                                        {{ number_format($cash_book->cash_in, 2) }}
                                    </td>

                                    <td style="text-align: right;">
                                        {{ number_format($cash_book->cash_out, 2) }}
                                    </td>

                                    {{-- cash balance --}}
                                    <td style="text-align: right;">
                                        <?php
                                        $cash_balance = $closing_balance + ($cash_book->cash_in - $cash_book->cash_out);
                                        echo number_format($cash_balance);
                                        ?>
                                    </td>


                                    <td style="text-align: center;">
                                        {{ $cash_book->get_bank_account->coa_number ?? '' }}
                                    </td>

                                    <td style="text-align: right;">
                                        {{ number_format($cash_book->bank_in, 2) }}
                                    </td>

                                    <td style="text-align: right;">
                                        {{ number_format($cash_book->bank_out, 2) }}
                                    </td>

                                    {{-- bank balance --}}
                                    <td style="text-align: right;">
                                        <?php
                                        $bank_balance = $closing_balance + ($cash_book->bank_in - $cash_book->bank_out);
                                        echo number_format($bank_balance);
                                        ?>
                                    </td>

                                    <td style="text-align: right;">
                                        <?php
                                        $deposit = $cash_book->cash_in + $cash_book->bank_in;
                                        echo number_format($deposit);
                                        ?>
                                    </td>

                                    <td style="text-align: right">
                                        <?php
                                        $withdraw = $cash_book->cash_out + $cash_book->bank_out;
                                        echo number_format($withdraw);
                                        ?>
                                    </td>

                                    <td style="text-align: center;">
                                        {{ $cash_book->get_bank_account->description ?? '' }}
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
                                                        <a class="dropdown-item" href="#"
                                                            onclick="alert('Coming')">Detail</a>
                                                    </li>

                                                    <li>
                                                        <a class="dropdown-item"
                                                            href="{{ route('cashbook.edit', $cash_book->id) }}">Edit</a>
                                                    </li>

                                                    <li>
                                                        <form action="{{ route('cashbook.destroy', $cash_book->id) }}"
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
                            <td colspan="11">Total:</td>
                            {{-- Cash Calculator --}}
                            <td style="text-align: right; font-weight: bold">
                                {{ number_format($cash_books->sum('cash_in'), 2) }}
                            </td>
                            <td style="text-align: right; font-weight: bold">
                                {{ number_format($cash_books->sum('cash_out'), 2) }}
                            </td>

                            <td style="text-align: right; font-weight: bold">
                                {{ number_format($cash_balance) }}
                            </td>

                            <td></td>
                            {{-- Bank Calculator --}}
                            <td style="text-align: right; font-weight: bold">
                                {{ number_format($cash_books->sum('bank_in'), 2) }}
                            </td>

                            <td style="text-align: right; font-weight: bold">
                                {{ number_format($cash_books->sum('bank_out'), 2) }}
                            </td>

                            <td style="text-align: right; font-weight: bold">
                                {{-- echo number_format($bank_balance); --}}
                                {{ number_format($cash_books->sum('closing_balance') + $cash_books->sum('cash_in') + $cash_books->sum('bank_in')) }}
                            </td>

                            {{-- Deposit(Cash+Bank) --}}
                            <td style="text-align: right; font-weight: bold">
                                {{ number_format($cash_books->sum('cash_in') + $cash_books->sum('bank_in')) }}
                            </td>

                            {{-- Withdraw(Cash+Bank) --}}
                            <td style="text-align: right; font-weight: bold">
                                {{ number_format($cash_books->sum('cash_out') + $cash_books->sum('bank_out')) }}
                            </td>

                            <th></th>
                            <th></th>
                        </tr>
                    </table>
                </div>

                <div class="pseduo-track"></div>
                {!! $cash_books->links() !!}

            </div>
        </div>
    </div>
@endsection

@section('script')
@endsection
