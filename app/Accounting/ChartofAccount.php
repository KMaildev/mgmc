<?php

namespace App\Accounting;

use Illuminate\Database\Eloquent\Model;

class ChartofAccount extends Model
{
    public function account_type_table()
    {
        return $this->belongsTo(AccountType::class, 'account_type_id', 'id');
    }


    public function account_classifications_table()
    {
        return $this->belongsTo(AccountClassification::class, 'account_classification_id', 'id');
    }

    public function chartof_account_table()
    {
        return $this->belongsTo(ChartofAccount::class, 'chartof_account_id', 'id');
    }

    public function accounttypes()
    {
        return $this->hasMany(ChartofAccount::class);
    }
}
