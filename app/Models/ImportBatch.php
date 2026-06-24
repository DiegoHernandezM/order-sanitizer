<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ImportBatch extends Model
{

    protected $fillable = [
        'started_at',
        'requested_orders',
        'imported_orders',
        'imported_order_items',
        'imported_status_records',
        'status',
        'error_message',
        'created_by',
    ];

    protected $casts = [
        'started_at' => 'datetime',
    ];
}
