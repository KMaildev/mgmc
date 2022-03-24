<?php

namespace App\Http\Controllers\Accounting;

use App\Accounting\CashBook;
use App\Accounting\ChartofAccount;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreCashBook;
use Illuminate\Http\Request;

use function Ramsey\Uuid\v1;

class CashBookController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $chartof_accounts = ChartofAccount::orderBy('coa_number', 'asc')->get();
        return view('accounting.cash_book.index', compact('chartof_accounts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $chartof_accounts = ChartofAccount::orderBy('coa_number', 'asc')->get();
        return view('accounting.cash_book.create', compact('chartof_accounts'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCashBook $request)
    {
        $cash_book = new CashBook();
        $cash_book->cash_book_date = $request->date;
        $cash_book->month = $request->month;
        $cash_book->year = $request->year;
        $cash_book->iv_one = $request->iv_one;
        $cash_book->iv_two = $request->iv_two;
        $cash_book->account_code_id = $request->account_code;
        $cash_book->account_type_id = $request->account_type_id;
        $cash_book->description = $request->description;
        $cash_book->cash_account_id = $request->cash_account ?? 0;
        $cash_book->bank_account = $request->bank_account ?? 0;
        $cash_book->cash_in = $request->cash_in ?? 0;
        $cash_book->cash_out = $request->cash_out ?? 0;
        $cash_book->bank_in = $request->bank_in ?? 0;
        $cash_book->bank_out = $request->bank_out ?? 0;
        $cash_book->user_id = auth()->user()->id;
        $cash_book->save();
        return redirect()->back()->with('success', 'Created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
