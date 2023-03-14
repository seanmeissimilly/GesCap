<%--
    Document   : accion_add
    Created on : May 30, 2022, 12:42:23 PM
    Author     : davidam
--%>

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
        <link href="./css/styles.css" rel="stylesheet" />
        <script src="./js/fontawesome-all.js"></script>
        <title>GesCap Acciones Addicionar</title>
    </head>
    <body>
        <% HttpSession sesion = request.getSession();
            if (sesion.getAttribute("login") == null
                    || sesion.getAttribute("login").equals("0")) {
                response.sendRedirect("login.jsp");
            }%>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="panel.jsp">GesCap</a>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                        </ul>
                        <form class="form-inline" action="logout.jsp">
                            <a><i class="fa fa-user-circle" aria-hidden="true"></i>
                                <%=sesion.getAttribute("user")%>
                            </a>
                            <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" name="salir"
                                    type="submit">Salir</button>
                        </form>
                    </div>
                </div>
            </nav>
        </header>
        <main>   
            <div class="container my-4">
                <div class="row">
                    <div class="col-4">
                        <h2>Formulario de Acciones</h2>
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
                                AccionBean dao = new AccionBean();
                                List<Accion> list = dao.listar();
                                String query = request.getParameter("q");
                                if (query != null) {
                                    list = dao.listar(query);
                                }
                                Iterator<Accion> iter = list.iterator();
                                Accion accion = null;
                                while (iter.hasNext()) {
                                    accion = iter.next();

                            %>
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
                                           href="Controlador?accion=accion_edit&id=<%= accion.getId_accion()%>">Editar</a>
                                        <a class="btn btn-danger" onclick="alerta()"
                                           href="Controlador?accion=accion_delete&id=<%= accion.getId_accion()%>">Borrar</a>                                        
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
                        <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com/search/top?q=centro%20cimex%20de%20capacitaci%C3%B3n"
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
        <script>
                                            function alerta()
                                            {
                                                var mensaje;
                                                var opcion = confirm("Seguro que desea eliminar el registro");
                                                if (opcion == true) {
                                                    mensaje = "Has clickado OK";
                                                } else {
                                                    mensaje = "Has clickado Cancelar";
                                                }
                                                document.getElementById("ejemplo").innerHTML = mensaje;
                                            }
        </script>
    </body>
</html>
