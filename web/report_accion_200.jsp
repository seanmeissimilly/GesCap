<%-- 
    Document   : accionp
    Created on : Oct 5, 2022, 9:53:34 PM
    Author     : davidam
--%>
<%@page import="net.sf.jasperreports.view.JasperViewer.viewReport
(...)"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="Config.Conexion"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /*recibo los parametros*/
    String fecha_inicial = request.getParameter("fechainicial_accion");
    String fecha_final = request.getParameter("fechafinal_accion");
    String entidadejecutora = request.getParameter("entidad_accion");
    String entidad = request.getParameter("entidad_p");

    /*Parametros para realizar la conexión*/
    Conexion cn = new Conexion();
    Connection conexion = cn.getConnection();

    /* Enviamos parámetros*/
    Map parameters = new HashMap();
    parameters.put("fecha_inicial", fecha_inicial.toString());
    parameters.put("fecha_final", fecha_final.toString());
    parameters.put("entj", entidadejecutora.toString());
    parameters.put("ent", entidad.toString());

    /*Establecemos la ruta del reporte*/
    JasperReport reporte = JasperCompileManager.compileReport(application.getRealPath("Reportes/report_accion_list.jrxml"));
    JasperPrint mostareporte = JasperFillManager.fillReport(reporte, parameters, conexion);

    JasperViewer.viewReport(mostareporte);
    conexion.close();    
    response.sendRedirect("reporte_accion_2.jsp");
%>
