let analyzedOrders = [];
let statusSelect;

function getMarketplace() {
    return document.getElementById("marketplace")?.value || "sanborns";
}

function apiUrl(path) {
    return `/api/${getMarketplace()}${path}`;
}

function getOrders() {
    return document
        .getElementById("ordersInput")
        .value.split(",")
        .map((order) => parseInt(order.trim()))
        .filter(Boolean);
}

function showImportResult(data, isError = false) {
    const box = document.getElementById("importResult");

    box.classList.remove(
        "d-none",
        "alert-light",
        "alert-danger",
        "alert-success",
    );

    box.classList.add(isError ? "alert-danger" : "alert-success");
    box.innerText = JSON.stringify(data, null, 2);
}

async function importOrders() {
    try {
        const response = await fetch(apiUrl("/import"), {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ pedidos: getOrders() }),
        });

        const data = await response.json();
        showImportResult(data, !response.ok);
    } catch (error) {
        showImportResult({ message: error.message }, true);
    }
}

async function analyzeOrders() {
    const container = document.getElementById("analysisResult");

    container.innerHTML = `
        <div class="text-center py-4">
            <div class="spinner-border text-primary" role="status"></div>
            <p class="text-muted mt-2 mb-0">Analizando pedidos...</p>
        </div>
    `;

    try {
        const response = await fetch(apiUrl("/sanitizations/analyze"), {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ orders: getOrders() }),
        });

        const data = await response.json();

        if (!response.ok) {
            container.innerHTML = `
                <div class="alert alert-danger">
                    ${data.message ?? "Ocurrió un error al analizar los pedidos."}
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
    const container = document.getElementById("analysisResult");
    container.innerHTML = "";

    if (!analyzedOrders.length) {
        container.innerHTML = `
            <div class="alert alert-warning mb-0">
                No se encontró información para los pedidos solicitados.
            </div>
        `;
        return;
    }

    analyzedOrders.forEach((order) => {
        const div = document.createElement("div");
        div.className = "card shadow-sm border-0 order-card mb-4";

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

                ${order.items
                    .map(
                        (item, index) => `
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
                `,
                    )
                    .join("")}
            </div>
        `;

        container.appendChild(div);
    });
}

function buildSanitizationsPayload() {
    const selected = [...document.querySelectorAll(".item-checkbox:checked")];

    const targetStatus = parseInt(
        document.getElementById("targetStatus").value,
    );

    const updateOrderStatus =
        document.getElementById("updateOrderStatus").checked;

    const statusName = getSelectedStatusText();

    const grouped = {};

    selected.forEach((item) => {
        const order = item.dataset.order;

        if (!grouped[order]) {
            grouped[order] = {
                order_number: parseInt(order),
                item_status: targetStatus,
                update_order_status: updateOrderStatus,
                order_status: updateOrderStatus ? targetStatus : null,
                user_id: 1167,
                comment: "",
                items: [],
                item_ids: [],
            };
        }

        grouped[order].items.push(parseInt(item.dataset.relation));
        grouped[order].item_ids.push(parseInt(item.dataset.item));
    });

    Object.values(grouped).forEach((group) => {
        group.comment = buildComment(group.item_ids, statusName);
        delete group.item_ids;
    });

    return Object.values(grouped);
}

function buildComment(itemIds, statusName) {
    const label = itemIds.length === 1 ? "Partida" : "Partidas";
    const verb = itemIds.length === 1 ? "se cambia" : "se cambian";

    return `${label} [${itemIds.join(",")}] ${verb} a ${statusName}, solicitado por correo electronico.`;
}

function generatePayload() {
    document.getElementById("payloadOutput").innerText = JSON.stringify(
        buildSanitizationsPayload(),
        null,
        2,
    );
}

async function generateScript() {
    const sanitizations = buildSanitizationsPayload();

    document.getElementById("payloadOutput").innerText = JSON.stringify(
        sanitizations,
        null,
        2,
    );

    try {
        const response = await fetch(apiUrl("/sanitizations/generate-script"), {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ sanitizations }),
        });

        const data = await response.json();

        if (!response.ok) {
            document.getElementById("sqlOutput").innerText =
                data.message ?? "Ocurrió un error al generar el script.";
            return;
        }

        document.getElementById("sqlOutput").innerText = data.sql;
    } catch (error) {
        document.getElementById("sqlOutput").innerText = error.message;
    }
}

async function loadStatuses() {
    try {
        const response = await fetch(apiUrl("/statuses"));
        const statuses = await response.json();

        if (!response.ok) {
            throw new Error(
                statuses.message ?? "No se pudieron cargar los estatus.",
            );
        }

        const select = document.getElementById("targetStatus");
        select.innerHTML = "";

        statuses.forEach((status) => {
            const option = document.createElement("option");

            option.value = status.id;
            option.textContent = `${status.id} - ${status.name}`;

            select.appendChild(option);
        });

        if (statusSelect) {
            statusSelect.destroy();
        }

        statusSelect = new TomSelect("#targetStatus", {
            create: false,
            sortField: {
                field: "text",
                direction: "asc",
            },
            placeholder: "Buscar estatus...",
        });

        statusSelect.on("change", updateDynamicComment);
    } catch (error) {
        const select = document.getElementById("targetStatus");

        select.innerHTML = "";

        const option = document.createElement("option");
        option.value = "";
        option.textContent = error.message;

        select.appendChild(option);
    }
}

function getSelectedStatusText() {
    if (statusSelect) {
        return (
            statusSelect
                .getItem(statusSelect.getValue())
                ?.textContent?.replace(/^\d+\s*-\s*/, "")
                ?.trim() ?? ""
        );
    }

    const select = document.getElementById("targetStatus");
    const selectedOption = select.options[select.selectedIndex];

    if (!selectedOption) {
        return "";
    }

    return selectedOption.textContent.replace(/^\d+\s*-\s*/, "").trim();
}

function updateDynamicComment() {
    const selected = [...document.querySelectorAll(".item-checkbox:checked")];
    const statusName = getSelectedStatusText();

    if (!selected.length || !statusName) {
        document.getElementById("comment").value = "";
        return;
    }

    const grouped = {};

    selected.forEach((item) => {
        const order = item.dataset.order;

        if (!grouped[order]) {
            grouped[order] = [];
        }

        grouped[order].push(parseInt(item.dataset.item));
    });

    const comments = Object.entries(grouped).map(([order, itemIds]) => {
        return buildComment(itemIds, statusName);
    });

    document.getElementById("comment").value = comments.join("\n");
}

document.addEventListener("DOMContentLoaded", () => {
    loadStatuses();
});
