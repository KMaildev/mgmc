<?php

namespace App\Models;

use App\Accounting\ChartofAccount;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Products extends Model
{

    use LogsActivity;
    protected static $logName = 'products_log';
    protected static $logAttributes = ['product', 'brand_id', 'quantity', 'created_at', 'updated_at'];

    public function brands_table()
    {
        return $this->belongsTo(Brand::class, 'brand_id', 'id');
    }
}
