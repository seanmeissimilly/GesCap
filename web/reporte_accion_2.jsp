<%-- 
    Document   : reporte_accion_2
    Created on : 22 ago 2022, 12:32:53
    Author     : David Sean
--%>

<%@page import="Modelo.EntidadEject"%>
<%@page import="ModeloBean.EntidadEjectBean"%>
<%@page import="java.util.List"%>
<%@page import="ModeloBean.EntidadBean"%>
<%@page import="Modelo.Entidad"%>
<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Config.Conexion"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

    <head>
        <jsp:include page="header.jsp"></jsp:include>  

            <title>GesCap Listar Acciones</title>

        </head>

        <body id="page-top">
        <jsp:include page="navbar.jsp"></jsp:include> 


            <main id="main" class="main">
                <div class="container my-4">
                    <div class="row">
                        <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                            <h2>Listar Acciones</h2>
                            <form name="form_accion" action="report_accion_2.jsp">
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
                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="send_reporteaccionlist">Visualizar Reporte</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
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