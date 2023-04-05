<%-- 
    Document   : rol_add
    Created on : May 30, 2022, 8:36:12 AM
    Author     : davidam
--%>

<%@page import="ModeloBean.RolBean"%>
<%@page import="Modelo.Rol"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Persona"%>
<%@page import="ModeloBean.UsuarioBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <jsp:include page="header.jsp"></jsp:include> 
            <title>GesCap Rol Addicionar</title>
        </head>
        <body id="page-top">

        <jsp:include page="navbar.jsp"></jsp:include> 

            <main id="main" class="main">
                <div class="container my-4">
                    <div class="row">
                        <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                            <h4>Modificar Rol-Usuario</h4>
                            <form action="Controlador">
                            <% UsuarioBean dao = new UsuarioBean();
                                String id = ((String) request.getAttribute("id"));
                                Usuario p = dao.list(id);%>                                

                            <div class="mb-3">

                                <input class="form-control" type="hidden" name="txtusername"
                                       value="<%= p.getUsername()%>" id="username">
                            </div>
                            <div class="mb-3">
                                <label for="name" class="form-label">Nombre</label>
                                <input class="form-control" type="text" name="txtname"
                                       value="<%= p.getNombre()%>" id="name" required="required">
                            </div>                            
                            <div class="mb-3">
                                <label for="area_accion" class="form-label">Rol</label>
                                <select class="form-control" name="id_rol" id="id_rol">
                                    <%
                                        RolBean rolbean = new RolBean();
                                        List<Rol> listarol = rolbean.listar();

                                        Rol rol = null;
                                        for (int i = 0; i < listarol.size(); i++) {
                                            rol = listarol.get(i);
                                            String marcado = "";
                                            if (p.getRol().equals(rol.getId())) {
                                                marcado = "selected";
                                            }

                                    %>
                                    <option value="<%= rol.getId()%>" <%=marcado%>><%= rol.getDescripcion()%></option>
                                    <%}%>
                                </select>
                            </div>                       

                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="edit_userapp">Actualizar</button>
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
