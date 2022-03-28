<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Supplier extends Model
{
    use LogsActivity;
    protected static $logName = 'suppliers_log';
    protected static $logAttributes = ['name', 'company', 'phone', 'description', 'created_at', 'updated_at'];
}
