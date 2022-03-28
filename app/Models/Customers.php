<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Customers extends Model
{
    use LogsActivity;
    protected static $logName = 'customers_log';
    protected static $logAttributes = ['name', 'phone', 'description', 'opening_balance', 'opening_balance_date', 'created_at', 'updated_at'];
}
