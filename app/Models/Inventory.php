<?php

namespace App\Models;

use Fico7489\Laravel\EloquentJoin\Traits\EloquentJoin;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\{Model, SoftDeletes};

class Inventory extends Model
{

    protected $fillable = ['product_id', 'quantity', 'measure', 'unit'];

    public $timestamps = FALSE;

    public function updateRecord($request)
    {
        return $this->updateOrCreate([
            'product_id' => $request->id,
        ], [
            'quantity' => $request->quantity,
            'measure' => $request->measure,
            'unit' => $request->unit,
        ]);
    }

    public function getByProduct($product_id)
    {
        return $this->where(['product_id' => $product_id])->first();
    }

}
