<%-- Document : edit Created on : Apr 5, 2022, 2:39:33 PM Author : davidam --%>
<%@page import="Modelo.Persona" %>
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
        <title>GesCap Editar Persona</title>
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
                                <a class="nav-link" href="persona_list.jsp">Personas</a>
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