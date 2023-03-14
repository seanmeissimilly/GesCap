<%-- Document : organizacion_list Created on : 9 abr 2022, 9:07:11 Author : David Sean --%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Config.Conexion"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Organizacion"%>
<%@page import="java.util.List"%>
<%@page import="ModeloBean.OrganizacionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
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
        <title>GesCap Organizaciones</title>
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
                    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <h2>Formulario de Organizaciones</h2>
                        <form action="Controlador">
                            <div class="mb-3">
                                <label for="numero_organizacion" class="form-label">Número de la
                                    Organización</label>
                                    <%
                                        OrganizacionBean orgcont = new OrganizacionBean();
                                        int min = orgcont.contregistros() + 1;
                                    %>                                   
                                <input type="number" class="form-control" id="numero_organizacion"
                                       placeholder="Numero de la Organización" name="txtnumero_organizacion" min="<%= min%>" max="100">
                            </div>
                            <div class="mb-3">
                                <label for="nombre_organizacion" class="form-label">Nombre de la
                                    Organización</label>
                                <input type="text" class="form-control" id="nombre_organizacion"
                                       placeholder="Nombre de la Organización" name="txtnombre_organizacion">
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
                                Iterator<Organizacion> iter = list.iterator();
                                Organizacion org = null;
                                while (iter.hasNext()) {
                                    org = iter.next();


                            %>
                            <tbody>
                                <tr>                                    
                                    <td><%= org.getNombre()%></td>
                                    <td class="text-center">
                                        <a class="btn btn-warning"
                                           href="Controlador?accion=organizacion_edit&id=<%= org.getNumero()%>">Editar</a>                                    
                                        <a class="btn btn-danger"
                                           href="Controlador?accion=organizacion_delete&numero=<%= org.getNumero()%>">Remover</a>                                           
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