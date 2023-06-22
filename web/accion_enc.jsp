<%-- 
    Document   : accion_enc
    Created on : 21 jun 2023, 19:45:22
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
        <title>GesCap</title>
    </head>
    <body id="page-top">
        <%@ include file="login.jspf" %>       

        <jsp:include page="navbar.jsp">
            <jsp:param name="user" value="<%=user%>" />  
        </jsp:include>

        <!-- Busco el usuario en la base de datos para saber si puede acceer a esta pagina -->
        <%
            //Busco en la base de datos el usuario.                  
            Usuario userapp = new UsuarioBean().list(user);

            //reviso si el usuario tiene un rol diferente de admin o editor.
            if (userapp.getRol().equals("1")) {
                response.sendRedirect("./dashboard");
            }
        %>

        <main id="main" class="main">
            <%
                AccionBean accion = new AccionBean();
                String id = ((String) request.getAttribute("id"));

                List<Accion> ss = accion.list(id);
                Accion p = ss.get(0);

            %>           

            <form action="Controlador">
                <div class="container text-end">
                    <div class="row"> 
                        <div class="col-4">
                            <div class="mb-2">
                                <label>ID :</label>
                                <input class="form-control-sm" type="text" name="number_accion"
                                       value="<%= p.getId_accion()%>" id="number_accion" disabled><br>
                                <label>Nombre :</label>
                                <input class="form-control-sm" type="text" name="nombre_accion"
                                       value="<%= p.getNombre()%>" id="nombre_accion" disabled><br>                               

                            </div>                            
                        </div>
                    </div>
                    <div class="row">                   
                        <div class="col">
                            <div>
                                <label for="resultados" class="form-label">Trabajadores Real</label> 
                            </div>
                            <div class="mb-1">  
                                <label>Técnicos:</label>
                                <input type="number" class="form-control-sm" id="num6" min="0" placeholder="Técnicos"><br>

                                <label>Servicios:</label>
                                <input type="number" class="form-control-sm" id="num7" min="0" placeholder="Servicios"><br>

                                <label>Operarios:</label>
                                <input type="number" class="form-control-sm" id="num8" min="0" placeholder="Operarios"><br>

                                <label>Administrativos:</label>
                                <input type="number" class="form-control-sm" id="num9" min="0" placeholder="Administrativos"><br>

                                <label>Total:</label>
                                <input type="number" class="form-control-sm" id="num10" min="0" placeholder="Total" disabled><br>
                            </div>
                        </div>
                        <div class="col">
                            <div>
                                <label for="resultados" class="form-label">Cuadros Real</label> 
                            </div>
                            <div class="mb-1">  
                                <label>Directivos 1:</label>
                                <input type="number" class="form-control-sm" id="num11" min="0" placeholder="Directivos 1"><br>

                                <label>Directivos 2:</label>
                                <input type="number" class="form-control-sm" id="num12" min="0" placeholder="Directivos 2"><br>

                                <label>Directivos 3:</label>
                                <input type="number" class="form-control-sm" id="num13" min="0" placeholder="Directivos 3"><br>

                                <label>Ejecutivos 1:</label>
                                <input type="number" class="form-control-sm" id="num14" min="0" placeholder="Ejecutivos 1"><br>

                                <label>Ejecutivos 2:</label>
                                <input type="number" class="form-control-sm" id="num15" min="0" placeholder="Ejecutivos 2"><br>

                                <label>Ejecutivos 3:</label>
                                <input type="number" class="form-control-sm" id="num16" min="0" placeholder="Ejecutivos 3"><br>

                                <label>Total :</label>
                                <input type="number" class="form-control-sm" id="num17" min="0" placeholder="Total" disabled><br>
                            </div>
                        </div>  
                        <div class="col">
                            <div>
                                <label for="resultados" class="form-label">Resultados Docentes</label> 
                            </div>
                            <div class="mb-1">     
                                <label>Excelente:</label>
                                <input type="number" class="form-control-sm" id="num1" min="0" placeholder="Excelente"><br>
                                <label>Bien:</label>
                                <input type="number" class="form-control-sm" id="num2" min="0" placeholder="Bien"><br>
                                <label>Regular:</label>
                                <input type="number" class="form-control-sm" id="num3" min="0" placeholder="Regular"><br>
                                <label>Mal:</label>
                                <input type="number" class="form-control-sm" id="num4" min="0" placeholder="Mal"><br>
                                <label>No Evaluados:</label>
                                <input type="number" class="form-control-sm" id="num5" min="0" placeholder="No Evaluados"><br>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-4">
                            <div>
                                <label for="resultados" class="form-label">Trabajadores Plan</label> 
                            </div>
                            <div class="mb-1">  
                                <label>Técnicos:</label>
                                <input type="number" class="form-control-sm" id="num27" min="0" placeholder="Técnicos"><br>

                                <label>Servicios:</label>
                                <input type="number" class="form-control-sm" id="num28" min="0" placeholder="Servicios"><br>

                                <label>Operarios:</label>
                                <input type="number" class="form-control-sm" id="num29" min="0" placeholder="Operarios"><br>

                                <label>Administrativos:</label>
                                <input type="number" class="form-control-sm" id="num30" min="0" placeholder="Administrativos"><br>

                                <label>Total:</label>
                                <input type="number" class="form-control-sm" id="num31" min="0" placeholder="Total"disabled><br>
                            </div>
                        </div>
                        <div class="col-4">
                            <div>
                                <label for="resultados" class="form-label">Cuadros Plan</label> 
                            </div>
                            <div class="mb-1">  
                                <label>Directivos 1:</label>
                                <input type="number" class="form-control-sm" id="num18" min="0" placeholder="Directivos 1"><br>

                                <label>Directivos 2:</label>
                                <input type="number" class="form-control-sm" id="num19" min="0" placeholder="Directivos 2"><br>

                                <label>Directivos 3:</label>
                                <input type="number" class="form-control-sm" id="num20" min="0" placeholder="Directivos 3"><br>

                                <label>Ejecutivos 1:</label>
                                <input type="number" class="form-control-sm" id="num21" min="0" placeholder="Ejecutivos 1"><br>

                                <label>Ejecutivos 2:</label>
                                <input type="number" class="form-control-sm" id="num22" min="0" placeholder="Ejecutivos 2"><br>

                                <label>Ejecutivos 3:</label>
                                <input type="number" class="form-control-sm" id="num23" min="0" placeholder="Ejecutivos 3"><br>

                                <label>Total :</label>
                                <input type="number" class="form-control-sm" id="num24" min="0" placeholder="Total" disabled><br>
                            </div>
                        </div>
                        <div class="col-4">
                            <div>
                                <label for="resultados" class="form-label">Total Participantes C + T</label> 
                            </div>
                            <div class="mb-1"> 

                                <label>Total Plan:</label>
                                <input type="number" class="form-control-sm" id="num25" min="0" placeholder="Total Plan" disabled><br>
                                <label>Total Real:</label>
                                <input type="number" class="form-control-sm" id="num26" min="0" placeholder="Total Real" disabled><br>
                            </div>
                        </div>
                    </div>    
                </div>
                <input type="hidden" name="user" value=<%=user%>>

                <div class="row"> 
                    <div class="col-2">
                        <div class="d-grid gap-2 mb-1">
                            <button class="btn btn-secondary" type="button" onclick="calcular()">Calcular</button>
                        </div>
                        <div class="d-grid gap-2 mb-1">
                            <button class="btn btn-success" type="submit" name="accion" value="edit_enc">Guardar</button>
                        </div>

                    </div>
                </div>

            </form>

        </main>
        <script src="js/encuesta.js" type="text/javascript"></script>
        <%@ include file="footer.jspf" %>
    </body>
</html>
