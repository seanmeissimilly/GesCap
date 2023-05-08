<%--
    Document   : accion_edit
    Created on : Oct 5, 2022, 11:57:58 PM
    Author     : davidam
--%>

<%@page import="Modelo.Entidad"%>
<%@page import="ModeloBean.EntidadBean"%>
<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
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
        <jsp:include page="header.jsp"></jsp:include> 
        <title>GesCap Editar Acción</title>
    </head>

    <body id="page-top">
        
        <%             //recibo el parametro para saber cual pagina mostrar
            int spageid;
            if (request.getParameter("page") == null) {
                spageid = 1;
            } else {
                spageid = Integer.parseInt(request.getParameter("page"));
            }
        %>


        <jsp:include page="navbar.jsp"></jsp:include> 

        <main id="main" class="main">
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
                                <label for="entidad_p" class="form-label">Entidad</label>
                                <select class="form-control" name="entidad_p" id="entidad_p">
                                    <%
                                        EntidadBean daoentidad = new EntidadBean();
                                        List<Entidad> listent = daoentidad.listar();

                                        Entidad entp = null;
                                        for (int i = 0; i < listent.size(); i++) {
                                            entp = listent.get(i);
                                            String marcado = "";
                                            if (p.getId_entidad().equals(entp.getNombre())) {
                                                marcado = "selected";
                                            }

                                    %>
                                    <option value="<%= entp.getid_entidad()%>"<%=marcado%>><%= entp.getNombre()%></option>
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
                            
                            <input type="hidden" name="page" value=<%=spageid%>>
                            
                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="edit_accion">Actualizar</button>
                            </div>
                        </form>
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