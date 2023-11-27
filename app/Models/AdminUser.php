<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class AdminUser extends Model
{
    use HasFactory;

    protected $keyType = 'int';
    public $incrementing = true;

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            $model->uuid = (string) Str::uuid();
        });
    }
    public function getRouteKeyName()
    {
        return 'uuid';
    }

    public function getRouteKey()
    {
        return $this->uuid;
    }

    public function resolveRouteBinding($value, $field = null)
    {
        return $this->where('uuid', $value)->firstOrFail();
    }

    public static function options($column)
    {
        if($column == 'role'){
            $options = [
                ['id' => 1,'caption' => 'Super Admin', 'color' => 'bg-green-500'],
                ['id' => 2,'caption' => 'Read Only Admin', 'color' => 'bg-red-500'],
            ];
        }
        elseif($column == 'status'){
            $options = [
                ['id' => 1,'caption' => 'Active', 'color' => 'bg-green-500'],
                ['id' => 2,'caption' => 'Suspended', 'color' => 'bg-red-500'],
            ];
        }
        if(isset($options)){
            return $options;
        }else{
            return null;
        }
    }
}
