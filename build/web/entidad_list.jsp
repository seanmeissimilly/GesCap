<%-- Document : entidad_list Created on : 9 abr 2022, 1:12:44 Author : David Sean --%>

<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Organizacion"%>
<%@page import="ModeloBean.OrganizacionBean"%>
<%@page import="ModeloBean.EntidadBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Entidad"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <jsp:include page="header.jsp"></jsp:include> 
            <title>GesCap Entidades</title>
        </head>

        <body>

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
                        <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4">
                            <h2>Entidades</h2>
                            <form action="Controlador">                           
                                <div class="mb-3">
                                    <label for="nombre_entidad" class="form-label">Nombre de la Entidad</label>
                                    <input type="text" class="form-control" id="nombre_entidad"
                                           placeholder="Nombre de la Entidad" name="txtnombre_entidad" required="required">
                                </div>
                                <div class="mb-3">
                                    <label for="prefix_entidad" class="form-label">Prefijo de la Entidad</label>
                                    <input type="text" class="form-control" id="prefix_entidad"
                                           placeholder="Prefijo de la Entidad" name="txtprefix_entidad" required="required">
                                </div>
                                <div class="mb-3">
                                    <label for="nombre_organizacion" class="form-label">Organización</label>
                                    <select class="form-control" name="txtnumero_organizacion" id="nombre_organizacion">
                                    <%                                        OrganizacionBean organizaciones = new OrganizacionBean();
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
                            <input type="hidden" name="page" value=<%=spageid%>>

                            <div class="d-grid gap-2">
                                <button class="btn btn-success" type="submit" name="accion" value="add_entidad">Agregar</button>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-12 col-md-8 col-lg-8 col-xl-8">
                        <h2 class="centrado">Listado de Entidades</h2>
                        <div id="search">
                            <form class="col-4" action="" method="post">
                                <input type="text" class="form-control" placeholder="Buscar" name="q">
                            </form>
                        </div>
                        <table class="table table-striped">
                            <thead>
                                <tr>                                    
                                    <th>Nombre</th>
                                    <th>Organización</th>
                                    <th>Prefijo</th>
                                </tr>
                            </thead>
                            <%

                                //cantidad de registros por pagina
                                int cantidad = 8;
                                
                                Entidad ent;

                                EntidadBean dao = new EntidadBean();
                                List<Entidad> list = dao.listar();
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
                                    ent = list.get(i);

                            %>
                            <tbody>
                                <tr>                                    
                                    <td><%= ent.getNombre()%></td>
                                    <td><%= ent.getname_org()%></td>
                                    <td><%= ent.getPrefix()%></td>
                                    <td class="text-center">
                                        <a class="btn btn-warning"
                                           href="Controlador?accion=entidad_edit&id_entidad=<%= ent.getid_entidad()%>&page=<%=spageid%>">Editar</a>                                    
                                        <a class="btn btn-danger"
                                           href="Controlador?accion=entidad_delete&numero=<%= ent.getid_entidad()%>&page=<%=spageid%>">Borrar</a>                                           
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
                                <li class="page-item"><a class="page-link" href="Controlador?accion=entidad_page&page=<%=(i + 1)%>"><%=i + 1%></a></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </nav>

                    </div>
                </div>
            </div>
        </main>
                            
        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright 2023 &copy Centro Cimex de Capacitación,
                        <strong>Cimex</strong>
                    </div>

                    <!--Redes Sociales-->
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com/profile.php?id=100075958596586"
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
        </footer><!-- End Footer -->  

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="./js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.umd.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.min.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
       

    </body>

</html>