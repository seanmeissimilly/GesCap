<%-- Document : organizacion_list Created on : 9 abr 2022, 9:07:11 Author : David Sean --%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.Conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Organizacion"%>
<%@page import="java.util.List"%>
<%@page import="ModeloBean.OrganizacionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="David Sean Meissimilly">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="icon" href="./img/Logo_CCC.jpg" type="image/jpg" sizes="32x32">
        <script src="./js/fontawesome-all.js"></script>       
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">         
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">        
        <link href="assets/css/style.css" rel="stylesheet">
        <title>GesCap Organizaciones</title>
    </head>

    <body id="page-top">
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
            </div><!-- End Logo -->

            <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">
                    <li class="nav-item dropdown pe-3">
                        <!-- Para que el usuario logueado salgo en la navbar -->
                        <%
                            String user = sesion.getAttribute("user").toString();

                        %>
                        <a class="nav-link nav-profile d-flex align-items-center pe-0"  data-bs-toggle="dropdown">                            
                            <span class="d-none d-md-block dropdown-toggle ps-2"><%=user%></span>
                        </a><!-- End Profile Iamge Icon -->

                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                            <li class="dropdown-header">
                                <h6><%=user%></h6>                                
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
                                    <span>¿Necesitas Ayuda ?</span>
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
                            <a href="entidad_list.jsp">
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
                    <a class="nav-link collapsed" href="login.jsp">
                        <i class="bi bi-box-arrow-in-right"></i>
                        <span>Entrada</span>
                    </a>
                </li><!-- End Login Page Nav -->





            </ul>

        </aside><!-- End Sidebar-->

        <main id="main" class="main">
            <div class="container my-4">
                <div class="row">
                    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <h2>Formulario de Organizaciones</h2>
                        <form action="Controlador">
                            <div class="mb-3">
                                <label for="numero_organizacion" class="form-label">Número de la
                                    Organización</label>
                                    <%
                                        OrganizacionBean orgcont = new OrganizacionBean();
                                        int min = orgcont.contregistros() + 1;
                                    %>                                   
                                <input type="number" class="form-control" id="numero_organizacion"
                                       placeholder="Numero de la Organización" name="txtnumero_organizacion" min="<%= min%>" max="100">
                            </div>
                            <div class="mb-3">
                                <label for="nombre_organizacion" class="form-label">Nombre de la
                                    Organización</label>
                                <input type="text" class="form-control" id="nombre_organizacion"
                                       placeholder="Nombre de la Organización" name="txtnombre_organizacion">
                            </div>
                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="add_organizacion">Agregar</button>

                            </div>
                        </form>
                    </div>
                    <div class="col-sm-12 col-md-8 col-lg-8 col-xl-8">
                        <h2 class="centrado">Listado de Organizaciones</h2>
                        <div id="search">
                            <form class="col-4" action="" method="get">
                                <input type="text" class="form-control" placeholder="Buscar" name="q">
                            </form>
                        </div>
                        <table class="table table-striped">
                            <thead>
                                <tr>                                    
                                    <th>Nombre</th>
                                </tr>
                            </thead>
                            <%
                                OrganizacionBean dao = new OrganizacionBean();
                                List<Organizacion> list = dao.listar();
                                String query = request.getParameter("q");
                                if (query != null) {
                                    list = dao.listar(query);
                                }
                                Iterator<Organizacion> iter = list.iterator();
                                Organizacion org = null;
                                while (iter.hasNext()) {
                                    org = iter.next();


                            %>
                            <tbody>
                                <tr>                                    
                                    <td><%= org.getNombre()%></td>
                                    <td class="text-center">
                                        <a class="btn btn-warning"
                                           href="Controlador?accion=organizacion_edit&id=<%= org.getNumero()%>">Editar</a>                                    
                                        <a class="btn btn-danger"
                                           href="Controlador?accion=organizacion_delete&numero=<%= org.getNumero()%>">Remover</a>                                           
                                    </td>
                                </tr>
                                <%}%>                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="footer py-4">
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
        </footer>
        
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