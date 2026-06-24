@extends('layouts.app')

@section('title', 'Sanborns | Status Sanitizer')

@section('content')
<div class="mb-4">
    <h1 class="display-6 fw-bold">
        Sanborns Status Sanitizer
    </h1>

    <p class="text-muted mb-0">
        Importación, análisis y preparación de scripts de saneamiento.
    </p>
</div>

<input type="hidden" id="marketplace" value="sanborns">

<div class="container-fluid py-4 px-4">

    <div class="mb-4">
        <h1 class="display-6 fw-bold page-title">
            Order Sanitizer
        </h1>

        <p class="text-muted mb-0">
            Importación, análisis y preparación de scripts de saneamiento.
        </p>
    </div>

    <div class="row g-4">

        <div class="col-lg-5">

            <div class="card shadow-sm border-0 mb-4">
                <div class="card-header bg-white border-0 pt-4 px-4">
                    <h5 class="fw-bold mb-1">1. Importar pedidos desde PROD</h5>
                    <p class="text-muted small mb-0">
                        Pega los números de pedido separados por coma.
                    </p>
                </div>

                <div class="card-body px-4">
                    <label class="form-label fw-semibold" for="ordersInput">
                        Pedidos
                    </label>

                    <textarea
                        class="form-control"
                        id="ordersInput"
                        rows="5"
                        placeholder="Ejemplo: 6914714,6975637,6836072"></textarea>

                    <div class="d-flex gap-2 mt-3">
                        <button class="btn btn-primary" onclick="importOrders()">
                            Importar desde PROD
                        </button>

                        <button class="btn btn-success" onclick="analyzeOrders()">
                            Analizar pedidos
                        </button>
                    </div>

                    <div id="importResult" class="alert alert-light border mt-3 d-none"></div>
                </div>
            </div>

            <div class="card shadow-sm border-0 mb-4">
                <div class="card-header bg-white border-0 pt-4 px-4">
                    <h5 class="fw-bold mb-1">2. Configurar saneamiento</h5>
                    <p class="text-muted small mb-0">
                        Selecciona el nuevo estatus y define si también debe cambiar el pedido.
                    </p>
                </div>

                <div class="card-body px-4">
                    <label class="form-label fw-semibold" for="targetStatus">
                        Nuevo estatus para partidas
                    </label>

                    <select class="form-select" id="targetStatus">
                    </select>

                    <div class="form-check form-switch mt-4">
                        <input
                            class="form-check-input"
                            type="checkbox"
                            role="switch"
                            id="updateOrderStatus">

                        <label class="form-check-label fw-semibold" for="updateOrderStatus">
                            Actualizar también el estatus del pedido

                            <small class="d-block text-muted fw-normal">
                                Actívalo solo cuando la solicitud indique cambiar también
                                <code>pedidos.Estatus</code>. Si está apagado, solo se cambiarán las partidas seleccionadas.
                            </small>
                        </label>
                    </div>

                    <label class="form-label fw-semibold mt-4" for="comment">
                        Comentario
                    </label>

                    <textarea
                        class="form-control"
                        id="comment"
                        rows="4">Partidas se cambian de estatus, solicitado por correo electrónico.</textarea>

                    <button class="btn btn-dark w-100 mt-3" onclick="generateScript()">
                        Generar Script SQL
                    </button>
                </div>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-0 pt-4 px-4">
                    <h5 class="fw-bold mb-1">JSON generado</h5>

                    <p class="text-muted small mb-0">
                        Este JSON será la base para el endpoint que generará el script SQL.
                    </p>
                </div>

                <div class="card-body px-4">
                    <pre id="payloadOutput" class="json-box mb-0"></pre>
                </div>
            </div>

            <div class="card shadow-sm border-0 mt-4">
                <div class="card-header bg-white">
                    <h5 class="mb-0">Script SQL generado</h5>
                </div>

                <div class="card-body">
                    <pre id="sqlOutput" class="json-box"></pre>
                </div>
            </div>

        </div>

        <div class="col-lg-7">

            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-0 pt-4 px-4">
                    <h5 class="fw-bold mb-1">3. Resultado del análisis</h5>

                    <p class="text-muted small mb-0">
                        Selecciona las partidas que se incluirán en el saneamiento.
                    </p>
                </div>

                <div class="card-body px-4">
                    <div id="analysisResult" class="text-muted">
                        Aún no hay pedidos analizados.
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
@endsection

@push('scripts')
<script src="{{ asset('js/status-sanborns-sanitizer.js') }}"></script>
@endpush