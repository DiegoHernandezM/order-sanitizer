<?php

namespace App\Support;

use InvalidArgumentException;

class MarketplaceDatabase
{
    public static function local(string $marketplace): string
    {
        return match ($marketplace) {
            'sanborns' => 'sanborns',
            'sears' => 'sears',
            default => throw new InvalidArgumentException("Marketplace inválido: {$marketplace}"),
        };
    }

    public static function prod(string $marketplace): string
    {
        return match ($marketplace) {
            'sanborns' => 'prod',
            'sears' => 'prod-se',
            default => throw new InvalidArgumentException("Marketplace inválido: {$marketplace}"),
        };
    }
}