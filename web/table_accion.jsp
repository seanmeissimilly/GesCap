<%-- 
    Document   : table_accion
    Created on : 18 may 2023, 9:54:38
    Author     : davidam
--%>

<%@page import="Modelo.Accion"%>
<%@page import="java.util.List"%>
<%@page import="ModeloBean.AccionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

                    for (int i = 0; (i < list.size()); i++) {

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

        </div> 
    </div> 
</div> 
