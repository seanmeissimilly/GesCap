<%-- 
    Document   : dashboard
    Created on : 19 ago 2022, 11:35:34
    Author     : David Sean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
         <%@ include file="header.jspf" %>

        <title>GesCap Entradas</title>
    </head>
    <body>
        <%@ include file="login.jspf" %> 
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

        <main class="py-5">
            <!-- Vertical gutters -->
            <div class="container">
                <div class="text-center my-5">
                    <h3 class="">Formularios</h3>                    
                </div>

                <div class="container overflow-hidden text-center">
                    <div class="row gy-5">
                        <div class="col-3">
                            <div class="p-3 border bg-light">                                
                                <a class="navbar-brand" href="accion_add.jsp">Acciones</a>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="p-3 border bg-light">                                
                                <a class="navbar-brand" href="persona_list.jsp">Personas</a>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="p-3 border bg-light">                                
                                <a class="navbar-brand" href="entidad_list.jsp">Entidades</a>
                            </div>

                        </div>
                        <div class="col-3">
                            <div class="p-3 border bg-light">                                
                                <a class="navbar-brand" href="organizacion_list.jsp">Organizaciones</a>
                            </div>
                        </div>                        
                    </div>
                    <div class="row gy-5 py-4">
                        <div class="col-3">
                            <div class="p-3 border bg-light">                                
                                <a class="navbar-brand" href="404.jsp">Roles</a>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="p-3 border bg-light">                                
                                <a class="navbar-brand" href="rol_list.jsp">Usuarios</a>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="p-3 border bg-light">                                
                                <a class="navbar-brand" href="404.jsp">Cursistas</a>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="p-3 border bg-light">                                
                                <a class="navbar-brand" href="404.jsp">Profesores</a>
                            </div>
                        </div>
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
    </body>
</html>
