<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Order Sanitizer</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tom-select@2.4.3/dist/css/tom-select.bootstrap5.min.css" rel="stylesheet">
    <style>
        body {
            background: #f4f6f9;
        }

        .page-title {
            letter-spacing: -0.5px;
        }

        .json-box {
            background: #111827;
            color: #22c55e;
            padding: 16px;
            border-radius: 10px;
            overflow: auto;
            min-height: 120px;
        }

        .order-card {
            border-left: 5px solid #0d6efd;
        }

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
</head>

<body>
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

<script>
    let analyzedOrders = [];

    function getOrders() {
        return document.getElementById('ordersInput')
            .value
            .split(',')
            .map(order => parseInt(order.trim()))
            .filter(Boolean);
    }

    function showImportResult(data, isError = false) {
        const box = document.getElementById('importResult');

        box.classList.remove('d-none', 'alert-light', 'alert-danger', 'alert-success');
        box.classList.add(isError ? 'alert-danger' : 'alert-success');

        box.innerText = JSON.stringify(data, null, 2);
    }

    async function importOrders() {
        try {
            const response = await fetch('/api/sanborns/import', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ pedidos: getOrders() })
            });

            const data = await response.json();

            showImportResult(data, !response.ok);
        } catch (error) {
            showImportResult({ message: error.message }, true);
        }
    }

    async function analyzeOrders() {
        const container = document.getElementById('analysisResult');
        container.innerHTML = `
            <div class="text-center py-4">
                <div class="spinner-border text-primary" role="status"></div>
                <p class="text-muted mt-2 mb-0">Analizando pedidos...</p>
            </div>
        `;

        try {
            const response = await fetch('/api/sanitizations/analyze', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ orders: getOrders() })
            });

            const data = await response.json();

            if (!response.ok) {
                container.innerHTML = `
                    <div class="alert alert-danger">
                        ${data.message ?? 'Ocurrió un error al analizar los pedidos.'}
                    </div>
                `;
                return;
            }

            analyzedOrders = data.data;
            renderAnalysis();
        } catch (error) {
            container.innerHTML = `
                <div class="alert alert-danger">
                    ${error.message}
                </div>
            `;
        }
    }

    function renderAnalysis() {
        const container = document.getElementById('analysisResult');
        container.innerHTML = '';

        if (!analyzedOrders.length) {
            container.innerHTML = `
                <div class="alert alert-warning mb-0">
                    No se encontró información para los pedidos solicitados.
                </div>
            `;
            return;
        }

        analyzedOrders.forEach(order => {
            const div = document.createElement('div');
            div.className = 'card shadow-sm border-0 order-card mb-4';

            div.innerHTML = `
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-start flex-wrap gap-2 mb-3">
                        <div>
                            <h5 class="fw-bold mb-1">Pedido ${order.order_number}</h5>

                            <div class="small-muted">
                                Estatus actual del pedido:
                                <span class="badge text-bg-secondary">
                                    ${order.order_status.id} - ${order.order_status.name}
                                </span>
                            </div>
                        </div>

                        <span class="badge text-bg-primary">
                            ${order.items_count} partida(s)
                        </span>
                    </div>

                    ${order.items.map((item, index) => `
                        <div class="card item-card mb-2">
                            <div class="card-body py-3">
                                <div class="form-check">
                                    <input
                                        type="checkbox"
                                        class="form-check-input item-checkbox"
                                        id="item-${item.relation_status_id}"
                                        data-order="${order.order_number}"
                                        data-relation="${item.relation_status_id}"
                                        data-item="${item.item_id}"
                                        onchange="updateDynamicComment()">

                                    <label class="form-check-label w-100" for="item-${item.relation_status_id}">
                                        <div class="d-flex justify-content-between align-items-start flex-wrap gap-2">
                                            <div>
                                                <strong>P${index + 1}</strong>

                                                <span class="badge text-bg-light border">
                                                    Item ${item.item_id}
                                                </span>

                                                <span class="badge text-bg-light border">
                                                    Relación ${item.relation_status_id}
                                                </span>

                                                <span class="badge text-bg-info">
                                                    Producto ${item.product_id}
                                                </span>
                                            </div>

                                            <span class="badge text-bg-success">
                                                ${item.item_status.id} - ${item.item_status.name}
                                            </span>
                                        </div>

                                        <div class="small-muted mt-2">
                                            ${item.product_name}
                                        </div>
                                    </label>
                                </div>
                            </div>
                        </div>
                    `).join('')}
                </div>
            `;

            container.appendChild(div);
        });
    }

    function generatePayload() {
        const selected = [...document.querySelectorAll('.item-checkbox:checked')];

        const targetStatus = parseInt(document.getElementById('targetStatus').value);
        const updateOrderStatus = document.getElementById('updateOrderStatus').checked;
        const comment = document.getElementById('comment').value;

        const grouped = {};

        selected.forEach(item => {
            const order = item.dataset.order;

            if (!grouped[order]) {
                grouped[order] = {
                    order_number: parseInt(order),
                    item_status: targetStatus,
                    update_order_status: updateOrderStatus,
                    order_status: updateOrderStatus ? targetStatus : null,
                    user_id: 1167,
                    comment: comment,
                    items: []
                };
            }

            grouped[order].items.push(parseInt(item.dataset.relation));
        });

        document.getElementById('payloadOutput').innerText =
            JSON.stringify(Object.values(grouped), null, 2);
    }
    let statusSelect;

    async function loadStatuses() {

        const response = await fetch('/api/statuses');
        const statuses = await response.json();

        const select = document.getElementById('targetStatus');

        statuses.forEach(status => {

            const option = document.createElement('option');

            option.value = status.id;
            option.textContent = `${status.id} - ${status.name}`;

            select.appendChild(option);
        });

        statusSelect = new TomSelect('#targetStatus', {
            create: false,
            sortField: {
                field: 'text',
                direction: 'asc'
            },
            placeholder: 'Buscar estatus...'
        });
        statusSelect.on('change', updateDynamicComment);
    }

    document.addEventListener('DOMContentLoaded', () => {
            loadStatuses();
        });
        function getSelectedStatusText() {
        const select = document.getElementById('targetStatus');
        const selectedOption = select.options[select.selectedIndex];

        if (!selectedOption) {
            return '';
        }

        return selectedOption.textContent
            .replace(/^\d+\s*-\s*/, '')
            .trim();
    }

    function updateDynamicComment() {
        const selected = [...document.querySelectorAll('.item-checkbox:checked')];

        const itemIds = selected.map(item => item.dataset.item);

        const statusName = getSelectedStatusText();

        if (!itemIds.length || !statusName) {
            document.getElementById('comment').value = '';
            return;
        }

        const label = itemIds.length === 1 ? 'Partida' : 'Partidas';
        const verb = itemIds.length === 1 ? 'se cambia' : 'se cambian';

        document.getElementById('comment').value =
            `${label} [${itemIds.join(',')}] ${verb} a ${statusName}, solicitado por correo electronico.`;
    }
    
    async function generateScript() {

        const selected = [...document.querySelectorAll('.item-checkbox:checked')];

        const targetStatus = parseInt(document.getElementById('targetStatus').value);

        const updateOrderStatus =
            document.getElementById('updateOrderStatus').checked;

        const comment =
            document.getElementById('comment').value;

        const grouped = {};

        selected.forEach(item => {

            const order = item.dataset.order;

            if (!grouped[order]) {

                grouped[order] = {
                    order_number: parseInt(order),
                    item_status: targetStatus,
                    update_order_status: updateOrderStatus,
                    order_status: updateOrderStatus ? targetStatus : null,
                    user_id: 1167,
                    comment: comment,
                    items: []
                };
            }

            grouped[order].items.push(
                parseInt(item.dataset.relation)
            );
        });

        const response = await fetch(
            '/api/sanitizations/generate-script',
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    sanitizations: Object.values(grouped)
                })
            }
        );

        const data = await response.json();

        document.getElementById('sqlOutput').innerText =
            data.sql;
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/tom-select@2.4.3/dist/js/tom-select.complete.min.js"></script>
</body>
</html>