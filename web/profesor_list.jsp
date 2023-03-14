<%-- 
    Document   : profesor_list.jsp
    Created on : 8 abr 2022, 22:38:06
    Author     : David Sean
--%>

<%@page import="Modelo.Organizacion"%>
<%@page import="ModeloBean.OrganizacionBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Entidad"%>
<%@page import="java.util.List"%>
<%@page import="ModeloBean.EntidadBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="David Sean Meissimilly">
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="icon" href="./img/Logo_CCC.jpg" type="image/jpg" sizes="32x32">
        <link href="./css/styles.css" rel="stylesheet" />
        <script src="./js/fontawesome-all.js"></script>
        <title>GesCap Profesores</title>        
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("login") == null || sesion.getAttribute("login").equals("0")) {
                response.sendRedirect("login.jsp");
            }

        %>

        <header>

            <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="panel.jsp">GesCap</a>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Buscar</button>
                    </form>
                </div>
            </nav>
        </header>

        <main>
            <div class="container my-4">
                <div class="row">
                    <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <h2>Formulario de Entidades</h2>
                        <form action="Controlador">
                            <div class="mb-3">
                                <label for="numero_entidad" class="form-label">Número de la Entidad</label>
                                <%                                    EntidadBean entcont = new EntidadBean();
                                    int min = entcont.contregistros() + 1;
                                %> 
                                <input type="number" class="form-control" id="numero_entidad"
                                       placeholder="Numero de la Entidad" min="<%= min%>" max="1000" name="txtnumero_entidad">
                            </div>
                            <div class="mb-3">
                                <label for="nombre_entidad" class="form-label">Nombre de la Entidad</label>
                                <input type="text" class="form-control" id="nombre_entidad"
                                       placeholder="Nombre de la Entidad" name="txtnombre_entidad">
                            </div>
                            <div class="mb-3">
                                <label for="nombre_organizacion" class="form-label">Organización</label>
                                <select class="form-control" name="txtnumero_organizacion" id="nombre_organizacion">
                                    <%
                                        OrganizacionBean organizaciones = new OrganizacionBean();
                                        List<Organizacion> lista = organizaciones.listar();
                                        Iterator<Organizacion> x = lista.iterator();
                                        Organizacion org = null;
                                        while (x.hasNext()) {
                                            org = x.next();

                                    %> 
                                    <option value="<%= org.getNumero()%>"><%= org.getNombre()%></option>
                                    <%}%> 
                                </select>                               
                            </div>
                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="add_entidad">Agregar</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-12 col-md-8 col-lg-8 col-xl-8">
                        <h2 class="centrado">Listado de Entidades</h2>
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>Numero</th>
                                    <th>Nombre</th>
                                    <th>Organización</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Numero</th>
                                    <th>Nombre</th>
                                    <th>Organización</th>
                                </tr>
                            </tfoot>
                            <%                                EntidadBean dao = new EntidadBean();
                                List<Entidad> list = dao.listar();
                                Iterator<Entidad> iter = list.iterator();
                                Entidad ent = null;
                                while (iter.hasNext()) {
                                    ent = iter.next();


                            %>
                            <tbody>
                                <tr>
                                    <td><%= ent.getid_entidad()%></td>
                                    <td><%= ent.getNombre()%></td>
                                    <td><%= ent.getname_org()%></td>
                                    <td class="text-center">
                                        <a class="btn btn-warning"
                                           href="">Editar</a>                                    
                                        <a class="btn btn-danger"
                                           href="Controlador?accion=entidad_delete&numero=<%= ent.getid_entidad()%>">Remover</a>                                           
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
                        <a class="btn btn-dark btn-social mx-2" href="https://es-la.facebook.com/cimexcuba/"
                           aria-label="Facebook"><i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="btn btn-dark btn-social mx-2" href="404.jsp" aria-label="Twitter"><i
                                class="fab fa-twitter"></i>
                        </a>
                        <a class="btn btn-dark btn-social mx-2" href="404.jsp" aria-label="Youtube"><i
                                class="fab fa-youtube"></i>
                        </a>                    
                    </div>
                </div>
            </div>
        </footer>     
        <script src="js/simple-datatables@latest.js"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
