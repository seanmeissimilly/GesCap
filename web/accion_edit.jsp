<%--
    Document   : accion_edit
    Created on : Oct 5, 2022, 11:57:58 PM
    Author     : davidam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Evaluacion"%>
<%@page import="ModeloBean.EvaluacionBean"%>
<%@page import="ModeloBean.EvaluacionBean"%>
<%@page import="Modelo.EntidadEject"%>
<%@page import="ModeloBean.EntidadEjectBean"%>
<%@page import="Modelo.Area"%>
<%@page import="ModeloBean.AreaBean"%>
<%@page import="Modelo.Organizativa"%>
<%@page import="ModeloBean.ForganizativaBean"%>
<%@page import="Modelo.Modalidad"%>
<%@page import="ModeloBean.ModalidadBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Clasificacion"%>
<%@page import="java.util.List"%>
<%@page import="ModeloBean.ClasificacionBean"%>
<%@page import="Modelo.Accion"%>
<%@page import="ModeloBean.AccionBean"%>
<%@page import="Modelo.Persona" %>
<%@page import="ModeloBean.PersonaBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="David Sean Meissimilly">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="icon" href="./img/Logo_CCC.jpg" type="image/jpg" sizes="32x32">
        <link href="./css/styles.css" rel="stylesheet" />
        <script src="./js/fontawesome-all.js"></script>
        <title>GesCap Editar Acción</title>
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
                            <li class="nav-item">
                                <a class="nav-link" href="accion_add.jsp">Acciones</a>
                            </li>
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
                    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <h4>Modificar Acción</h4>
                        <form action="Controlador">
                            <%
                                AccionBean accion = new AccionBean();
                                String id = ((String) request.getAttribute("id"));
                                List<Accion> ss = accion.list(id);
                                Accion p = ss.get(0);

                            %>
                            <div>

                                <input class="form-control" type="text" name="number_accion"
                                       value="<%= p.getId_accion()%>" id="number_accion" hidden="true">
                            </div>
                            <div class="mb-3">
                                <label for="nombre_accion" class="form-label">Nombre</label>
                                <input class="form-control" type="text" name="nombre_accion"
                                       value="<%= p.getNombre()%>" id="nombre_accion">
                            </div>
                            <div class="mb-3">
                                <label for="descripcion_accion" class="form-label">Descripción</label>
                                <textarea class="form-control" name="descripcion_accion" rows="4" ><%= p.getFicha()%></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="fechainicial_accion" class="form-label">Fecha Inicial</label>
                                <input type="date" class="form-control" id="fechainicial_accion"
                                       name="fechainicial_accion" required="required" value="<%= p.getFecha_inicial()%>">
                            </div>
                            <div class="mb-3">
                                <label for="fechafinal_accion" class="form-label">Fecha Final</label>
                                <input type="date" class="form-control" id="fechafinal_accion"
                                       name="fechafinal_accion" required="required" value="<%= p.getFecha_final()%>">
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
                                            String marcado = "";
                                            if (p.getId_clasificacion().equals(org.getNombre()))
                                                marcado = "selected";
                                    %>
                                    <option value="<%= org.getNumero()%>" <%=marcado%>><%= org.getNombre()%></option>
                                    <% }
                                    %>
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
                                            String marcado = "";
                                            if (p.getId_formaorganizativa().equals(formaorg.getNombre())) {
                                                marcado = "selected";
                                            }

                                    %>
                                    <option value="<%= formaorg.getNumero()%>" <%=marcado%> ><%= formaorg.getNombre()%></option>
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
                                            String marcado = "";
                                            if (p.getId_area().equals(area.getNombre())) {
                                                marcado = "selected";
                                            }

                                    %>
                                    <option value="<%= area.getNumero()%>" <%=marcado%>><%= area.getNombre()%></option>
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
                                            String marcado = "";
                                            if (p.getId_entidadejecutora().equals(entidad.getNombre())) {
                                                marcado = "selected";
                                            }

                                    %>
                                    <option value="<%= entidad.getid_entidad()%>"<%=marcado%>><%= entidad.getNombre()%></option>
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
                                            String marcado = "";
                                            if (p.getId_modalidad().equals(modalidad.getNombre())) {
                                                marcado = "selected";
                                            }

                                    %>
                                    <option value="<%= modalidad.getNumero()%>"<%=marcado%>><%= modalidad.getNombre()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <%
                                //Para marcar la casilla de extraplan.
                                String marked = "";
                                if (p.getExtraplan())
                                    marked = "checked";
                            %>
                            <div class="mb-3">
                                <label for="extraplan_accion" class="form-check-label">Extraplan</label>
                                <input type="checkbox" class="form-check" name="extrapla_accion" name="masiva_accion_accion" <%=marked%>>
                                <%
                                    marked = "";
                                %>
                            </div>
                            <div class="mb-3">
                                <label for="creditos_accion" class="form-label">Créditos</label>
                                <input type="number" class="form-control" id="creditos_accion"
                                       min="0" max="1000" name="creditos_accion" value="<%=p.getCreditos()%>">
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
String marcado = "";
                                            if (p.getId_evaluacionfinal().equals(evaluacion.getNombre())) {
                                                marcado = "selected";
                                            }

                                    %>
                                    <option value="<%= evaluacion.getNumero()%>"<%=marcado%>><%= evaluacion.getNombre()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="observaciones_accion">Observaciones</label>
                                <textarea class="form-control" name="observaciones_accion" rows="4"><%= p.getObservaciones()%></textarea>
                            </div>

                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="edit_accion">Actualizar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright 2022 &copy Centro Cimex de Capacitación,
                        <strong>CIMEX</strong>
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
    </body>

</html>
