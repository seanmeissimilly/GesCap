<%-- 
    Document   : dashboard
    Created on : 16 mar 2023, 10:56:33
    Author     : davidam
--%>

<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <script src="./js/fontawesome-all.js"></script>
        <title>GesCap Tablero</title>
        <link rel="icon" href="./img/Logo_CCC.jpg" type="image/jpg" sizes="32x32">
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">  
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">  
        <link href="assets/css/style.css" rel="stylesheet"> 



    </head>

    <body>
        <!-- Reviso si ya se ha logueado -->
        <% HttpSession sesion = request.getSession();
            if (sesion.getAttribute("login") == null
                    || sesion.getAttribute("login").equals("0")) {
                response.sendRedirect("login.jsp");
            }%>

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">
            <div class="d-flex align-items-center justify-content-between">
                <a href="panel.jsp" class="logo d-flex align-items-center">        
                    <span class="d-none d-lg-block">GesCap</span>
                </a>
                <i class="bi bi-list toggle-sidebar-btn"></i>
            </div>
            <!-- End Logo -->

            <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">
                    <li class="nav-item dropdown pe-3">
                        <!-- Para que el usuario logueado salgo en la navbar -->
                        <%
                            //Busco en la base de datos el usuario.  
                            Usuario userapp = new UsuarioBean().list(sesion.getAttribute("user").toString());
                        %>
                        <a class="nav-link nav-profile d-flex align-items-center pe-0"  data-bs-toggle="dropdown">                            
                            <span class="d-none d-md-block dropdown-toggle ps-2"><%=userapp.getNombre()%></span>
                        </a><!-- End Profile Iamge Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                            <li class="dropdown-header">
                                <h6><%=userapp.getUsername()%></h6>                                
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>                            
                            <li>
                                <hr class="dropdown-divider">
                            </li>                            
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="404.jsp">
                                    <i class="bi bi-question-circle"></i>
                                    <span>¿Necesitas Ayuda?</span>
                                </a>
                            </li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="logout.jsp">
                                    <i class="bi bi-box-arrow-right"></i>
                                    <span>Salir</span>
                                </a>
                            </li>

                        </ul><!-- End Profile Dropdown Items -->
                    </li><!-- End Profile Nav -->
                </ul>                
            </nav>

        </header><!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">

                <li class="nav-item">
                    <a class="nav-link " href="panel.jsp">
                        <i class="bi bi-grid"></i>
                        <span>Tablero</span>
                    </a>
                </li><!-- End Dashboard Nav -->



                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="">
                        <i class="bi bi-journal-text"></i><span>Formularios</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="accion_add.jsp">
                                <i class="bi bi-circle"></i><span>Acciones</span>
                            </a>
                        </li>
                        <li>
                            <a href="persona_list.jsp">
                                <i class="bi bi-circle"></i><span>Personas</span>
                            </a>
                        </li>
                        <li>
                            <a href="entidad_list.jsp?page=1">
                                <i class="bi bi-circle"></i><span>Entidades</span>
                            </a>
                        </li>
                        <li>
                            <a href="organizacion_list.jsp">
                                <i class="bi bi-circle"></i><span>Organizaciones</span>
                            </a>
                        </li>
                        <li>
                            <a href="404.jsp">
                                <i class="bi bi-circle"></i><span>Roles</span>
                            </a>
                        </li>
                        <li>
                            <a href="rol_list.jsp">
                                <i class="bi bi-circle"></i><span>Usuarios</span>
                            </a>
                        </li>
                        <li>
                            <a href="404.jsp">
                                <i class="bi bi-circle"></i><span>Cursistas</span>
                            </a>
                        </li>
                        <li>
                            <a href="404.jsp">
                                <i class="bi bi-circle"></i><span>Profesores</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Forms Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-layout-text-window-reverse"></i><span>Reportes</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="reporte_accion_1.jsp">
                                <i class="bi bi-circle"></i><span>Plan de Curso</span>
                            </a>
                        </li>
                        <li>
                            <a href="reporte_accion_2.jsp">
                                <i class="bi bi-circle"></i><span>Listar Acciones</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Tables Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" href="404.jsp">
                        <i class="bi bi-question-circle"></i>
                        <span>¿Necesitas Ayuda?</span>
                    </a>
                </li><!-- End F.A.Q Page Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" href="login.jsp">
                        <i class="bi bi-box-arrow-in-right"></i>
                        <span>Entrada</span>
                    </a>
                </li><!-- End Login Page Nav -->
            </ul>

        </aside><!-- End Sidebar-->

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
                                            <h1 class="fw-bolder fs-2">GesCap - Centro Cimex de Capacitación</h1>
                                            <p class="lead mb-0 fs-5">“No fructifica la educación si no es continua y constante.” José
                                                Martí.</p>
                                        </div>
                                    </div>
                                </div>

                            </div>                          

                            <!-- Reports -->
                            <div class="col-12">
                                <div class="card">

                                    <div class="filter">
                                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
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
                                        <h5 class="card-title">Acciones por Entidades<span>/Today</span></h5>

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


                            <div class="col-12">

                            </div>


                            <div class="col-12">

                            </div>

                        </div>
                    </div><!-- End Left side columns -->

                    <!-- Right side columns -->
                    <div class="col-lg-4">                 

                        <!-- Website Traffic -->
                        <div class="card">
                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filtros</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body pb-0">
                                <h5 class="card-title">Acciones por Areas</h5>

                                <div id="trafficChart" style="min-height: 400px;" class="echart"></div>

                                <script>
                                    document.addEventListener("DOMContentLoaded", () => {
                                        echarts.init(document.querySelector("#trafficChart")).setOption({
                                            tooltip: {
                                                trigger: 'item'
                                            },
                                            legend: {
                                                top: '5%',
                                                left: 'center'
                                            },
                                            series: [{
                                                    name: 'Acciones',
                                                    type: 'pie',
                                                    radius: ['40%', '70%'],
                                                    avoidLabelOverlap: false,
                                                    label: {
                                                        show: false,
                                                        position: 'center'
                                                    },
                                                    emphasis: {
                                                        label: {
                                                            show: true,
                                                            fontSize: '18',
                                                            fontWeight: 'bold'
                                                        }
                                                    },
                                                    labelLine: {
                                                        show: false
                                                    },
                                                    data: [{
                                                            value: 1048,
                                                            name: 'Informatica'
                                                        },
                                                        {
                                                            value: 735,
                                                            name: 'Idioma'
                                                        },
                                                        {
                                                            value: 580,
                                                            name: 'Comercial'
                                                        },
                                                        {
                                                            value: 484,
                                                            name: 'Logística'
                                                        },
                                                        {
                                                            value: 100,
                                                            name: 'Recursos Humanos'
                                                        },
                                                        {
                                                            value: 100,
                                                            name: 'Dirección'
                                                        },
                                                        {
                                                            value: 100,
                                                            name: 'Economía'
                                                        },
                                                        {
                                                            value: 100,
                                                            name: 'Defensa'
                                                        },
                                                        {
                                                            value: 100,
                                                            name: 'Otros'
                                                        }
                                                    ]
                                                }]
                                        });
                                    });
                                </script>

                            </div>
                        </div><!-- End Website Traffic -->

                        <!-- News & Updates Traffic -->
                        <div class="card">
                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" href="#">Today</a></li>
                                    <li><a class="dropdown-item" href="#">This Month</a></li>
                                    <li><a class="dropdown-item" href="#">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body pb-0">
                                <h5 class="card-title">Sitios Afines</h5>

                                <div class="row">
                                    <div class="col-sm-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="http://capacitacion.cimex.com.cu/aulavirtual/">Aula
                                                    Virtual CCC</a>
                                            </li>
                                            <li><a href="http://capacitacion.cimex.com.cu:8080/gescap/">Gescap</a>
                                            </li>
                                            <li><a href="http://recursoshumanos.cimex.com.cu/">RRHH</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-sm-6">
                                        <ul class="list-unstyled mb-0">
                                            <li><a href="http://www.cimex.com.cu/main/">Intranet Cimex</a>
                                            </li>
                                            <li><a
                                                    href="https://cimexevaluacion.cimex.com.cu/login_evaluacion/">Talhu</a>
                                            </li>
                                            <li><a href="https://www.gacetaoficial.gob.cu/es">Gaceta Oficial
                                                    de Cuba</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div><!-- End News & Updates -->

                    </div><!-- End Right side columns -->

                </div>
            </section>

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright 2022 &copy Centro Cimex de Capacitación,
                        <strong>Cimex</strong>
                    </div>

                    <!--Redes Sociales-->
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com/profile.php?id=100075958596586"
                           aria-label="Facebook"><i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="btn btn-dark btn-social mx-2" href="https://twitter.com/CentroCimex" aria-label="Twitter"><i
                                class="fab fa-twitter"></i>
                        </a>
                        <a class="btn btn-dark btn-social mx-2" href="https://www.instagram.com/centro_cimex_cap/" aria-label="Instagram"><i
                                class="fab fa-instagram"></i>
                        </a>
                    </div>
                </div>
            </div>
        </footer><!-- End Footer -->        

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="./js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.umd.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.min.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>
