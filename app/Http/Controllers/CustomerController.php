<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCustomer;
use App\Models\Customers;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $customers = Customers::query();
        if (request('search')) {
            $customers->where('name', 'Like', '%' . request('search') . '%');
        }
        $customers = $customers->orderBy('id', 'ASC')->paginate(50);
        return view('customer.index', compact('customers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $customers = Customers::all();
        return view('customer.create', compact('customers'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCustomer $request)
    {
        $customer = new Customers();
        $customer->name = $request->name;
        $customer->phone = $request->phone;
        $customer->email = $request->email;
        $customer->address = $request->address;
        $customer->background = $request->background;
        $customer->nrc_no = $request->nrc_no;
        $customer->country = $request->country;
        $customer->city = $request->city;
        $customer->state = $request->state;
        $customer->description = $request->description;
        $customer->dealer_customer_id = $request->dealer_customer_id;
        $customer->dealer_or_hp = $request->dealer_or_hp;

        $customer->opening_balance = $request->opening_balance;
        $customer->opening_balance_date = $request->opening_balance_date;

        $customer->save();
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
        $customer = Customers::findOrFail($id);
        $customers = Customers::all();
        return view('customer.edit', compact('customer', 'customers'));
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
        $customer = Customers::findOrFail($id);
        $customer->name = $request->name;
        $customer->phone = $request->phone;
        $customer->email = $request->email;
        $customer->address = $request->address;
        $customer->background = $request->background;
        $customer->nrc_no = $request->nrc_no;
        $customer->country = $request->country;
        $customer->city = $request->city;
        $customer->state = $request->state;
        $customer->description = $request->description;
        $customer->dealer_customer_id = $request->dealer_customer_id;
        $customer->dealer_or_hp = $request->dealer_or_hp;

        $customer->opening_balance = $request->opening_balance;
        $customer->opening_balance_date = $request->opening_balance_date;
        $customer->update();
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
        $customer = Customers::findOrFail($id);
        $customer->delete();
        return redirect()->back()->with('success', 'Deleted successfully.');
    }
}
