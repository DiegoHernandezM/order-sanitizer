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
        Schema::create('marketplace_statuses', function (Blueprint $table) {
            $table->id();
            $table->string('marketplace', 50); // sanborns | sears
            $table->integer('external_id');
            $table->string('name');
            $table->integer('sort_order')->nullable();
            $table->boolean('visible')->default(true);
            $table->timestamps();

            $table->unique(['marketplace', 'external_id']);
            $table->index('marketplace');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('marketplace_statuses');
    }
};
