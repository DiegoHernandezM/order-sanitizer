<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>@yield('title', 'Order Sanitizer')</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tom-select@2.4.3/dist/css/tom-select.bootstrap5.min.css" rel="stylesheet">

    <style>
        body { background: #f4f6f9; }
        .sidebar {
            width: 260px;
            min-height: 100vh;
            background: #111827;
        }
        .sidebar a {
            color: #d1d5db;
            text-decoration: none;
            display: block;
            padding: 10px 16px;
            border-radius: 8px;
        }
        .sidebar a:hover,
        .sidebar a.active {
            background: #1f2937;
            color: #fff;
        }
        .content {
            margin-left: 260px;
        }
        .json-box {
            background: #111827;
            color: #22c55e;
            padding: 16px;
            border-radius: 10px;
            overflow: auto;
            min-height: 120px;
        }
        .order-card { border-left: 5px solid #0d6efd; }
        .item-card {
            border-left: 4px solid #dee2e6;
            transition: all 0.2s ease;
        }
        .item-card:hover {
            border-left-color: #0d6efd;
            background: #f8fbff;
        }
        .item-checkbox {
            width: 1.2rem;
            height: 1.2rem;
            cursor: pointer;
        }
        .small-muted {
            font-size: 0.85rem;
            color: #6c757d;
        }
    </style>

    @stack('styles')
</head>

<body>
<div class="sidebar position-fixed p-3">
    <h5 class="text-white fw-bold mb-4">Order Sanitizer</h5>

    <div class="text-uppercase text-secondary small mb-2">Sanborns</div>
    <a href="{{ route('sanborns.status-sanitizer') }}"
       class="{{ request()->routeIs('sanborns.*') ? 'active' : '' }}">
        Status Sanitizer
    </a>


    <a href="{{ url('/sanborns/assign-partida') }}"
    class="{{ request()->is('sanborns/assign-partida') ? 'active' : '' }}">
        Assign Partida
    </a>

    <hr class="border-secondary">

    <div class="text-uppercase text-secondary small mb-2">Sears</div>
    <a href="{{ route('sears.status-sanitizer') }}"
       class="{{ request()->routeIs('sears.*') ? 'active' : '' }}">
        Status Sanitizer
    </a>
    <a href="{{ url('/sears/assign-partida') }}"
    class="{{ request()->is('sears/assign-partida') ? 'active' : '' }}">
        Assign Partida
    </a>
</div>

<main class="content">
    <div class="container-fluid py-4 px-4">
        @yield('content')
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/tom-select@2.4.3/dist/js/tom-select.complete.min.js"></script>

@stack('scripts')
</body>
</html>