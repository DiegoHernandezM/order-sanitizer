const assignPartida = {
    importUrl: null,
    analyzeUrl: null,
    executeUrl: null,
    csrfToken: null,

    init(config) {
        this.importUrl = config.importUrl;
        this.analyzeUrl = config.analyzeUrl;
        this.executeUrl = config.executeUrl;
        this.csrfToken = config.csrfToken;

        document
            .getElementById("btnImport")
            ?.addEventListener("click", () => this.importOrders());

        document
            .getElementById("btnAnalyze")
            ?.addEventListener("click", () => this.analyzeOrders());

        document.addEventListener("click", (event) => {
            if (event.target?.id === "btnExecute") {
                this.previewExecution();
            }

            if (event.target?.id === "btnConfirmExecute") {
                this.executeAssignment();
            }

            if (event.target?.id === "btnCancelPreview") {
                document.getElementById("executionPreview")?.remove();
            }
            if (event.target?.id === "btnUseAutoAssign") {
                this.useAutoAssignables();
            }
        });
    },

    getOrders() {
        return document.getElementById("orders")?.value || "";
    },

    getExecutionConfig() {
        return {
            shipmentType:
                document.getElementById("shipmentType")?.value || "ME",
            km: parseFloat(
                (document.getElementById("km")?.value || "5.9").replace(
                    ",",
                    ".",
                ),
            ),
            orden: parseInt(document.getElementById("orden")?.value || "2"),
            insertable: document.getElementById("insertable")?.checked ?? true,
            storeHeader:
                document.getElementById("storeHeader")?.value || "1232",
            manualStore: document.getElementById("manualStore")?.value || "",
            bearerToken: document.getElementById("bearerToken")?.value || "",
        };
    },

    getSelectedItems() {
        const config = this.getExecutionConfig();

        return [...document.querySelectorAll(".assign-item:checked")].map(
            (input) => {
                const detectedStore = input.dataset.store || "";
                const finalStore = config.manualStore || detectedStore;

                return {
                    order_number: input.dataset.order,
                    relation_id: input.dataset.relation,
                    dispatch_store: finalStore,
                    detected_store: detectedStore,
                };
            },
        );
    },

    showMessage(message, type = "info") {
        document.getElementById("analysisResult").innerHTML = `
            <div class="alert alert-${type}">
                ${message}
            </div>
        `;
    },

    showExecutionMessage(message, type = "info") {
        const container = document.getElementById("executionResult");

        if (container) {
            container.innerHTML = `
                <div class="alert alert-${type} mt-3">
                    ${message}
                </div>
            `;
            return;
        }

        document.getElementById("analysisResult").insertAdjacentHTML(
            "beforeend",
            `
            <div id="executionResult">
                <div class="alert alert-${type} mt-3">
                    ${message}
                </div>
            </div>
            `,
        );
    },

    async importOrders() {
        const orders = this.getOrders();

        if (!orders.trim()) {
            this.showMessage("Debes ingresar al menos un pedido.", "warning");
            return;
        }

        this.showMessage("Importando pedidos desde PROD...", "info");

        try {
            const response = await fetch(this.importUrl, {
                method: "POST",
                headers: this.headers(),
                body: JSON.stringify({ orders }),
            });

            const data = await this.parseResponse(response);

            if (!response.ok || !data.success) {
                this.showMessage(
                    data.message || "Ocurrió un error al importar.",
                    "danger",
                );
                return;
            }

            this.showMessage(
                `
                ${data.message}<br>
                Pedidos importados: ${data.orders.length}
                `,
                "success",
            );
        } catch (error) {
            this.showMessage(error.message, "danger");
        }
    },

    async analyzeOrders() {
        const orders = this.getOrders();

        if (!orders.trim()) {
            this.showMessage("Debes ingresar al menos un pedido.", "warning");
            return;
        }

        this.showMessage("Analizando partidas...", "info");

        try {
            const response = await fetch(this.analyzeUrl, {
                method: "POST",
                headers: this.headers(),
                body: JSON.stringify({ orders }),
            });

            const data = await this.parseResponse(response);

            console.log("STATUS:", response.status);
            console.log("OK:", response.ok);
            console.log("DATA:", data);

            if (!response.ok || !data.success) {
                   console.log("response:", response);
                this.showMessage(
                    data.message || "Ocurrió un error al analizar.",
                    "danger",
                );
                return;
            }

            this.renderAnalysis(data.items);
            if (data.auto_assignables?.length) {
                this.renderAutoAssignables(data.auto_assignables);
            }
        } catch (error) {
            this.showMessage(error.message, "danger");
        }
    },

    previewExecution() {
        document.getElementById("executionPreview")?.remove();
        document.getElementById("executionResult")?.remove();

        const config = this.getExecutionConfig();
        const items = this.getSelectedItems();

        if (!items.length) {
            this.showExecutionMessage(
                "Debes seleccionar al menos una partida.",
                "warning",
            );
            return;
        }

        if (!config.storeHeader.toString().trim()) {
            this.showExecutionMessage(
                "Debes capturar el Store Header.",
                "warning",
            );
            return;
        }

        if (!config.bearerToken.trim()) {
            this.showExecutionMessage(
                "Debes pegar el Bearer Token actual.",
                "warning",
            );
            return;
        }

        const invalidItems = items.filter((item) => !item.dispatch_store);

        if (invalidItems.length) {
            this.showExecutionMessage(
                "Hay partidas seleccionadas sin tienda destino. Captura una tienda manual o desmarca esas partidas.",
                "danger",
            );
            return;
        }

        const rows = items
            .map(
                (item) => `
                <li>
                    Se asignará la partida <strong>${item.relation_id}</strong>
                    del pedido <strong>${item.order_number}</strong>
                    a la tienda <strong>${item.dispatch_store}</strong>.
                </li>
            `,
            )
            .join("");

        document.getElementById("analysisResult").insertAdjacentHTML(
            "beforeend",
            `
            <div class="alert alert-warning mt-3" id="executionPreview">
                <h5>Confirmación de asignación</h5>
                <ul class="mb-3">${rows}</ul>

                <button type="button" class="btn btn-danger" id="btnConfirmExecute">
                    Confirmar asignación en PC
                </button>

                <button type="button" class="btn btn-secondary ms-2" id="btnCancelPreview">
                    Cancelar
                </button>
            </div>
            `,
        );
    },

    async executeAssignment() {
        const config = this.getExecutionConfig();
        const items = this.getSelectedItems();

        if (!items.length) {
            this.showExecutionMessage(
                "Debes seleccionar al menos una partida.",
                "warning",
            );
            return;
        }

        document
            .getElementById("btnConfirmExecute")
            ?.setAttribute("disabled", true);
        this.showExecutionMessage("Ejecutando asignación en PC...", "info");

        try {
            const response = await fetch(this.executeUrl, {
                method: "POST",
                headers: this.headers(),
                body: JSON.stringify({
                    items,
                    config,
                }),
            });

            const data = await this.parseResponse(response);

            if (!response.ok || !data.success) {
                this.showExecutionMessage(
                    data.message || "Ocurrió un error al asignar en PC.",
                    "danger",
                );
                document
                    .getElementById("btnConfirmExecute")
                    ?.removeAttribute("disabled");
                return;
            }

            this.renderExecutionResults(data);
        } catch (error) {
            this.showExecutionMessage(error.message, "danger");
            document
                .getElementById("btnConfirmExecute")
                ?.removeAttribute("disabled");
        }
    },

    renderExecutionResults(data) {
        document.getElementById("executionPreview")?.remove();

        const results = data.results || [];

        const rows = results
            .map((result) => {
                const processed = result.response?.detail?.processed || [];
                const fail = result.response?.detail?.fail || [];

                const processedHtml = processed.length
                    ? processed
                          .map(
                              (item) => `
                            <div class="text-success">
                                Partida ${item.relationId}: ${item.message}
                            </div>
                        `,
                          )
                          .join("")
                    : "";

                const failHtml = fail.length
                    ? fail
                          .map(
                              (item) => `
                            <div class="text-danger">
                                Partida ${item.relationId || ""}: ${item.message || "Error"}
                            </div>
                        `,
                          )
                          .join("")
                    : "";

                return `
                    <tr>
                        <td>${result.order_number}</td>
                        <td>${result.status}</td>
                        <td>${result.success ? "Correcto" : "Error"}</td>
                        <td>
                            ${processedHtml}
                            ${failHtml}
                            ${
                                !processedHtml && !failHtml
                                    ? JSON.stringify(result.response)
                                    : ""
                            }
                        </td>
                    </tr>
                `;
            })
            .join("");

        this.showExecutionMessage(
            `
            <strong>${data.message || "Asignación ejecutada en PC."}</strong>

            <div class="table-responsive mt-3">
                <table class="table table-sm table-bordered align-middle">
                    <thead>
                        <tr>
                            <th>Pedido</th>
                            <th>HTTP</th>
                            <th>Resultado</th>
                            <th>Detalle</th>
                        </tr>
                    </thead>
                    <tbody>
                        ${rows}
                    </tbody>
                </table>
            </div>
            `,
            "success",
        );
    },

    headers() {
        return {
            "X-CSRF-TOKEN": this.csrfToken,
            Accept: "application/json",
            "Content-Type": "application/json",
        };
    },

    async parseResponse(response) {
        const contentType = response.headers.get("content-type") || "";

        if (contentType.includes("application/json")) {
            return await response.json();
        }

        const text = await response.text();

        throw new Error(
            `El servidor respondió con un formato no válido. HTTP ${response.status}. ${text.substring(0, 200)}`,
        );
    },

    renderAnalysis(items) {
        if (!items.length) {
            this.showMessage(
                "No se encontraron partidas para los pedidos indicados.",
                "warning",
            );
            return;
        }

        const rows = items
            .map(
                (item) => `
            <tr>
                <td>
                    <input type="checkbox" class="form-check-input assign-item"
                        data-order="${item.order_number}"
                        data-relation="${item.relation_id}"
                        data-store="${item.dispatch_store || ""}">
                </td>
                <td>${item.order_number}</td>
                <td>${item.relation_id}</td>
                <td>${item.product_name || ""}</td>
                <td>${item.status_id || ""}</td>
                <td>${item.dispatch_store || '<span class="text-danger">Sin tienda</span>'}</td>
                <td>${item.transfer_status || ""}</td>
            </tr>
        `,
            )
            .join("");

        document.getElementById("analysisResult").innerHTML = `
            <div class="table-responsive">
                <table class="table table-sm table-bordered align-middle">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Pedido</th>
                            <th>Relation ID</th>
                            <th>Producto</th>
                            <th>Estatus</th>
                            <th>Tienda asignada</th>
                            <th>Estatus transferencia</th>
                        </tr>
                    </thead>
                    <tbody>${rows}</tbody>
                </table>
            </div>

            <button type="button" class="btn btn-dark mt-3" id="btnExecute">
                Asignar partidas en PC
            </button>
        `;
    },

    renderAutoAssignables(items) {
        this.autoAssignables = items || [];

        const tbody = document.getElementById("autoAssignTableBody");

        if (!tbody) return;

        tbody.innerHTML = this.autoAssignables
            .map((item, index) => {
                const refs = (item.reference_items || [])
                    .map(
                        (ref) => `
            <div>
                <strong>${ref.relation_id}</strong> -
                ${ref.product_name || ""}
                <span class="badge bg-secondary">Tienda ${ref.store_id}</span>
            </div>
        `,
                    )
                    .join("");

                return `
            <tr>
                <td>
                    <input
                        type="checkbox"
                        class="form-check-input auto-assign-check"
                        value="${index}"
                    >
                </td>
                <td>${item.order_number}</td>
                <td>${item.screen_relation_id}</td>
                <td>${item.screen_product_name || ""}</td>
                <td>
                    <input
                        type="number"
                        class="form-control form-control-sm auto-assign-store"
                        data-index="${index}"
                        value="${item.suggested_store || ""}"
                    >
                </td>
                <td>${refs}</td>
            </tr>
        `;
            })
            .join("");

        const modal = new bootstrap.Modal(
            document.getElementById("autoAssignModal"),
        );

        modal.show();
    },

    useAutoAssignables() {
        const selected = [
            ...document.querySelectorAll(".auto-assign-check:checked"),
        ]
            .map((input) => {
                const index = input.value;
                const item = this.autoAssignables[index];

                const storeInput = document.querySelector(
                    `.auto-assign-store[data-index="${index}"]`,
                );

                return {
                    order_number: item.order_number,
                    relation_id: item.screen_relation_id,
                    product_name: item.screen_product_name,
                    status_id: item.status_id,
                    dispatch_store: String(
                        storeInput?.value || item.suggested_store || "",
                    ).trim(),
                    transfer_status: "AUTO",
                };
            })
            .filter((item) => item.dispatch_store);

        if (!selected.length) {
            document.getElementById("autoAssignMessage").innerHTML = `
            <div class="alert alert-warning">
                Selecciona al menos una partida con tienda destino.
            </div>
        `;
            return;
        }

        this.appendAutoAssignableRows(selected);

        const modal = bootstrap.Modal.getInstance(
            document.getElementById("autoAssignModal"),
        );

        modal?.hide();

        this.showExecutionMessage(
            `Se agregaron ${selected.length} partida(s) autoasignables al análisis. Valida y confirma la asignación.`,
            "success",
        );
    },
    appendAutoAssignableRows(items) {
        const tbody = document.querySelector("#analysisResult table tbody");

        if (!tbody) {
            this.renderAnalysis(items);
            return;
        }

        items.forEach((item) => {
            const exists = document.querySelector(
                `.assign-item[data-relation="${item.relation_id}"]`,
            );

            if (exists) {
                exists.checked = true;
                exists.dataset.store = String(item.dispatch_store || "").trim();

                const row = exists.closest("tr");
                if (row) {
                    row.classList.add("table-warning");
                    row.children[5].innerHTML = item.dispatch_store;
                    row.children[6].innerHTML = item.transfer_status || "AUTO";
                }

                return;
            }

            tbody.insertAdjacentHTML(
                "beforeend",
                `
            <tr class="table-warning">
                <td>
                    <input
                        type="checkbox"
                        class="form-check-input assign-item"
                        checked
                        data-order="${item.order_number}"
                        data-relation="${item.relation_id}"
                        data-store="${String(item.dispatch_store || "").trim()}"
                    >
                </td>
                <td>${item.order_number}</td>
                <td>${item.relation_id}</td>
                <td>${item.product_name || ""}</td>
                <td>${item.status_id || ""}</td>
                <td>${item.dispatch_store || '<span class="text-danger">Sin tienda</span>'}</td>
                <td>${item.transfer_status || "AUTO"}</td>
            </tr>
        `,
            );
        });
    },
};

window.assignPartida = assignPartida;
