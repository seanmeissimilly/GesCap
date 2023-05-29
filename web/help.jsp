<%-- 
    Document   : help
    Created on : 29 may 2023, 14:04:31
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
        <title>GesCap Ayuda</title>
    </head>
    <body id="page-top">
        <%@ include file="login.jspf" %>       

        <jsp:include page="navbar.jsp">
            <jsp:param name="user" value="<%=user%>" />  
        </jsp:include>
        <main id="main" class="main">


            <div class="container my-4">
                <div class="row">
                    <div class="col-4">
                        <h2>Ayuda</h2>
                    </div>
                </div> 
            </div>
        </main>
        <%@ include file="footer.jspf" %>
    </body>
</html>
