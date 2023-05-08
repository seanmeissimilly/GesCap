<%-- 
    Document   : organizacion_list
    Created on : 8 may 2023, 13:37:56
    Author     : davidam
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Organizacion"%>
<%@page import="java.util.List"%>
<%@page import="ModeloBean.OrganizacionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <jsp:include page="header.jsp"></jsp:include>  
            <title>GesCap Organizaciones</title>
        </head>
        <body id="page-top">
        <jsp:include page="navbar.jsp"></jsp:include>

            <main id="main" class="main">
                <div class="container my-4">
                    <div class="row">
                        <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                            <h2>Organizaciones</h2>
                            <form action="Controlador">                            
                                <div class="mb-3">
                                    <label for="nombre_organizacion" class="form-label">Nombre de la
                                        Organización</label>
                                    <input type="text" class="form-control" id="nombre_organizacion"
                                           placeholder="Nombre de la Organización" name="txtnombre_organizacion" required="required">
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
                                Organizacion org;
                            %>
                            <tbody>
                                <%                                    
                                 for (int i = 0; i < list.size(); i++) {
                                        org = list.get(i);
                                %>
                                <tr>                                    
                                    <td><%= org.getNombre()%></td>
                                    <td class="text-center">
                                        <a class="btn btn-warning"
                                           href="Controlador?accion=organizacion_edit&id=<%= org.getNumero()%>">Editar</a>                                    
                                        <a class="btn btn-danger"
                                           href="Controlador?accion=organizacion_delete&numero=<%= org.getNumero()%>">Borrar</a>                                           
                                    </td>
                                </tr>   
                                <%
                                    }
                                %>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>

        </main>

        <!-- ======= Footer ======= -->
<footer id="footer" class="footer">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-4 text-lg-start">Copyright 2023 &copy Centro Cimex de Capacitación,
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
