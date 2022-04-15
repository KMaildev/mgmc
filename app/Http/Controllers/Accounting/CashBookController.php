<?php

namespace App\Http\Controllers\Accounting;

use App\Accounting\CashBook;
use App\Accounting\ChartofAccount;
use App\Exports\CashBookExport;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreCashBook;
use App\Http\Requests\UpdateCashBook;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;

class CashBookController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $chartof_accounts = ChartofAccount::orderBy('coa_number', 'ASC')->get();
        $cash_book_form_status = 'is_create';

        $cash_books = CashBook::orderBy('id', 'ASC')->paginate(500);
        if (request('search')) {
            $cash_books = CashBook::where(function ($query) {
                $query->where('iv_one', 'Like', '%' . request('search') . '%');
                $query->orWhere('iv_two', 'Like', '%' . request('search') . '%');
                $query->orWhere('description', 'Like', '%' . request('search') . '%');
            })->paginate(500);
        }

        if (request('from_date') && request('to_date')) {
            $cash_books = CashBook::whereBetween('cash_book_date', [request('from_date'), request('to_date')])->paginate(500);

            // Closing Clash and Bank Balance
            $from_date = request('from_date');
            $beforeFirstDays = DB::table('cash_books')
                ->whereDate('cash_book_date', '<', $from_date)
                ->get();
        } else {
            $first_day = date('Y-m-d', strtotime('first day of this month'));
            $end_day = date('Y-m-d', strtotime('last day of this month'));
            $cash_books = CashBook::whereBetween('cash_book_date', [$first_day, $end_day])->paginate(500);

            // Closing Clash and Bank Balance
            $from_date = request('from_date');
            $beforeFirstDays = DB::table('cash_books')
                ->whereDate('cash_book_date', '<', $first_day)
                ->get();
        }

        return view('accounting.cash_book.index', compact('cash_books', 'chartof_accounts', 'beforeFirstDays', 'cash_book_form_status'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $chartof_accounts = ChartofAccount::orderBy('coa_number', 'ASC')->get();
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
        // $cash_book = CashBook::findOrFail($id);
        // return view('accounting.cash_book.edit', compact('chartof_accounts', 'cash_book'));

        $chartof_accounts = ChartofAccount::orderBy('coa_number', 'asc')->get();
        $cash_books = CashBook::orderBy('id', 'DESC')->paginate(100);
        $edit_cash_book_data = CashBook::findOrFail($id);
        $cash_book_form_status = 'is_edit';
        return view('accounting.cash_book.index', compact('cash_books', 'chartof_accounts', 'edit_cash_book_data', 'cash_book_form_status'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCashBook $request, $id)
    {
        $cash_book = CashBook::findOrFail($id);
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
        return redirect()->route('cashbook.index')->with('success', 'Updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $cash_book = CashBook::findOrFail($id);
        $cash_book->delete();
        return redirect()->back()->with('success', 'Deleted successfully.');
    }


    /**
     * @return \Illuminate\Support\Collection
     */
    public function cashbook_export()
    {
        $chartof_accounts = ChartofAccount::orderBy('coa_number', 'ASC')->get();
        $cash_books = CashBook::orderBy('id', 'ASC')->paginate(1000);

        if (request('from_date') && request('to_date')) {
            $cash_books = CashBook::whereBetween('cash_book_date', [request('from_date'), request('to_date')])->paginate(1000);

            // Closing Clash and Bank Balance
            $from_date = request('from_date');
            $beforeFirstDays = DB::table('cash_books')
                ->whereDate('cash_book_date', '<', $from_date)
                ->get();
        } else {
            $first_day = date('Y-m-d', strtotime('first day of this month'));
            $end_day = date('Y-m-d', strtotime('last day of this month'));
            $cash_books = CashBook::whereBetween('cash_book_date', [$first_day, $end_day])->paginate(1000);

            // Closing Clash and Bank Balance
            $from_date = request('from_date');
            $beforeFirstDays = DB::table('cash_books')
                ->whereDate('cash_book_date', '<', $first_day)
                ->get();
        }

        return Excel::download(new CashBookExport($chartof_accounts, $cash_books, $beforeFirstDays), 'cash_book_' . date("Y-m-d H:i:s") . '.xlsx');
    }
}
