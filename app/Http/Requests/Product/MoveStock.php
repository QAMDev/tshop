<?php

namespace App\Http\Requests\Product;

use Illuminate\Foundation\Http\FormRequest;

class MoveStock extends FormRequest
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
            'shop_id' => 'required|exists:shops,id',
            'check_ids' => 'required|array'
        ];
    }
}
