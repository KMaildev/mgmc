<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreSalesInvoices extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'invoice_no' => 'required',
            'invoice_date' => 'required',
            'customer_id' => 'required',
            'chessi_no' => 'required',
            'qty' => "numeric",
            'unit_price' => "numeric",
            'down_payment' => "numeric",
            'discount' => "numeric",
            'dealer_percentage' => "numeric",
        ];
    }
}
