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
    Route::get('get_customer_ajax/{id}', array('as' => 'get_customer_ajax', 'uses' => 'CustomerController@get_customer_ajax'));
    Route::post('dealer_customer_import', 'CustomerController@dealer_customer_import')->name('dealer_customer_import');
    Route::get('dealer_customer_export', 'CustomerController@dealer_customer_export')->name('dealer_customer_export');

    Route::resource('hp_customer', 'HpCustomerController');
    Route::get('hp_customer_export', 'HpCustomerController@hp_customer_export')->name('hp_customer_export');

    Route::resource('supplier', 'SupplierController');
    Route::post('supplier_import', 'SupplierController@supplier_import')->name('supplier_import');

    Route::resource('brand', 'BrandController');

    Route::resource('products', 'ProductsController');
    Route::get('get_products_ajax/{id}', array('as' => 'get_products_ajax', 'uses' => 'ProductsController@get_products_ajax'));
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

    // Sales 
    Route::resource('sales_invoices', 'Accounting\SalesInvoicesController');
    Route::get('get_sales_invoices/{id}', array('as' => 'get_sales_invoices', 'uses' => 'Accounting\SalesInvoicesController@get_sales_invoices'));
    Route::get('get_sales_items/{id}', array('as' => 'get_sales_items', 'uses' => 'Accounting\SalesInvoicesController@get_sales_items'));
    Route::get('sale_invoice_pdf_download/{id}', array('as' => 'sale_invoice_pdf_download', 'uses' => 'Accounting\SalesInvoicesController@sale_invoice_pdf_download'));


    // Sale Pay Now
    Route::resource('sale_pay_now', 'Accounting\SalePaynowController');
    Route::get('sales_inv_paynow_create/{id}', array('as' => 'sales_inv_paynow_create', 'uses' => 'Accounting\SalePaynowController@salePayNow'));


    Route::resource('sales_journal', 'Accounting\SalesJournalController');
    Route::get('get_sales_journals/{id}', array('as' => 'get_sales_journals', 'uses' => 'Accounting\SalesJournalController@get_sales_journals'));

    Route::resource('cash_collection', 'Accounting\CashCollectionController');
    Route::resource('sales_ledger', 'Accounting\SalesLedgerController');
    Route::resource('account_receivables', 'Accounting\AccountReceivablesController');
    Route::resource('sale_cash_book', 'Accounting\SaleCashBookController');
    Route::resource('sale_refund', 'Accounting\SaleRefundController');

    // Cart System
    Route::resource('sale_invoice_cart', 'Cart\SaleInvoiceCartController');
    Route::post('add_cart_temporary', 'Cart\SaleInvoiceCartController@store');
    Route::get('temporary_sales_items_remove/{id}', array('as' => 'temporary_sales_items_remove', 'uses' => 'Cart\SaleInvoiceCartController@temporary_sales_items_remove'));

    Route::resource('sales_items', 'Accounting\SalesItemsController');
    Route::get('sales_items_remove/{id}', array('as' => 'sales_items_remove', 'uses' => 'Accounting\SalesItemsController@sales_items_remove'));
});
