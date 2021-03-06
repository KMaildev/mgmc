<?php

namespace App\Http\Controllers\Accounting;

use App\Accounting\AccountType;
use App\Accounting\ChartofAccount;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreChartofAccount;
use App\Http\Requests\UpdateChartofAccount;
use Illuminate\Http\Request;

class ChartofAccountController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $chartof_accounts = ChartofAccount::orderBy('id')->where('sub_or_main_account', 'main_account')->get();
        return view('accounting.chartof_account.index', compact('chartof_accounts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $account_types = AccountType::all();
        return view('accounting.chartof_account.create', compact('account_types'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreChartofAccount $request)
    {
        $Coa = new ChartofAccount();
        $Coa->account_type_id = $request->account_type;
        $Coa->account_classification_id = $request->account_group;
        $Coa->description = $request->description;
        $Coa->account_opening_balance = $request->opening_balance ?? 0;
        $Coa->coa_number = $request->account_number;
        $Coa->opening_balance_date = $request->opening_balance_date ?? '';
        $Coa->sub_or_main_account = 'main_account';
        $Coa->save();
        return redirect()->route('chartofaccount.create')
            ->with('success', 'Created successfully.');
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
        $coa = ChartofAccount::findOrFail($id);
        $account_types = AccountType::all();
        return view('accounting.chartof_account.edit', compact('coa', 'account_types'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateChartofAccount $request, $id)
    {
        $Coa = ChartofAccount::findOrFail($id);
        $Coa->account_type_id = $request->account_type;
        $Coa->account_classification_id = $request->account_group;
        $Coa->description = $request->description;
        $Coa->account_opening_balance = $request->opening_balance ?? 0;
        $Coa->opening_balance_date = $request->opening_balance_date ?? '';
        $Coa->coa_number = $request->account_number;
        $Coa->update();
        return redirect()->back()->with('success', 'Updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $Coa = ChartofAccount::findOrFail($id);
        $Coa->delete();
        return redirect()->back()->with('success', 'Deleted successfully.');
    }


    public function dependentAjax($id)
    {
        $chartof_account = ChartofAccount::findOrFail($id);
        return json_encode($chartof_account);
    }
}
