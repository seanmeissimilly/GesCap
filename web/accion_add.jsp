<%--
    Document   : accion_add
    Created on : May 30, 2022, 12:42:23 PM
    Author     : davidam
--%>

<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Accion"%>
<%@page import="ModeloBean.AccionBean"%>
<%@page import="Modelo.Organizacion"%>
<%@page import="ModeloBean.OrganizacionBean"%>
<%@page import="Modelo.EntidadEject"%>
<%@page import="ModeloBean.EntidadEjectBean"%>
<%@page import="Modelo.Evaluacion"%>
<%@page import="ModeloBean.EvaluacionBean"%>
<%@page import="ModeloBean.ModalidadBean"%>
<%@page import="Modelo.Modalidad"%>
<%@page import="ModeloBean.EntidadBean"%>
<%@page import="Modelo.Entidad"%>
<%@page import="ModeloBean.AreaBean"%>
<%@page import="Modelo.Area"%>
<%@page import="Modelo.Situacion"%>
<%@page import="ModeloBean.SituacionBean"%>
<%@page import="Modelo.Organizativa"%>
<%@page import="ModeloBean.ForganizativaBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Clasificacion"%>
<%@page import="ModeloBean.ClasificacionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      

        <%@ include file="header.jspf" %>
        <title>GesCap Acciones Addicionar</title>
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
        <%@ include file="login.jspf" %> 
        <jsp:include page="navbar.jsp">
            <jsp:param name="user" value="<%=user%>" />  
        </jsp:include> 


        <main id="main" class="main">
            <div class="container my-4">
                <div class="row">
                    <div class="col-4">
                        <h2>Acciones</h2>
                        <form name="form_accion" action="Controlador" onsubmit='return validar()'>
                            <div class="mb-3">
                                <label for="nombre_accion" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="nombre_accion"
                                       placeholder="Nombre de la Acción" name="nombre_accion" required="required">
                            </div>
                            <div class="mb-3">
                                <label for="descripcion_accion" class="form-label">Descripción</label>                                                             
                                <textarea class="form-control" name="descripcion_accion" rows="4" placeholder="Descripción de la Acción"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="fechainicial_accion" class="form-label">Fecha Inicial</label>
                                <input type="date" class="form-control" id="fechainicial_accion"
                                       name="fechainicial_accion" required="required">
                            </div>
                            <div class="mb-3">
                                <label for="fechafinal_accion" class="form-label">Fecha Final</label>
                                <input type="date" class="form-control" id="fechafinal_accion"
                                       name="fechafinal_accion" required="required">
                            </div>
                            <div class="mb-3">
                                <label for="clasificacion_accion" class="form-label">Clasificación</label>
                                <select class="form-control" name="clasificacion_accion" id="clasificacion_accion">
                                    <%                                        ClasificacionBean organizaciones = new ClasificacionBean();
                                        List<Clasificacion> lista = organizaciones.listar();
                                        Iterator<Clasificacion> x = lista.iterator();
                                        Clasificacion org = null;
                                        while (x.hasNext()) {
                                            org = x.next();

                                    %> 
                                    <option value="<%= org.getNumero()%>"><%= org.getNombre()%></option>
                                    <%}%> 
                                </select>                               
                            </div>
                            <div class="mb-3">
                                <label for="forganizativa_accion" class="form-label">Forma Organizativa</label>
                                <select class="form-control" name="forganizativa_accion" id="forganizativa_accion">
                                    <%
                                        ForganizativaBean forganizativa = new ForganizativaBean();
                                        List<Organizativa> listafo = forganizativa.listar();

                                        Organizativa formaorg = null;
                                        for (int i = 0; i < listafo.size(); i++) {
                                            formaorg = listafo.get(i);


                                    %> 
                                    <option value="<%= formaorg.getNumero()%>"><%= formaorg.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>                            
                            <div class="mb-3">
                                <label for="area_accion" class="form-label">Área del Conocimiento</label>
                                <select class="form-control" name="area_accion" id="area_accion">
                                    <%
                                        AreaBean areabean = new AreaBean();
                                        List<Area> listarea = areabean.listar();

                                        Area area = null;
                                        for (int i = 0; i < listarea.size(); i++) {
                                            area = listarea.get(i);


                                    %> 
                                    <option value="<%= area.getNumero()%>"><%= area.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>
                            <div class="mb-3">
                                <label for="entidad_accion" class="form-label">Entidad Ejecutora</label>
                                <select class="form-control" name="entidad_accion" id="entidad_accion">
                                    <%
                                        EntidadEjectBean daoentidadejec = new EntidadEjectBean();
                                        List<EntidadEject> listentidad = daoentidadejec.listar();

                                        EntidadEject entidad = null;
                                        for (int i = 0; i < listentidad.size(); i++) {
                                            entidad = listentidad.get(i);

                                    %> 
                                    <option value="<%= entidad.getid_entidad()%>"><%= entidad.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>
                            <div class="mb-3">
                                <label for="entidad_p" class="form-label">Entidad</label>
                                <select class="form-control" name="entidad_p" id="entidad_p">
                                    <%
                                        EntidadBean daoentidad = new EntidadBean();
                                        List<Entidad> listent = daoentidad.listar();

                                        Entidad entp = null;
                                        for (int i = 0; i < listent.size(); i++) {
                                            entp = listent.get(i);

                                    %> 
                                    <option value="<%= entp.getid_entidad()%>"><%= entp.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>
                            <div class="mb-3">
                                <label for="modalidad_accion" class="form-label">Modalidad</label>
                                <select class="form-control" name="modalidad_accion" id="modalidad_accion">
                                    <%
                                        ModalidadBean modalidadbean = new ModalidadBean();
                                        List<Modalidad> listmodalidad = modalidadbean.listar();

                                        Modalidad modalidad = null;
                                        for (int i = 0; i < listmodalidad.size(); i++) {
                                            modalidad = listmodalidad.get(i);


                                    %> 
                                    <option value="<%= modalidad.getNumero()%>"><%= modalidad.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>                          

                            <div class="mb-3">
                                <label for="extraplan_accion" class="form-check-label">Extraplan</label>
                                <input type="checkbox" class="form-check" name="extrapla_accion"                                      name="masiva_accion_accion">
                            </div>
                            <div class="mb-3">
                                <label for="creditos_accion" class="form-label">Créditos</label>
                                <input type="number" class="form-control" id="creditos_accion"
                                       min="0" max="1000" name="creditos_accion">
                            </div>
                            <div class="mb-3">
                                <label for="evaluacion_accion" class="form-label">Evaluación</label>
                                <select class="form-control" name="evaluacion_accion" id="evaluacion_accion">
                                    <%
                                        EvaluacionBean evaluacionbean = new EvaluacionBean();
                                        List<Evaluacion> listevaluacion = evaluacionbean.listar();

                                        Evaluacion evaluacion = null;
                                        for (int i = 0; i < listevaluacion.size(); i++) {
                                            evaluacion = listevaluacion.get(i);


                                    %> 
                                    <option value="<%= evaluacion.getNumero()%>"><%= evaluacion.getNombre()%></option>
                                    <%}%>                                     
                                </select>                               
                            </div>
                            <div class="mb-3">
                                <label for="observaciones_accion">Observaciones</label>
                                <textarea class="form-control" name="observaciones_accion" rows="4" placeholder="Sus observaciones"></textarea>
                            </div>

                            <input type="hidden" name="page" value=<%=spageid%>>
                            
                            <input type="hidden" name="user" value=<%=user%>>
                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="add_accion">Agregar</button>
                            </div>
                        </form>

                    </div>
                    <div class="col-4">
                        <h2 class="centrado">Listado de Acciones</h2>
                        <div id="search">
                            <form class="col-8" action="" method="get">
                                <input type="text" class="form-control" placeholder="Buscar" name="q">
                            </form>
                        </div>
                        <table class="table table-striped text-center">
                            <thead>
                                <tr>                                    
                                    <th>Nombre</th>
                                    <th>Inicial</th>
                                    <th>Final</th>
                                    <th>Clasificación</th>
                                    <th>Forma Organizativa</th>
                                    <th>Área</th>
                                    <th>Entidad Ejecutora</th>
                                    <th>Modalidad</th>                                                                      
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
                                        <%= accion.getId_entidadejecutora()%>
                                    </td>
                                    <td>
                                        <%= accion.getId_modalidad()%>
                                    </td>                                    
                                    <td class="text-center">
                                        <a class="btn btn-warning my-1"
                                           href="Controlador?accion=accion_edit&id=<%= accion.getId_accion()%>&page=<%=spageid%>&user=<%=user%>">Editar</a>
                                        <a class="btn btn-danger" onclick="alerta()"
                                           href="Controlador?accion=accion_delete&id=<%= accion.getId_accion()%>&page=<%=spageid%>&user=<%=user%>">Borrar</a>                                        
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
                                <li class="page-item"><a class="page-link" href="Controlador?accion=accion_page&page=<%=(i + 1)%>"><%=i + 1%></a></li>
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
