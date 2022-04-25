<?php

namespace App\Http\Controllers;

use App\Accounting\ChartofAccount;
use App\Http\Requests\StoreProducts;
use App\Http\Requests\UpdateProducts;
use App\Models\Brand;
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
        $products = Products::all();
        return view('products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $brands = Brand::all();
        return view('products.create', compact('brands'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreProducts $request)
    {
        $user_id = auth()->user()->id;
        $product = new Products();
        $product->product = $request->product;
        $product->type = $request->type;
        $product->model_no = $request->model_no;
        $product->model_year = $request->model_year;
        $product->configuration = $request->configuration;
        $product->body_color = $request->body_color;
        $product->interior_color = $request->interior_color;
        $product->engine_power = $request->engine_power;
        $product->chessi_no = $request->chessi_no;
        $product->engine_no = $request->engine_no;
        $product->weight = $request->weight;
        $product->door = $request->door;
        $product->seater = $request->seater;
        $product->vehicle_no = $request->vehicle_no;
        $product->quantity = $request->quantity;
        $product->remark = $request->remark;
        $product->brand_id = $request->brand_id ?? 0;
        $product->user_id = $user_id ?? 0;
        $product->save();
        return redirect()->back()->with('success', 'Your processing has been completed.');
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
        $brands = Brand::all();
        $product = Products::findOrFail($id);
        return view('products.edit', compact('brands', 'product'));
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
        $user_id = auth()->user()->id;
        $product = Products::findOrFail($id);
        $product->product = $request->product;
        $product->type = $request->type;
        $product->model_no = $request->model_no;
        $product->model_year = $request->model_year;
        $product->configuration = $request->configuration;
        $product->body_color = $request->body_color;
        $product->interior_color = $request->interior_color;
        $product->engine_power = $request->engine_power;
        $product->chessi_no = $request->chessi_no;
        $product->engine_no = $request->engine_no;
        $product->weight = $request->weight;
        $product->door = $request->door;
        $product->seater = $request->seater;
        $product->vehicle_no = $request->vehicle_no;
        $product->quantity = $request->quantity;
        $product->remark = $request->remark;
        $product->brand_id = $request->brand_id ?? 0;
        $product->user_id = $user_id ?? 0;
        $product->update();
        return redirect()->back()->with('success', 'Your processing has been completed.');
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
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
