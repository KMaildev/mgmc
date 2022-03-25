<?php

namespace App\Models;

use App\Accounting\ChartofAccount;
use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    public function get_sale_account()
    {
        return $this->belongsTo(ChartofAccount::class, 'sale_account_id', 'id');
    }

    public function get_purchase_account()
    {
        return $this->belongsTo(ChartofAccount::class, 'purchase_account_id', 'id');
    }
}
