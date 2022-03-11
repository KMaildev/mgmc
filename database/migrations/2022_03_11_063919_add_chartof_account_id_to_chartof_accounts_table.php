<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddChartofAccountIdToChartofAccountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('chartof_accounts', function (Blueprint $table) {
            $table->integer('chartof_account_id')->nullable();
            $table->text('sub_or_main_account')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('chartof_accounts', function (Blueprint $table) {
            //
        });
    }
}
