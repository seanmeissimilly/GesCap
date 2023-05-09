<%-- Document : listar Created on : Apr 5, 2022, 2:39:33 PM Author : davidam --%>
<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.util.Iterator" %>
<%@page import="Modelo.Persona" %>
<%@page import="java.util.List" %>
<%@page import="ModeloBean.PersonaBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <%@ include file="header.jspf" %>
        <title>GesCap Personas</title>
    </head>

     <body id="page-top">
        <jsp:include page="navbar.jsp"></jsp:include> 

        <main id="main" class="main">
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
                                           href="Controlador?accion=persona_delete&ci=<%= per.getCi()%>">Borrar</a>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>            
        </main>

        <%@ include file="footer.jspf" %>
    </body>

</html>