<?php

namespace App\Models;

use App\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class Shop extends Model
{
    use SoftDeletes;

    protected $fillable = ['name', 'user_id', 'email', 'contact', 'address', 'is_active'];

    protected $hidden = ['password'];

    protected $appends = [
        'avatar'
    ];

    public function getColumnsForDataTable()
    {
        $data = [
            ['data' => 'avatar', 'name' => 'avatar', 'searchable' => 'false'],
            ['data' => 'name', 'name' => 'name'],
            ['data' => 'email', 'name' => 'email'],
            ['data' => 'contact', 'name' => 'contact'],
            ['data' => 'address', 'name' => 'address'],
            ['data' => 'is_active', 'name' => 'is_active', 'title' => 'Status'],
            ['data' => 'actions', 'name' => 'actions', 'searchable' => 'false']
        ];

        return json_encode($data);
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function ($store) {

            /*foreach ($store->customers as $storeCustomers) {
                $storeCustomers->delete();
            }*/

        });
    }

    public function getAvatarAttribute()
    {
        if (!empty($this->photo) && Storage::disk('local')->exists($this->photo->source)) {
            $avatar = $this->photo;
        } else {
            $avatar = (object)['source' => 'assets/img/placeholder.png', 'thumbnail' => 'assets/img/placeholder.png'];
        }
        unset($this->photo);
        return $avatar;
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function customers()
    {
        return $this->hasMany(Customer::class, 'shop_id');
    }

    public function products()
    {
        return $this->hasMany(Product::class, 'shop_id');
    }

    public function receipts()
    {
        return $this->hasMany(Receipt::class, 'shop_id');
    }

    public function logo()
    {
        return $this::hasOne(Upload::class, 'model_ref_id', 'shop_id');
    }

    public function createRecord($request)
    {
        $upload_model = new Upload();
        $record = $this->create($request->only($this->getFillable()));
        if ($request->hasFile('logo')) {
            $upload_model->fileUpload('users', 'user', 'logo',
                $record->id, $record->id, $record->name);
        }
        return $record;
    }

    public function updateRecord($request)
    {
        $upload_model = new Upload();
        $store = $this->find($request->id);
        $store->update($request->only($this->getFillable()));
        if ($request->hasFile('logo')) {
            $upload_model->fileUpload('users', 'user', 'logo',
                $store->user_id, $store->user_id, $store->name);
        }
        return $store->id;
    }

    public function deleteRecord($id)
    {
        $data = $this->findOrFail($id);
        $data->delete();
        return $id;
    }

    public function editRecord($id)
    {
        return $this->findOrFail($id);
    }

    public function viewRecord($id)
    {
        return $this->findOrFail($id);
    }

    public function getRecords()
    {
        return $this->where('is_active', 1)->get();
    }

    public function ajaxListing()
    {
        return $this::query()->with('logo');
    }

    public function getDashboardTableData()
    {
        return $this->withCount(['products', 'receipts', 'customers'])
            ->where('is_active', '1')->orderBy('name')->get();
    }
}
