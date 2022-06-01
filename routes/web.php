<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Spatie\Activitylog\Models\Activity;

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
    return view('auth.login');
});

Auth::routes(['register' => false]);

Route::middleware('auth')->group(function () {
    Route::view('/file_manager', 'file_manager.index')->name('file_manager.index');

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

    Route::resource('customer', 'CustomerController');
    Route::resource('supplier', 'SupplierController');
    Route::resource('brand', 'BrandController');

    Route::resource('products', 'ProductsController');
    Route::post('product_import', 'ProductsController@product_import')->name('product_import');

    Route::resource('import_car', 'Accounting\ImportCarController');

    Route::resource('department', 'DepartmentController');
    Route::resource('employee', 'EmployeeController');
    Route::get('emp_export', 'EmployeeController@emp_export')->name('emp_export');

    Route::resource('cashbook', 'Accounting\CashBookController');
    Route::get('cashbook_export', 'Accounting\CashBookController@cashbook_export')->name('cashbook_export');

    Route::resource('daily_report', 'Accounting\DailyReportController');

    Route::resource('changepassword', 'ChangePasswordController');
    Route::resource('activity', 'Activity\ActivityLogController');


    Route::resource('sales_invoices', 'Accounting\SalesInvoicesController');
});
