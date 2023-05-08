<%-- Document : edit Created on : Apr 5, 2022, 2:39:33 PM Author : davidam --%>
<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Persona" %>
<%@page import="ModeloBean.PersonaBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <jsp:include page="header.jsp"></jsp:include>  
        <title>GesCap Editar Persona</title>
    </head>

    <body id="page-top">
       <jsp:include page="navbar.jsp"></jsp:include>

        <main id="main" class="main">
            <div class="container my-4">
                <div class="row">
                    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <h4>Modificar Persona</h4>
                        <form action="Controlador">
                            <% PersonaBean dao = new PersonaBean();
                                String id = ((String) request.getAttribute("ci"));
                                Persona p = (Persona) dao.list(id);%>
                            <div class="mb-3">
                                <label for="Cinew" class="form-label">CI</label> 
                                <input class="form-control" type="text" name="txtCinuevo"
                                       value="<%= p.getCi()%>" id="Cinew">
                            </div>
                            <div class="mb-3">
                                <label for="nombrenew" class="form-label">Nombre</label>
                                <input class="form-control" type="text" name="txtNombre"
                                       value="<%= p.getNombre()%>" id="nombrenew">
                            </div>
                            <div class="mb-3">
                                <label for="primer_apellidonew" class="form-label">Primer Apellido</label> 
                                <input class="form-control" type="text" name="txtPrimerApellido"
                                       value="<%= p.getPrimerApellido()%>" id="primer_apellidonew">
                            </div>
                            <div class="mb-3">
                                <label for="segundo_apellidonew" class="form-label">Segundo Apellido</label>
                                <input class="form-control" type="text" name="txtSegundoApellido"
                                       value="<%= p.getSegundoApellido()%>" id="segundo_apellidonew">
                            </div>
                            <div class="mb-3">
                                <!-- Para pasar el numero de carnet antiguo -->
                                <input type="hidden" name="txtCi" value="<%= p.getCi()%>">
                            </div>

                            <div class="d-grid gap-2">
                                <input class="btn btn-success" type="submit" name="accion"
                                       value="Actualizar">
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