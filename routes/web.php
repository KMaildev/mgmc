<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes(['register' => false]);

Route::middleware('auth')->group(function () {
    Route::get('/home', 'HomeController@index')->name('home');
    Route::resource('accountingdashboard', 'AccountingDashboardController');

    Route::resource('accountclassification', 'Accounting\AccountClassificationController');
    Route::get('classificationdependent/ajax/{id}', array('as' => 'classificationdependent.ajax', 'uses' => 'Accounting\AccountClassificationController@dependentAjax'));

    Route::resource('accounttype', 'Accounting\AccountTypeController');
    Route::get('accounttypedependent/ajax/{id}', array('as' => 'accounttypedependent.ajax', 'uses' => 'Accounting\AccountTypeController@dependentAjax'));

    Route::resource('chartofaccount', 'Accounting\ChartofAccountController');
    Route::get('chartofaccountdependent/ajax/{id}', array('as' => 'chartofaccountdependent.ajax', 'uses' => 'Accounting\ChartofAccountController@dependentAjax'));

    Route::resource('subaccount', 'Accounting\SubAccountController');
    Route::resource('bankform', 'Accounting\BankFormController');
    Route::resource('cashbook', 'Accounting\CashBookController');
    Route::resource('customer', 'CustomerController');
    Route::resource('supplier', 'SupplierController');
    Route::resource('products', 'ProductsController');
});
