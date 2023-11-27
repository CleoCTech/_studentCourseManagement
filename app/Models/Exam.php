<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Exam extends Model
{
    use HasFactory;


    protected $guarded = [];
    protected $keyType = 'int';
    public $incrementing = true;

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($model) {
            $model->uuid = (string) Str::uuid();
        });
        static::addGlobalScope('formattedCreatedAt', function (Builder $builder) {
            $builder->selectRaw('*, DATE_FORMAT(created_at, "%Y-%m-%d") as formatted_created_at');
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
        if($column == 'status'){
            $options = [
                ['id' => 1,'caption' => 'Inactive', 'color' => 'bg-yellow-500'],
                ['id' => 2,'caption' => 'Active', 'color' => 'bg-green-500'],
            ];
        }
        if($column == 'user_category'){
            $options = [
                ['id' => 2,'caption' => 'Regular', 'color' => 'bg-yellow-500'],
                ['id' => 100,'caption' => 'Admin', 'color' => 'bg-green-500'],
            ];
        }
        if(isset($options)){
            return $options;
        }else{
            return null;
        }
    }
    public static function getTableName()
    {
        return with(new static)->getTable();
    }

    public function course() {
        return $this->belongsTo(Course::class);
    }

    // /**
    //  * Get all of the comments for the Exam
    //  *
    //  * @return \Illuminate\Database\Eloquent\Relations\HasManyThrough
    //  */
    // public function comments(): HasManyThrough
    // {
    //     return $this->hasManyThrough(Comment::class, Post::class);
    // }

    /**
     * Get the grading associated with the Exam
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function grading(): HasOne
    {
        return $this->hasOne(Grade::class, 'exam_id', 'id');
    }
}
