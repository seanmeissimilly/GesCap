<%-- Document : listar Created on : Apr 5, 2022, 2:39:33 PM Author : davidam --%>
<%@page import="java.util.Iterator" %>
<%@page import="Modelo.Persona" %>
<%@page import="java.util.List" %>
<%@page import="ModeloBean.PersonaBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <title>GesCap Personas</title>
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
                    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <h2>Formulario de Personas</h2>
                        <form action="Controlador" method="get">
                            <div class="mb-3">                           
                                <label for="ci" class="form-label">CI</label>
                                <input class="form-control" type="text" name="txtCi" placeholder="Carnet de Identidad" id="ci">                                
                            </div>
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre</label>                          
                                <input class="form-control" type="text" name="txtNombre" placeholder="Nombre" id="nombre">
                            </div>
                            <div class="mb-3">
                                <label for="primer_apellido" class="form-label">Primer Apellido</label>  
                                <input class="form-control" type="text" name="txtPrimerApellido" placeholder="Primer Apellido" id="primer_apellido">
                            </div>
                            <div class="mb-3">
                                <label for="segundo_apellido" class="form-label">Segundo Apellido</label>                           
                                <input class="form-control" type="text" name="txtSegundoApellido" placeholder="Segundo Apellido" id="segundo_apellido">
                            </div>
                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="add_person">Agregar</button>                      
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-12 col-md-8 col-lg-8 col-xl-8">
                        <h2 class="centrado">Listado de Personas</h2>
                        <div id="search">
                            <form class="col-4" action="" method="get">
                                <input type="text" class="form-control" placeholder="Buscar" name="q">
                            </form>
                        </div>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>CI</th>
                                    <th>Nombre</th>
                                    <th>Primer Apellido</th>
                                    <th>Segundo Apellido</th>
                                </tr>
                            </thead>
                            <% PersonaBean dao = new PersonaBean();
                                List<Persona> list = dao.listar();
                                String query = request.getParameter("q");
                                if (query != null) {
                                    list = dao.listar(query);
                                }
                                Iterator<Persona> iter = list.iterator();
                                Persona per = null;
                                while (iter.hasNext()) {
                                    per = iter.next();

                            %>
                            <tbody>
                                <tr>
                                    <td>
                                        <%= per.getCi()%>
                                    </td>
                                    <td>
                                        <%= per.getNombre()%>
                                    </td>
                                    <td>
                                        <%= per.getPrimerApellido()%>
                                    </td>
                                    <td>
                                        <%= per.getSegundoApellido()%>
                                    </td>
                                    <td class="text-center">
                                        <a class="btn btn-warning"
                                           href="Controlador?accion=persona_edit&ci=<%= per.getCi()%>">Editar</a>
                                        <a class="btn btn-danger"
                                           href="Controlador?accion=persona_delete&ci=<%= per.getCi()%>">Remover</a>
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