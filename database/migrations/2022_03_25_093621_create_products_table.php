<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->text('name')->nullable();
            $table->text('item_code')->nullable();
            $table->text('description')->nullable();
            $table->text('opening_cost')->nullable();
            $table->text('opening_quantity')->nullable();
            $table->text('qty_at_date')->nullable();
            $table->text('selling_price')->nullable();
            $table->integer('sale_account_id')->nullable(); //COA ID
            $table->text('cost_of_unit')->nullable();
            $table->integer('purchase_account_id')->nullable(); //COA ID
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
