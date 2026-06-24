<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('import_batches', function (Blueprint $table) {
            $table->id();

            $table->timestamp('started_at');

            $table->integer('requested_orders');
            $table->integer('imported_orders');

            $table->integer('imported_order_items');
            $table->integer('imported_status_records');

            $table->enum('status', [
                'pending',
                'completed',
                'failed'
            ])->default('pending');

            $table->text('error_message')->nullable();

            $table->string('created_by')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('import_batches');
    }
};
