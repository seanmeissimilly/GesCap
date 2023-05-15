<%-- 
    Document   : accion_list
    Created on : 15 may 2023, 10:22:27
    Author     : davidam
--%>

<%@page import="Modelo.Entidad"%>
<%@page import="ModeloBean.EntidadBean"%>
<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Evaluacion"%>
<%@page import="ModeloBean.EvaluacionBean"%>
<%@page import="ModeloBean.EvaluacionBean"%>
<%@page import="Modelo.EntidadEject"%>
<%@page import="ModeloBean.EntidadEjectBean"%>
<%@page import="Modelo.Area"%>
<%@page import="ModeloBean.AreaBean"%>
<%@page import="Modelo.Organizativa"%>
<%@page import="ModeloBean.ForganizativaBean"%>
<%@page import="Modelo.Modalidad"%>
<%@page import="ModeloBean.ModalidadBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Clasificacion"%>
<%@page import="java.util.List"%>
<%@page import="ModeloBean.ClasificacionBean"%>
<%@page import="Modelo.Accion"%>
<%@page import="ModeloBean.AccionBean"%>
<%@page import="Modelo.Persona" %>
<%@page import="ModeloBean.PersonaBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%@ include file="header.jspf" %>
        <title>GesCap Listar Acción</title>
    </head>
    <body id="page-top">
        <%@ include file="login.jspf" %> 
        <%             //recibo el parametro para saber cual pagina mostrar
            int spageid;
            if (request.getParameter("page") == null) {
                spageid = 1;
            } else {
                spageid = Integer.parseInt(request.getParameter("page"));
            }
        %>


        <jsp:include page="navbar.jsp">
            <jsp:param name="user" value="<%=user%>" />  
        </jsp:include>
        <main id="main" class="main">
            <div class="container my-4">
                <div class="row">
                    <div class="col-12">
                        <h2 class="centrado">Listado de Acciones</h2>
                        <div id="search">
                            <form class="col-4" action="" method="get">
                                <input type="text" class="form-control" placeholder="Buscar" name="q">
                            </form>
                        </div>
                        <table class="table table-striped text-center">
                            <thead>
                                <tr>  
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Inicial</th>
                                    <th>Final</th>
                                    <th>Clasificación</th>
                                    <th>Forma Organizativa</th>
                                    <th>Área</th>
                                    <th>Entidad</th>
                                    <th>Entidad Ejecutora</th>                                    
                                    <th>Modalidad</th>
                                    <th>Masiva</th>
                                    <th>Exterior</th>
                                    <th>Planificada</th>                                    
                                </tr>
                            </thead>
                            <%
                                //cantidad de registros por pagina
                                int cantidad = 8;

                                AccionBean dao = new AccionBean();
                                List<Accion> list = dao.listar();
                                String query = request.getParameter("q");
                                if (query != null) {
                                    list = dao.listar(query);
                                }

                                //Calculo la cantidad de paginas mostrando cantidad registros
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

                                    Accion accion = null;;
                                    accion = list.get(i);%>
                            <tbody>
                                <tr> 
                                    <td>
                                        <%= accion.getId_accion()%>
                                    </td>
                                    <td>
                                        <%= accion.getNombre()%>
                                    </td>
                                    <td>
                                        <%= accion.getFecha_inicial()%>
                                    </td>
                                    <td>
                                        <%= accion.getFecha_final()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_clasificacion()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_formaorganizativa()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_area()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_entidad()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_entidadejecutora()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_modalidad()%>
                                    </td>   
                                    <td>
                                        <%= accion.isMasiva()%>
                                    </td> 
                                    <td>
                                        <%= accion.isExterior()%>
                                    </td> 
                                    <td>
                                        <%= accion.isExtraplan()%>
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
                                <li class="page-item"><a class="page-link" href="Controlador?accion=accion_page_list&page=<%=(i + 1)%>"><%=i + 1%></a></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </nav>
                    </div> 
                </div> 
            </div> 
        </main>
        <%@ include file="footer.jspf" %>
    </body>
</html>
