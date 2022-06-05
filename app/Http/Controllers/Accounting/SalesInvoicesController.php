<?php

namespace App\Http\Controllers\Accounting;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreSalesInvoices;
use App\Models\Customers;
use App\Models\Products;
use App\Models\SalesInvoices;
use App\Models\SalesInvoicesPayments;
use App\Models\SalesItems;
use App\User;
use Illuminate\Http\Request;

class SalesInvoicesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // For Create
        $form_status = 'is_create';
        $customers = Customers::all();
        $products = Products::all();

        // For List 
        $sales_invoices = SalesInvoices::all();
        return view('accounting.sales_invoices.index', compact('form_status', 'customers', 'products', 'sales_invoices'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreSalesInvoices $request)
    {
        $sale_invoice = new SalesInvoices();
        $sale_invoice->invoice_no = $request->invoice_no;
        $sale_invoice->invoice_date = $request->invoice_date;
        $sale_invoice->customer_id = $request->customer_id;
        $sale_invoice->user_id = auth()->user()->id ?? 0;
        $sale_invoice->save();

        $sale_invoice_id = $sale_invoice->id;

        $sale_item = new SalesItems();
        $sale_item->product_id = $request->chessi_no;
        $sale_item->qty = $request->qty;
        $sale_item->unit_price = $request->unit_price;
        $sale_item->sales_invoice_id = $sale_invoice_id;
        $sale_item->save();


        $sale_inv_payment = new SalesInvoicesPayments();
        $sale_inv_payment->down_payment = $request->down_payment;
        $sale_inv_payment->discount = $request->discount;
        $sale_inv_payment->dealer_ercentage = $request->dealer_ercentage;
        $sale_inv_payment->sales_invoice_id = $sale_invoice_id;
        $sale_inv_payment->save();
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


    /**
     * Get Ajax Request and restun Data
     *
     * @return \Illuminate\Http\Response
     */
    public function get_sales_invoices($id)
    {
        $sales_invoice_data = SalesInvoices::findOrFail($id);
        return json_encode($sales_invoice_data);
    }


    /**
     * @return \Illuminate\Support\Collection
     */
    public function get_sales_items($id)
    {
        $sales_items_data = SalesItems::where('sales_invoice_id', $id)->get();
        $total_amount = [];
        foreach ($sales_items_data as $key => $value) {
            $total_amount[] = $value->qty * $value->unit_price;
        }
        $total_amount_value = array_sum($total_amount);
        return json_encode($total_amount_value);
    }
}
