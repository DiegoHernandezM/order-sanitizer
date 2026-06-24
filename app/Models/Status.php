<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Status extends Model
{
    public $incrementing = false;

    protected $fillable = [
        'id',
        'name',
        'sort_order',
        'is_visible',
    ];
}
