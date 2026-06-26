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
            storeHeader: document.getElementById("storeHeader")?.value || "570",
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
                `${data.message}<br>Pedidos importados: ${data.orders.length}`,
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

            if (!response.ok || !data.success) {
                this.showMessage(
                    data.message || "Ocurrió un error al analizar.",
                    "danger",
                );
                return;
            }

            this.renderAnalysis(data.items);
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
                body: JSON.stringify({ items, config }),
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

        const rows = (data.results || [])
            .map((result) => {
                const processed = result.response?.detail?.processed || [];
                const fail = result.response?.detail?.fail || [];

                const processedHtml = processed
                    .map(
                        (item) => `
                <div class="text-success">
                    Partida ${item.relationId}: ${item.message}
                </div>
            `,
                    )
                    .join("");

                const failHtml = fail
                    .map(
                        (item) => `
                <div class="text-danger">
                    Partida ${item.relationId || ""}: ${item.message || "Error"}
                </div>
            `,
                    )
                    .join("");

                return `
                <tr>
                    <td>${result.order_number}</td>
                    <td>${result.status}</td>
                    <td>${result.success ? "Correcto" : "Error"}</td>
                    <td>
                        ${processedHtml}
                        ${failHtml}
                        ${!processedHtml && !failHtml ? JSON.stringify(result.response) : ""}
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
                    <tbody>${rows}</tbody>
                </table>
            </div>
        `,
            "success",
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
                    <input type="checkbox" class="form-check-input assign-item" checked
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
};

window.assignPartida = assignPartida;
