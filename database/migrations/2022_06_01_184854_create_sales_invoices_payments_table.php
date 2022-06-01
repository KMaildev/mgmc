<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSalesInvoicesPaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sales_invoices_payments', function (Blueprint $table) {
            $table->increments('id');
            $table->text('down_payment')->nullable();
            $table->text('discount')->nullable();
            $table->text('dealer_ercentage')->nullable();
            $table->integer('sales_invoice_id')->nullable();
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
        Schema::dropIfExists('sales_invoices_payments');
    }
}
