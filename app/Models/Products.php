<?php

namespace App\Models;

use App\Accounting\ChartofAccount;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Products extends Model
{

    use LogsActivity;
    protected static $logName = 'products_log';
    protected static $logAttributes = ['name', 'item_code', 'description', 'opening_cost', 'opening_quantity', 'qty_at_date', 'selling_price', 'sale_account_id', 'cost_of_unit', 'purchase_account_id', 'created_at', 'updated_at'];

    public function get_sale_account()
    {
        return $this->belongsTo(ChartofAccount::class, 'sale_account_id', 'id');
    }

    public function get_purchase_account()
    {
        return $this->belongsTo(ChartofAccount::class, 'purchase_account_id', 'id');
    }
}
