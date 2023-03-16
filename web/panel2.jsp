<%-- Document : panel Created on : 8 abr 2022, 18:38:37 Author : David Sean --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="David Sean Meissimilly">

        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="icon" href="./img/Logo_CCC.jpg" type="image/jpg" sizes="32x32">       
        <script src="./js/fontawesome-all.js"></script>
        <link href="./css/styles.css" rel="stylesheet" />

        <title>GesCap Panel</title>

    </head>

    <body id="page-top">
        <!-- Reviso si ya se ha logueado -->
        <% HttpSession sesion = request.getSession();
                if (sesion.getAttribute("login") == null
                        || sesion.getAttribute("login").equals("0")) {
                    response.sendRedirect("login.jsp");
                }%>


        <!-- Barra de navegacion -->
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
            <div class="container-fluid">
                <a class="navbar-brand" href="panel.jsp">GesCap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard.jsp">Entradas</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Reportes
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">                                     
                                <li><a class="dropdown-item" href="reporte_accion_1.jsp">Plan de Curso</a></li>
                                <li><a class="dropdown-item" href="reporte_accion_2.jsp">Listar Acciones</a></li>                                        
                            </ul>
                        </li>

                    </ul>
                    <form class="form-inline" action="logout.jsp">
                        <a><i class="fa fa-user-circle" aria-hidden="true"></i>
                            <!-- Para que el usuario logueado salgo en la navbar -->
                            <%
                                String user = sesion.getAttribute("user").toString();

                            %>
                            <%=user%>
                        </a>
                        <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" name="salir"
                                type="submit">Salir</button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- Encabezado-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder fs-2">GesCap - Centro Cimex de Capacitación</h1>
                    <p class="lead mb-0 fs-5">“No fructifica la educación si no es continua y constante.” José
                        Martí.</p>
                </div>
            </div>
        </header>
        <main>
            <!-- Inicio-->
            <section class="page-section bg-light" id="start">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="card mb-4">

                                <div class="card-body">
                                    <h2 class="card-title">¿Qué es el Gescap?</h2>
                                    <p class="card-text">El GesCap es una aplicación para gestionar la
                                        capacitación en la corporación Cimex. </p>

                                </div>
                            </div>
                        </div>
                        <!-- Side widgets-->
                        <div class="col-lg-4">
                            <!-- Categories widget-->
                            <div class="card mb-4">
                                <div class="card-header">Sitios Afines</div>
                                <div class="card-body">
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
                                                        href="https://cimexevaluacion.cimex.com.cu/login_evaluacion/">Talu</a>
                                                </li>
                                                <li><a href="https://www.gacetaoficial.gob.cu/es">Gaceta Oficial
                                                        de Cuba</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright 2022 &copy Centro Cimex de Capacitación,
                        <strong>Cimex</strong>
                    </div>
                </div>
<div class="row align-items-center">
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
        </footer>
        <script src="./js/bootstrap.bundle.min.js"></script>

    </body>

</html>