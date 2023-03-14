<%-- 
    Document   : entidad_edit
    Created on : 14 jun 2022, 15:50:48
    Author     : David Sean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Organizacion"%>
<%@page import="ModeloBean.OrganizacionBean"%>
<%@page import="ModeloBean.EntidadBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Entidad"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="David Sean Meissimilly">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/interfaz.css">
        <link rel="icon" href="./img/Logo_CCC.jpg" type="image/jpg" sizes="32x32">
        <link href="./css/styles.css" rel="stylesheet" />
        <script src="./js/fontawesome-all.js"></script>
        <title>GesCap Editar Entidad</title>
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
                                <a class="nav-link" href="entidad_list.jsp">Entidades</a>
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
                        <h4>Modificar Entidad</h4>
                        <form action="Controlador">
                            <% EntidadBean dao = new EntidadBean();
                                String id = ((String) request.getAttribute("id_entidad"));
                                Entidad p = (Entidad) dao.list(id).get(0);%>

                            <div class="mb-3">
                                <label for="numero_entidadnew" class="form-label">Número de la
                                    Entidad</label>

                                <input type="number" class="form-control" id="numero_entidadnew"
                                       name="txtnumero_entidadnew" value="<%= p.getid_entidad()%>">

                            </div>
                            <div class="mb-3">
                                <label for="nombre_entidadnew" class="form-label">Nombre de la
                                    Entidad</label>
                                <input type="text" class="form-control" id="nombre_entidadnew"
                                       name="txtnombre_entidadnew" value="<%= p.getNombre()%>">
                            </div> 
                            <div class="mb-3">
                                <label for="prefix_entidadnew" class="form-label">Prefijo de la Entidad</label>
                                <input type="text" class="form-control" id="prefix_entidadnew"
                                        name="prefix_entidadnew" value="<%= p.getPrefix()%>">
                            </div>

                            <div class="mb-3">
                                <!-- Para pasar el numero de organizacion antiguo -->
                                <input type="hidden" name="txtnumero_entidad" value="<%= p.getid_entidad()%>">
                            </div> 

                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="edit_entidad">Actualizar</button>
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
