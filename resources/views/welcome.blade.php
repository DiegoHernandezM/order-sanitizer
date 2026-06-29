@extends('layouts.app')

@section('content')

<div class="container py-4">

    <div class="text-center mb-5">
        <h1 class="display-5 fw-bold">
            Manual de Usuario
        </h1>

        <p class="lead">
            Bienvenido a <strong>Order Sanitizer</strong>.
            Esta herramienta permite realizar la asignación de tiendas y la generación
            de scripts SQL para la actualización de estatus de pedidos de
            <strong>Sanborns</strong> y <strong>Sears</strong>.
        </p>

        <hr>
    </div>

    {{-- ============================= --}}
    {{-- ASSIGN PARTIDA --}}
    {{-- ============================= --}}

    <div class="card shadow-sm mb-5">

        <div class="card-header bg-primary text-white">
            <h3 class="mb-0">
                Sears / Sanborns - Assign Partida
            </h3>
        </div>

        <div class="card-body">

            @for($i=1;$i<=6;$i++)

                <div class="mb-5">

                    <h4>Paso {{ $i }}</h4>

                    @switch($i)

                        @case(1)
                            <p>
                                Capture uno o varios números de pedido en el área de texto,
                                colocando un pedido por línea.
                            </p>
                        @break

                        @case(2)
                            <p>
                                Presione el botón <strong>Importar</strong> para obtener
                                la información desde producción.
                            </p>
                        @break

                        @case(3)
                            <p>
                                Presione <strong>Analizar Partidas</strong>. El sistema
                                mostrará las partidas y, si detecta tiendas previamente
                                asignadas dentro del mismo pedido, propondrá automáticamente
                                una sugerencia de asignación.
                            </p>
                        @break

                        @case(4)
                            <p>
                                Seleccione las partidas y la tienda que desea asignar.
                            </p>
                        @break

                        @case(5)
                            <p>
                                Si desea realizar una asignación manual, capture la tienda
                                destino y pegue el Token obtenido desde API Plataforma.
                            </p>
                        @break

                        @case(6)
                            <p>
                                Presione <strong>Asignar Partidas en PC</strong>.
                                Revise el resumen mostrado y confirme la operación. <strong>PARA ESTE PASO ES IMPORTANTE NO ESTAR CONECTADO A LA VPN PARA ALCANZAR EL ENPOINT DE ASIGNACION</strong>.
                            </p>
                        @break

                    @endswitch
                    @if($i != 6)
                        <div class="border rounded p-3 bg-light text-center">
                            <img
                                src="{{ asset('images/manual/assign-step'.$i.'.png') }}"
                                class="img-fluid rounded shadow-sm"
                                alt="Paso {{ $i }}"
                            >
                        </div>
                    @endif

                </div>

            @endfor

        </div>

    </div>


    {{-- ============================= --}}
    {{-- STATUS SANITIZER --}}
    {{-- ============================= --}}

    <div class="card shadow-sm">

        <div class="card-header bg-success text-white">
            <h3 class="mb-0">
                Sears / Sanborns - Status Sanitizer
            </h3>
        </div>

        <div class="card-body">

            @for($i=1;$i<=5;$i++)

                <div class="mb-5">

                    <h4>Paso {{ $i }}</h4>

                    @switch($i)

                        @case(1)
                            <p>
                                Capture los pedidos que requieren cambio de estatus y
                                presione <strong>Importar</strong>.
                            </p>
                        @break

                        @case(2)
                            <p>
                                Presione <strong>Analizar Partidas</strong>.
                            </p>
                        @break

                        @case(3)
                            <p>
                                Seleccione únicamente las partidas que desea actualizar.
                            </p>
                        @break

                        @case(4)
                            <p>
                                Seleccione el nuevo estatus, active la opción para actualizar
                                el pedido si así lo requiere y revise el comentario generado.
                            </p>
                        @break

                        @case(5)
                            <p>
                                Presione <strong>Generar Script SQL</strong>, copie el
                                resultado y guárdelo en un archivo <strong>.sql</strong>
                                para enviarlo al equipo DBA.
                            </p>
                        @break

                    @endswitch

                    @if($i != 2 && $i != 3)
                    <div class="border rounded p-3 bg-light text-center">

                        <img
                            src="{{ asset('images/manual/status-step'.$i.'.png') }}"
                            class="img-fluid rounded shadow-sm"
                            alt="Paso {{ $i }}"
                        >

                    </div>
                    @endif

                </div>

            @endfor

        </div>

    </div>

</div>

@endsection