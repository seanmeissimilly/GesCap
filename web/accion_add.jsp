<%--
    Document   : accion_add
    Created on : May 30, 2022, 12:42:23 PM
    Author     : davidam
--%>

<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Accion"%>
<%@page import="ModeloBean.AccionBean"%>
<%@page import="Modelo.Organizacion"%>
<%@page import="ModeloBean.OrganizacionBean"%>
<%@page import="Modelo.EntidadEject"%>
<%@page import="ModeloBean.EntidadEjectBean"%>
<%@page import="Modelo.Evaluacion"%>
<%@page import="ModeloBean.EvaluacionBean"%>
<%@page import="ModeloBean.ModalidadBean"%>
<%@page import="Modelo.Modalidad"%>
<%@page import="ModeloBean.EntidadBean"%>
<%@page import="Modelo.Entidad"%>
<%@page import="ModeloBean.AreaBean"%>
<%@page import="Modelo.Area"%>
<%@page import="Modelo.Situacion"%>
<%@page import="ModeloBean.SituacionBean"%>
<%@page import="Modelo.Organizativa"%>
<%@page import="ModeloBean.ForganizativaBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Clasificacion"%>
<%@page import="ModeloBean.ClasificacionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <title>GesCap Acciones Addicionar</title>
    </head>
    <body id="page-top">
        <!-- Reviso si ya se ha logueado -->
        <% HttpSession sesion = request.getSession();
            if (sesion.getAttribute("login") == null
                    || sesion.getAttribute("login").equals("0")) {
                response.sendRedirect("login.jsp");
            }

            //recibo el parametro para saber cual pagina mostrar
            int spageid;
            if (request.getParameter("page") == null) {
                spageid = 1;
            } else {
                spageid = Integer.parseInt(request.getParameter("page"));
            }

        %>


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
                        <%                            //Busco en la base de datos el usuario.  
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
            <div class="container my-4">
                <div class="row">
                    <div class="col-4">
                        <h2>Acciones</h2>
                        <form name="form_accion" action="Controlador" onsubmit='return validar()'>
                            <div class="mb-3">
                                <label for="nombre_accion" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="nombre_accion"
                                       placeholder="Nombre de la Acción" name="nombre_accion" required="required">
                            </div>
                            <div class="mb-3">
                                <label for="descripcion_accion" class="form-label">Descripción</label>                                                             
                                <textarea class="form-control" name="descripcion_accion" rows="4" placeholder="Descripción de la Acción"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="fechainicial_accion" class="form-label">Fecha Inicial</label>
                                <input type="date" class="form-control" id="fechainicial_accion"
                                       name="fechainicial_accion" required="required">
                            </div>
                            <div class="mb-3">
                                <label for="fechafinal_accion" class="form-label">Fecha Final</label>
                                <input type="date" class="form-control" id="fechafinal_accion"
                                       name="fechafinal_accion" required="required">
                            </div>
                            <div class="mb-3">
                                <label for="clasificacion_accion" class="form-label">Clasificación</label>
                                <select class="form-control" name="clasificacion_accion" id="clasificacion_accion">
                                    <%
                                        ClasificacionBean organizaciones = new ClasificacionBean();
                                        List<Clasificacion> lista = organizaciones.listar();
                                        Iterator<Clasificacion> x = lista.iterator();
                                        Clasificacion org = null;
                                        while (x.hasNext()) {
                                            org = x.next();

                                    %> 
                                    <option value="<%= org.getNumero()%>"><%= org.getNombre()%></option>
                                    <%}%> 
                                </select>                               
                            </div>
                            <div class="mb-3">
                                <label for="forganizativa_accion" class="form-label">Forma Organizativa</label>
                                <select class="form-control" name="forganizativa_accion" id="forganizativa_accion">
                                    <%
                                        ForganizativaBean forganizativa = new ForganizativaBean();
                                        List<Organizativa> listafo = forganizativa.listar();

                                        Organizativa formaorg = null;
                                        for (int i = 0; i < listafo.size(); i++) {
                                            formaorg = listafo.get(i);


                                    %> 
                                    <option value="<%= formaorg.getNumero()%>"><%= formaorg.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>                            
                            <div class="mb-3">
                                <label for="area_accion" class="form-label">Área del Conocimiento</label>
                                <select class="form-control" name="area_accion" id="area_accion">
                                    <%
                                        AreaBean areabean = new AreaBean();
                                        List<Area> listarea = areabean.listar();

                                        Area area = null;
                                        for (int i = 0; i < listarea.size(); i++) {
                                            area = listarea.get(i);


                                    %> 
                                    <option value="<%= area.getNumero()%>"><%= area.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>
                            <div class="mb-3">
                                <label for="entidad_accion" class="form-label">Entidad Ejecutora</label>
                                <select class="form-control" name="entidad_accion" id="entidad_accion">
                                    <%
                                        EntidadEjectBean daoentidadejec = new EntidadEjectBean();
                                        List<EntidadEject> listentidad = daoentidadejec.listar();

                                        EntidadEject entidad = null;
                                        for (int i = 0; i < listentidad.size(); i++) {
                                            entidad = listentidad.get(i);

                                    %> 
                                    <option value="<%= entidad.getid_entidad()%>"><%= entidad.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>
                            <div class="mb-3">
                                <label for="entidad_p" class="form-label">Entidad</label>
                                <select class="form-control" name="entidad_p" id="entidad_p">
                                    <%
                                        EntidadBean daoentidad = new EntidadBean();
                                        List<Entidad> listent = daoentidad.listar();

                                        Entidad entp = null;
                                        for (int i = 0; i < listent.size(); i++) {
                                            entp = listent.get(i);

                                    %> 
                                    <option value="<%= entp.getid_entidad()%>"><%= entp.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>
                            <div class="mb-3">
                                <label for="modalidad_accion" class="form-label">Modalidad</label>
                                <select class="form-control" name="modalidad_accion" id="modalidad_accion">
                                    <%
                                        ModalidadBean modalidadbean = new ModalidadBean();
                                        List<Modalidad> listmodalidad = modalidadbean.listar();

                                        Modalidad modalidad = null;
                                        for (int i = 0; i < listmodalidad.size(); i++) {
                                            modalidad = listmodalidad.get(i);


                                    %> 
                                    <option value="<%= modalidad.getNumero()%>"><%= modalidad.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>                          

                            <div class="mb-3">
                                <label for="extraplan_accion" class="form-check-label">Extraplan</label>
                                <input type="checkbox" class="form-check" name="extrapla_accion"                                      name="masiva_accion_accion">
                            </div>
                            <div class="mb-3">
                                <label for="creditos_accion" class="form-label">Créditos</label>
                                <input type="number" class="form-control" id="creditos_accion"
                                       min="0" max="1000" name="creditos_accion">
                            </div>
                            <div class="mb-3">
                                <label for="evaluacion_accion" class="form-label">Evaluación</label>
                                <select class="form-control" name="evaluacion_accion" id="evaluacion_accion">
                                    <%
                                        EvaluacionBean evaluacionbean = new EvaluacionBean();
                                        List<Evaluacion> listevaluacion = evaluacionbean.listar();

                                        Evaluacion evaluacion = null;
                                        for (int i = 0; i < listevaluacion.size(); i++) {
                                            evaluacion = listevaluacion.get(i);


                                    %> 
                                    <option value="<%= evaluacion.getNumero()%>"><%= evaluacion.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>
                            <div class="mb-3">
                                <label for="observaciones_accion">Observaciones</label>
                                <textarea class="form-control" name="observaciones_accion" rows="4" placeholder="Sus observaciones"></textarea>
                            </div>

                            <input type="hidden" name="page" value=<%=spageid%>>
                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="add_accion">Agregar</button>
                            </div>
                        </form>

                    </div>
                    <div class="col-8">
                        <h2 class="centrado">Listado de Acciones</h2>
                        <div id="search">
                            <form class="col-4" action="" method="get">
                                <input type="text" class="form-control" placeholder="Buscar" name="q">
                            </form>
                        </div>
                        <table class="table table-striped text-center">
                            <thead>
                                <tr>                                    
                                    <th>Nombre</th>
                                    <th>Inicial</th>
                                    <th>Final</th>
                                    <th>Clasificación</th>
                                    <th>Forma Organizativa</th>
                                    <th>Área</th>
                                    <th>Entidad Ejecutora</th>
                                    <th>Modalidad</th>                                                                      
                                </tr>
                            </thead>
                            <%
                                //cantidad de registros por pagina
                                int cantidad = 8;

                                AccionBean dao = new AccionBean();
                                List<Accion> list = dao.listar();
                                String query = request.getParameter("q");
                                if (query != null) {
                                    list = dao.listar(query);
                                }

                                //Calculo la cantidad de paginas mostrando cantidad registros
                                int contpage = list.size() / cantidad;
                                if (list.size() % cantidad != 0) {
                                    contpage += 1;
                                }

                                int tope = 0;
                                if (spageid != 1) {
                                    tope = cantidad * (spageid - 1);
                                }

                                for (int i = 0; (i < list.size() && i < cantidad * spageid); i++) {
                                    if (i < tope) {
                                        continue;
                                    }

                                    Accion accion = null;;
                                    accion = list.get(i);%>
                            <tbody>
                                <tr>                                    
                                    <td>
                                        <%= accion.getNombre()%>
                                    </td>
                                    <td>
                                        <%= accion.getFecha_inicial()%>
                                    </td>
                                    <td>
                                        <%= accion.getFecha_final()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_clasificacion()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_formaorganizativa()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_area()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_entidadejecutora()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_modalidad()%>
                                    </td>                                    
                                    <td class="text-center">
                                        <a class="btn btn-warning my-1"
                                           href="Controlador?accion=accion_edit&id=<%= accion.getId_accion()%>&page=<%=spageid%>">Editar</a>
                                        <a class="btn btn-danger" onclick="alerta()"
                                           href="Controlador?accion=accion_delete&id=<%= accion.getId_accion()%>&page=<%=spageid%>">Borrar</a>                                        
                                    </td>
                                </tr>
                                <%}%> 
                            </tbody>
                        </table>

                        <nav aria-label="...">
                            <ul class="pagination pagination-lg">
                                
                                <%
                                    //para generar los numeros de paginas.
                                    for (int i = 0; i < contpage; i++) {

                                %>
                                <li class="page-item"><a class="page-link" href="Controlador?accion=accion_page&page=<%=(i + 1)%>"><%=i + 1%></a></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </nav>


                    </div>
                </div>
            </div>
        </main>
        <!-- Footer -->
        <footer  id="footer" class="footer">
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
