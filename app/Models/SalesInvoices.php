<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SalesInvoices extends Model
{
    public function customers_table()
    {
        return $this->belongsTo(Customers::class, 'customer_id', 'id');
    }

    public function sales_items_table()
    {
        return $this->hasMany(SalesItems::class, 'sales_invoice_id', 'id');
    }

    public function sales_invoices_payments_table()
    {
        return $this->belongsTo(SalesInvoicesPayments::class, 'id', 'sales_invoice_id');
    }
}
