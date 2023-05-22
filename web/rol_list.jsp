<%-- Document : rol_list Created on : May 26, 2022, 10:33:58 AM Author : davidam --%>

<%@page import="Modelo.Usuario" %>
<%@page import="ModeloBean.UsuarioBean" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List" %>
<%@page import="Modelo.Persona" %>
<%@page import="ModeloBean.PersonaBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <%@ include file="header.jspf" %>
        <title>GesCap Rol Listar</title>
    </head>

    <body id="page-top">   
        <%@ include file="login.jspf" %>         
        <jsp:include page="navbar.jsp">
            <jsp:param name="user" value="<%=user%>" />  
        </jsp:include>

        <main id="main" class="main">

            <div class="container my-4">
                <div class="row">
                    <div class="col-sm-12 col-md-8 col-lg-8 col-xl-8">
                        <h2 class="centrado">Usuarios</h2>

                        <table class="table table-striped" id="example">
                            <thead>
                                <tr>
                                    <th>Username</th>
                                    <th>Nombre</th>
                                    <th>Entidad</th>
                                    <th>Rol</th>
                                    <th>Inscripción</th>
                                    <th>Última Entrada</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <%

                                UsuarioBean dao = new UsuarioBean();
                                List<Usuario> list
                                        = dao.listar();


                            %>
                            <tbody>
                                <%                                    for (int i = 0; i < list.size(); i++) {

                                        Usuario per = list.get(i);
                                %>
                                <tr>
                                    <td>
                                        <%= per.getUsername()%>
                                    </td>
                                    <td>
                                        <%= per.getNombre()%>
                                    </td>
                                    <td>
                                        <%= per.getEntidad()%>
                                    </td>
                                    <td>
                                        <%= per.getRol()%>
                                    </td>
                                    <td>
                                        <%= per.getAdmission_date()%>
                                    </td>
                                    <td>
                                        <%= per.getLast_date()%>
                                    </td>
                                    <td class="text-center">
                                        <a class="btn btn-warning"
                                           href="Controlador?accion=urol_edit&id=<%= per.getUsername()%>">Editar</a>
                                        <a class="btn btn-danger"
                                           href="Controlador?accion=urol_delete&id=<%= per.getUsername()%>">Borrar</a>
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

        <script>
            $(document).ready(function () {
                $('#example').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        'copy', 'excel', 'pdf'
                    ]
                });
            });


        </script>
    </body>

</html>