<%-- 
    Document   : usuario_list
    Created on : 8 abr 2022, 22:38:44
    Author     : David Sean
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Persona"%>
<%@page import="ModeloBean.PersonaBean"%>
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
        <title>GesCap Usuarios</title>        
    </head>
    <body>
        <% HttpSession sesion = request.getSession();
            if (sesion.getAttribute("login") == null
                    || sesion.getAttribute("login").equals("0")) {
                response.sendRedirect("login.jsp");
            }%>

        <header>
            <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="panel.jsp">GesCap</a>                    
                    <form class="form-inline" action="logout.jsp">
                        <a><i class="fa fa-user-circle" aria-hidden="true"></i>
                            <%=sesion.getAttribute("user")%>
                        </a>
                        <button class="btn btn-outline-danger my-2 my-sm-0 ml-2" name="salir"
                                type="submit">Salir</button>
                    </form>
                </div>
            </nav>
        </header>
        <main>
            <div class="container my-4">
                <div class="row">
                     <%-- 
                    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                       
<h2>Formulario de Usuarios</h2>
                        <form action="Controlador" method="get">                            
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre de Usuario</label>                          
                                <input class="form-control" type="text" name="txtusername" placeholder="Nombre de Usuario" id="username">
                            </div>
                            <div class="mb-3">
                                <label for="primer_apellido" class="form-label">Entidad</label>  
                                <input class="form-control" type="text" name="txtPrimerApellido" placeholder="Primer Apellido" id="primer_apellido">
                            </div>
                            <div class="mb-3">
                                <label for="segundo_apellido" class="form-label">Rol</label>                           
                                <input class="form-control" type="text" name="txtSegundoApellido" placeholder="Segundo Apellido" id="segundo_apellido">
                            </div>
                            <div class="mb-3">
                                <label for="segundo_apellido" class="form-label">Fecha Inscripcion</label>                           
                                <input class="form-control" type="text" name="txtSegundoApellido" placeholder="Segundo Apellido" id="segundo_apellido">
                            </div><div class="mb-3">
                                <label for="segundo_apellido" class="form-label">Fecha Entrada</label>                           
                                <input class="form-control" type="text" name="txtSegundoApellido" placeholder="Segundo Apellido" id="segundo_apellido">
                            </div>
                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="add_person">Agregar</button>                      
                            </div>
                        </form> 
                        
                    </div> --%>
                    <div class="col-sm-12 col-md-8 col-lg-8 col-xl-8">
                        <h2 class="centrado">Listado de Usuarios</h2>
                        <div id="search">
                            <form class="col-4" action="" method="get">
                                <input type="text" class="form-control" placeholder="Buscar" name="q">
                            </form>
                        </div>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Nombre de Usuario</th>
                                    <th>Entidad</th>
                                    <th>Rol</th>
                                    <th>Fecha Inscripcion</th>
                                    <th>Fecha Entrada</th>
                                </tr>
                            </thead>
                            <% UsuarioBean dao = new UsuarioBean();
                                List<Usuario> list = dao.listar();
                                String query = request.getParameter("q");
                                if (query != null) {
                                    list = dao.listar(query);
                                }
                                Iterator<Usuario> iter = list.iterator();
                                Usuario user = null;
                                while (iter.hasNext()) {
                                    user = iter.next();

                            %>
                            <tbody>
                                <tr>
                                    <td>
                                        <%= user.getUsername()%>
                                    </td>
                                    <td>
                                        <%= user.getEntidad()%>
                                    </td>
                                    <td>
                                        <%= user.getRol()%>
                                    </td>
                                    <td>
                                        <%= user.getAdmission_date()%>
                                    </td>
                                    <td>
                                        <%= user.getLast_date()%>
                                    </td>
                                    <td class="text-center">
                                        <a class="btn btn-warning"
                                           href="Controlador?accion=usuario_edit&username=<%= user.getUsername()%>">Editar</a>
                                        <a class="btn btn-danger"
                                           href="Controlador?accion=usuario_delete&username=<%= user.getUsername()%>">Remover</a>
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
