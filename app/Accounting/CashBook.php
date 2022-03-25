<?php

namespace App\Accounting;

use Illuminate\Database\Eloquent\Model;

class CashBook extends Model
{
    public function chartof_account_table()
    {
        return $this->belongsTo(ChartofAccount::class, 'account_code_id', 'id');
    }


    public function account_types_table()
    {
        return $this->belongsTo(AccountType::class, 'account_type_id', 'id');
    }
}
