<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MarketplaceStatus extends Model
{
    protected $fillable = [
        'marketplace',
        'external_id',
        'name',
        'sort_order',
        'visible',
    ];

    protected $casts = [
        'visible' => 'boolean',
    ];
}
