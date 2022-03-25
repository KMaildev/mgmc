<?php

namespace App\Http\Controllers;

use App\Accounting\ChartofAccount;
use App\Http\Requests\StoreProducts;
use App\Http\Requests\UpdateProducts;
use App\Models\Products;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Products::query();
        if (request('search')) {
            $products->where('name', 'Like', '%' . request('search') . '%');
        }
        $products = $products->orderBy('id', 'ASC')->paginate(50);
        return view('products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $chartof_accounts = ChartofAccount::all();
        return view('products.create', compact('chartof_accounts'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreProducts $request)
    {
        $product = new Products();
        $product->name = $request->name;
        $product->item_code = $request->item_code;
        $product->description = $request->description;
        $product->opening_cost = $request->opening_cost ?? 0;
        $product->opening_quantity = $request->opening_quantity ?? 0;
        $product->qty_at_date = $request->qty_at_date;
        $product->selling_price = $request->selling_price ?? 0;
        $product->sale_account_id = $request->sale_account_id;
        $product->cost_of_unit = $request->cost_of_unit ?? 0;
        $product->purchase_account_id = $request->purchase_account_id;
        $product->save();
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
        $chartof_accounts = ChartofAccount::all();
        $product = Products::findOrFail($id);
        return view('products.edit', compact('chartof_accounts', 'product'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateProducts $request, $id)
    {
        $product = Products::findOrFail($id);
        $product->name = $request->name;
        $product->item_code = $request->item_code;
        $product->description = $request->description;
        $product->opening_cost = $request->opening_cost ?? 0;
        $product->opening_quantity = $request->opening_quantity ?? 0;
        $product->qty_at_date = $request->qty_at_date;
        $product->selling_price = $request->selling_price ?? 0;
        $product->sale_account_id = $request->sale_account_id;
        $product->cost_of_unit = $request->cost_of_unit ?? 0;
        $product->purchase_account_id = $request->purchase_account_id;
        $product->update();
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
        $product = Products::findOrFail($id);
        $product->delete();
        return redirect()->back()->with('success', 'Deleted successfully.');
    }
}
