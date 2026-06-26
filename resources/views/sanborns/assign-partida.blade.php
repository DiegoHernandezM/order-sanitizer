@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <h1>Sanborns Assign Partida</h1>
    <p>Importación, análisis y asignación de partidas en PC.</p>

    <div class="row">
        <div class="col-md-5">
            <div class="card mb-4">
                <div class="card-body">
                    <h4>1. Importar pedidos desde PROD</h4>
                    <p>Pega los números de pedido separados por coma o salto de línea.</p>

                    <form id="assignImportForm">
                        @csrf

                        <div class="mb-3">
                            <label class="form-label">Pedidos</label>
                            <textarea 
                                name="orders"
                                id="orders"
                                class="form-control"
                                rows="7"
                                placeholder="Ejemplo: 7122485,7122547,7123845"></textarea>
                        </div>

                        <button type="button" class="btn btn-primary" id="btnImport">
                            Importar desde PROD
                        </button>

                        <button type="button" class="btn btn-success" id="btnAnalyze">
                            Analizar partidas
                        </button>
                    </form>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <h4>2. Configurar asignación</h4>

                    <div class="mb-3">
                        <label class="form-label">Shipment Type</label>
                        <input disabled type="text" class="form-control" id="shipmentType" value="ME">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">KM</label>
                        <input type="number" step="0.01" class="form-control" id="km" value="5.9">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Orden</label>
                        <input type="number" class="form-control" id="orden" value="2">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Store Header</label>
                        <input disabled type="number" class="form-control" id="storeHeader" value="1232">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Tienda destino manual</label>
                        <input type="number" class="form-control" id="manualStore" placeholder="Ejemplo: 1174">
                        <small class="text-muted">
                            Si capturas una tienda aquí, se usará para todas las partidas seleccionadas.
                            Si lo dejas vacío, se usará la tienda detectada por partida.
                        </small>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Bearer Token</label>
                        <textarea class="form-control" id="bearerToken" rows="4" placeholder="Pega aquí el token actual"></textarea>
                    </div>

                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="insertable" checked>
                        <label class="form-check-label" for="insertable">
                            Insertable
                        </label>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-7">
            <div class="card">
                <div class="card-body">
                    <h4>3. Resultado del análisis</h4>
                    <p>Selecciona las partidas que se enviarán al endpoint.</p>

                    <div id="analysisResult">
                        Aún no hay pedidos analizados.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="autoAssignModal" tabindex="-1">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Partidas autoasignables detectadas</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <div class="alert alert-info">
                    Estas partidas son pantallas en estatus 16 sin tienda. Se sugiere una tienda tomada de otra partida del mismo pedido.
                </div>

                <div class="table-responsive">
                    <table class="table table-sm table-bordered align-middle">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Pedido</th>
                                <th>Partida pantalla</th>
                                <th>Producto pantalla</th>
                                <th>Tienda a asignar</th>
                                <th>Partidas referencia</th>
                            </tr>
                        </thead>
                        <tbody id="autoAssignTableBody"></tbody>
                    </table>
                </div>

                <div id="autoAssignMessage"></div>
            </div>

            <div class="modal-footer">
                <button class="btn btn-secondary" data-bs-dismiss="modal">
                    Cancelar
                </button>

                <button class="btn btn-success" id="btnUseAutoAssign">
                    Usar seleccionadas
                </button>
            </div>
        </div>
    </div>
</div>
<script src="{{ asset('js/sanborns/assign-partida.js') }}"></script>

<script>
    window.assignPartida.init({
        importUrl: "{{ url('/api/sanborns/assign-partida/import') }}",
        analyzeUrl: "{{ url('/api/sanborns/assign-partida/analyze') }}",
        executeUrl: "{{ url('/api/sanborns/assign-partida/execute') }}",
        csrfToken: "{{ csrf_token() }}"
    });
</script>
@endsection
