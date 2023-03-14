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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="David Sean Meissimilly">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="icon" href="./img/Logo_CCC.jpg" type="image/jpg" sizes="32x32">
        <link href="./css/styles.css" rel="stylesheet" />
        <script src="./js/fontawesome-all.js"></script>
        <title>GesCap Rol Addicionar</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("login") == null || sesion.getAttribute("login").equals("0")) {
                response.sendRedirect("login.jsp");
            }

        %>

        <header> 
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
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
                    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <h4>Modificar Rol-Usuario</h4>
                        <form action="Controlador">
                            <% UsuarioBean dao = new UsuarioBean();
                                String id = ((String) request.getAttribute("id"));
                                Usuario p = dao.list(id);%>                                
                            
                            <div class="mb-3">
                                <label for="username" class="form-label">Nombre de Usuario</label>
                                <input class="form-control" type="text" name="txtusername"
                                       value="<%= p.getUsername()%>" id="username" disabled="true">
                            </div>                            
                            <div class="mb-3">
                                <label for="area_accion" class="form-label">Roles</label>
                                <select class="form-control" name="area_accion" id="area_accion">
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
                                    <option value="<%= rol.getId() %>" <%=marcado%>><%= rol.getDescripcion() %></option>
                                    <%}%>
                                </select>
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
