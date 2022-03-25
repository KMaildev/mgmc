<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProducts extends FormRequest
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
            'name' => 'required',
            'opening_cost' => 'numeric',
            'opening_quantity' => 'numeric',
            'selling_price' => 'numeric',
            'sale_account_id' => 'required',
            'cost_of_unit' => 'numeric',
            'purchase_account_id' => 'required',
        ];
    }
}
