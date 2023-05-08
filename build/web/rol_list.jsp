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
        <jsp:include page="header.jsp"></jsp:include> 
            <title>GesCap Rol Listar</title>
        </head>

        <body id="page-top">    
        <%
            //recibo el parametro para saber cual pagina mostrar
            int spageid;
            if (request.getParameter("page") == null) {
                spageid = 1;
            } else {
                spageid = Integer.parseInt(request.getParameter("page"));
            }
        %>
        <jsp:include page="navbar.jsp"></jsp:include> 

            <main id="main" class="main">

                <div class="container my-4">
                    <div class="row">
                        <div class="col-sm-12 col-md-8 col-lg-8 col-xl-8">
                            <h2 class="centrado">Usuarios</h2>
                            <div id="search">
                                <form class="col-4" action="" method="get">
                                    <input type="text" class="form-control"
                                           placeholder="Buscar" name="q">
                                </form>
                            </div>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Nombre</th>
                                        <th>Entidad</th>
                                        <th>Rol</th>
                                        <th>Inscripción</th>
                                        <th>Última Entrada</th>

                                    </tr>
                                </thead>
                            <% //cantidad de registros por pagina
                                int cantidad = 8;

                                UsuarioBean dao = new UsuarioBean();
                                List<Usuario> list
                                        = dao.listar();
                                String query = request.getParameter("q");
                                if (query != null) {
                                    list = dao.listar(query);
                                }

                                //Calculo la cantidad de paginas mostrando 15 registros
                                int contpage = list.size() / cantidad;
                                if (list.size() % cantidad != 0) {
                                    contpage += 1;
                                }

                                int tope = 0;
                                if (spageid != 1) {
                                    tope = cantidad * (spageid - 1);
                                }

                                for (int i = 0; (i < list.size() && i < cantidad * spageid); i++) {
                                    if (i < tope) {
                                        continue;
                                    }

                                    Usuario per = null;
                                    per = list.get(i);

                            %>
                            <tbody>
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
                                           href="Controlador?accion=urol_edit&id=<%= per.getUsername()%>&page=<%=spageid%>">Editar</a>
                                        <a class="btn btn-danger"
                                           href="Controlador?accion=urol_delete&id=<%= per.getUsername()%>&page=<%=spageid%>">Borrar</a>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <nav aria-label="...">
                            <ul class="pagination pagination-lg">

                                <%
                                    //para generar los numeros de paginas.
                                    for (int i = 0; i < contpage; i++) {

                                %>
                                <li class="page-item"><a class="page-link" href="Controlador?accion=rol_page&page=<%=(i + 1)%>"><%=i + 1%></a></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>