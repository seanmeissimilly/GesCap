<%-- Document : dashboard Created on : 16 mar 2023, 10:56:33 Author : davidam --%>

<%@page import="ModeloBean.UsuarioBean" %>
<%@page import="Modelo.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <jsp:include page="header.jsp"></jsp:include>
            <title>GesCap Tablero</title>
        </head>

        <body>
        <jsp:include page="navbar.jsp"></jsp:include>

            <main id="main" class="main">

                <section class="section dashboard">
                    <div class="row">

                        <!-- Left side columns -->
                        <div class="col-lg-8">
                            <div class="row">

                                <div class="col-12">
                                    <div class="card">
                                        <div class="container">
                                            <div class="text-center my-5">
                                                <h1 class="fw-bolder fs-2">GesCap - Centro Cimex de Capacitación
                                                </h1>
                                                <p class="lead mb-0 fs-5">“No fructifica la educación si no es
                                                    continua y constante.” José
                                                    Martí.</p>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!-- Reports -->
                                <div class="col-12">
                                    <div class="card">

                                        <div class="filter">
                                            <a class="icon" href="#" data-bs-toggle="dropdown"><i
                                                    class="bi bi-three-dots"></i></a>
                                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                <li class="dropdown-header text-start">
                                                    <h6>Filter</h6>
                                                </li>

                                                <li><a class="dropdown-item" href="#">Today</a></li>
                                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                                <li><a class="dropdown-item" href="#">This Year</a></li>
                                            </ul>
                                        </div>

                                        <div class="card-body">
                                            <h5 class="card-title">Acciones por Entidades<span>/Today</span>
                                            </h5>

                                            <!-- Line Chart -->
                                            <div id="reportsChart"></div>

                                            <script>
                                                document.addEventListener("DOMContentLoaded", () => {
                                                    new ApexCharts(document.querySelector("#reportsChart"), {
                                                        series: [{
                                                                name: 'CCC',
                                                                data: [31, 40, 28, 51, 42, 82, 56],
                                                            }, {
                                                                name: 'Matanzas',
                                                                data: [11, 32, 45, 32, 34, 52, 41]
                                                            }, {
                                                                name: 'Holguin',
                                                                data: [15, 11, 32, 18, 9, 24, 11]
                                                            }],
                                                        chart: {
                                                            height: 350,
                                                            type: 'area',
                                                            toolbar: {
                                                                show: false
                                                            },
                                                        },
                                                        markers: {
                                                            size: 4
                                                        },
                                                        colors: ['#4154f1', '#2eca6a', '#ff771d'],
                                                        fill: {
                                                            type: "gradient",
                                                            gradient: {
                                                                shadeIntensity: 1,
                                                                opacityFrom: 0.3,
                                                                opacityTo: 0.4,
                                                                stops: [0, 90, 100]
                                                            }
                                                        },
                                                        dataLabels: {
                                                            enabled: false
                                                        },
                                                        stroke: {
                                                            curve: 'smooth',
                                                            width: 2
                                                        },
                                                        xaxis: {
                                                            type: 'datetime',
                                                            categories: ["2018-09-19T00:00:00.000Z", "2018-09-19T01:30:00.000Z", "2021-09-19T02:30:00.000Z", "2022-09-19T03:30:00.000Z", "2022-09-19T04:30:00.000Z", "2022-09-19T05:30:00.000Z", "2023-09-19T06:30:00.000Z"]
                                                        },
                                                        tooltip: {
                                                            x: {
                                                                format: 'dd/MM/yy HH:mm'
                                                            },
                                                        }
                                                    }).render();
                                                });
                                            </script>
                                            <!-- End Line Chart -->

                                        </div>

                                    </div>
                                </div><!-- End Reports -->
                            </div>
                        </div>
                        <div class="card-body pb-0 col-4">
                        <h5 class="card-title">Sitios Afines</h5>

                        <div class="row">
                            <div class="col-sm-6">
                                <ul class="list-unstyled mb-0">
                                    <li><a href="http://capacitacion.cimex.com.cu/aulavirtual/">Aula
                                            Virtual CCC</a>
                                    </li>
                                    <li><a
                                            href="http://capacitacion.cimex.com.cu:8080/gescap/">Gescap</a>
                                    </li>
                                    <li><a href="http://recursoshumanos.cimex.com.cu/">RRHH</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-sm-6">
                                <ul class="list-unstyled mb-0">
                                    <li><a href="http://www.cimex.com.cu/main/">Intranet
                                            Cimex</a>
                                    </li>
                                    <li><a
                                            href="https://cimexevaluacion.cimex.com.cu/login_evaluacion/">Talhu</a>
                                    </li>
                                    <li><a href="https://www.gacetaoficial.gob.cu/es">Gaceta
                                            Oficial
                                            de Cuba</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    </div><!-- End Left side columns -->

                    

                </section>

            </main>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>