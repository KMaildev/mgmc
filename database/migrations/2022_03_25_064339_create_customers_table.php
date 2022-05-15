<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->increments('id');
            $table->text('name')->nullable();
            $table->text('company_name')->nullable();
            $table->text('nrc_no')->nullable();
            $table->text('phone')->nullable();
            $table->text('email')->nullable();
            $table->text('address')->nullable();
            $table->text('country')->nullable();
            $table->text('city')->nullable();
            $table->text('state')->nullable();
            $table->text('description')->nullable();
            $table->integer('dealer_customer_id')->nullable();
            $table->text('dealer_or_hp')->nullable();
            $table->text('opening_balance')->nullable();
            $table->text('opening_balance_date')->nullable();
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
        Schema::dropIfExists('customers');
    }
}
