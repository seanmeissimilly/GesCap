<%-- Document : dashboard Created on : 16 mar 2023, 10:56:33 Author : davidam
--%>
<%@page import="ModeloBean.AccionBean"%>
<%@page import="Modelo.Accion"%>
<%@page import="ModeloBean.EncReaccionBean"%>
<%@page import="Modelo.EncReaccion"%>
<%@page import="org.javatuples.Pair"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloBean.AreaBean"%>
<%@page import="ModeloBean.UsuarioBean" %>
<%@page import="Modelo.Usuario"%> 
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<html lang="es">

    <head>
        <%@ include file="header.jspf" %>
        <title>GesCap Tablero</title>
        <script src="js/Chart.js v2.9.4.js" type="text/javascript"></script>
    </head>

    <body>   

        <%@ include file="login.jspf" %>        
        <jsp:include page="navbar.jsp">
            <jsp:param name="user" value="<%=user%>" />  
        </jsp:include>

        <main id="main" class="main">
            <section class="section dashboard">
                <div class="row">                   
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="container">
                                        <div class="text-center my-5">
                                            <h1 class="fw-bolder fs-2">
                                                GesCap - Centro Cimex de Capacitación
                                            </h1>
                                            <p class="lead mb-0 fs-5">
                                                “No fructifica la educación si no es continua y
                                                constante.” José Martí.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="card">

                                <div class="card-body">
                                    <h5 class="card-title">
                                        Acciones por Entidades


                                    </h5>
                                   

                                    <%
                                        AreaBean rr = new AreaBean();
                                        ArrayList<Pair<String, String>> cantxentidades = rr.contarXentidades("2019-01-01", "2025-01-01");
                                    %>

                                    <canvas id="grafico"></canvas>
                                    <script>
                                        // Obtener el contexto del canvas
                                        var ctx = document.getElementById('grafico').getContext('2d');
                                        // Crear el dataset de los datos
                                        var data = {
                                        labels: [
                                        <%                                            for (int i = 0; i < cantxentidades.size(); i++) {

                                        %>
                                        "<%= cantxentidades.get(i).getValue0()%>",
                                        <% } %>
                                        ],
                                                datasets: [{
                                                label: "Cantidad",
                                                        backgroundColor: 'rgba( 106, 218, 196 , 0.7)',
                                                        borderColor: 'rgba( 106, 218, 196 ,1)',
                                                        data: [
                                        <%
                                            for (int i = 0; i < cantxentidades.size(); i++) {%>
                                        <%= cantxentidades.get(i).getValue1()%>,
                                        <% } %>
                                                        ],
                                                }]
                                        };
                                        // Crear las opciones del gráfico
                                        var options = {
                                        responsive: true,
                                                title: {
                                                display: true,
                                                        text: ''
                                                },
                                                tooltips: {
                                                mode: 'index',
                                                        intersect: false
                                                },
                                                hover: {
                                                mode: 'nearest',
                                                        intersect: true
                                                },
                                                scales: {
                                                xAxes: [{
                                                display: true,
                                                        scaleLabel: {
                                                        display: true,
                                                                labelString: 'Entidades'
                                                        }
                                                }],
                                                        yAxes: [{
                                                        display: true,
                                                                scaleLabel: {
                                                                display: true,
                                                                        labelString: 'Cantidad'
                                                                },
                                                                ticks: {
                                                                beginAtZero: true
                                                                }
                                                        }]
                                                }
                                        };
                                        // Crear el gráfico de barras
                                        var chart = new Chart(ctx, {
                                        type: 'bar',
                                                data: data,
                                                options: options
                                        });
                                    </script>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body pb-0 col-4">
                        <h5 class="card-title">Sitios Afines</h5>

                        <div class="row">
                            <div class="col-sm-6">
                                <ul class="list-unstyled mb-0">
                                    <li>
                                        <a href="http://capacitacion.cimex.com.cu/aulavirtual/"
                                           >Aula Virtual CCC</a
                                        >
                                    </li>
                                    <li>
                                        <a href="http://capacitacion.cimex.com.cu:8080/gescap/"
                                           >Gescap</a
                                        >
                                    </li>
                                    <li>
                                        <a href="http://recursoshumanos.cimex.com.cu/">RRHH</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-sm-6">
                                <ul class="list-unstyled mb-0">
                                    <li>
                                        <a href="http://www.cimex.com.cu/main/">Intranet Cimex</a>
                                    </li>
                                    <li>
                                        <a
                                            href="https://cimexevaluacion.cimex.com.cu/login_evaluacion/"
                                            >Talhu</a
                                        >
                                    </li>
                                    <li>
                                        <a href="https://www.gacetaoficial.gob.cu/es"
                                           >Gaceta Oficial de Cuba</a
                                        >
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Acciones por Áreas</h5>

                            <div class="mb-1">
                                <label for="fechainicial_accion" class="form-label-sm">Fecha Inicial</label>
                                <input type="date" class="form-control-sm" id="fechainicial_accion"
                                       name="fechainicial_accion" value="2019-01-01">
                            </div>
                            <div class="mb-1">
                                <label for="fechafinal_accion" class="form-label-sm">Fecha Final</label>
                                <input type="date" class="form-control-sm" id="fechafinal_accion"
                                       name="fechafinal_accion" value="2025-01-01">
                            </div>
                            <%                                rr = new AreaBean();
                                ArrayList<Pair<String, String>> tt = rr.contarXareas("2019-01-01", "2025-01-01");


                            %>
                            <!-- Doughnut Chart -->
                            <canvas id="doughnutChart" style="max-height: 400px;"></canvas>
                            <script>
                                document.addEventListener("DOMContentLoaded", () => {
                                new Chart(document.querySelector('#doughnutChart'), {
                                type: 'doughnut',
                                        data: {
                                        labels: [
                                <%                                                //Recorro la lista hasta el penultimo valor.
                                    for (int i = 0; i < tt.size() - 1; i++) {

                                %>
                                        '<%=tt.get(i).getValue0()%>',
                                <%                                                }
                                %>

                                        '<%=(tt.size() > 0) ? tt.get(tt.size() - 1).getValue0() : 0%>'
                                        ],
                                                datasets: [{
                                                label: 'Cantidad',
                                                        data: [
                                <%                                                //Recorro la lista hasta el penultimo valor.
                                    for (int i = 0; i < tt.size() - 1; i++) {

                                %>
                                <%=tt.get(i).getValue1()%>,
                                <%                                                }
                                %>
                                <%=(tt.size() > 0) ? tt.get(tt.size() - 1).getValue1() : 0%>

                                                        ],
                                                        backgroundColor: [
                                                                'rgb(128, 128, 0)',
                                                                'rgb(0, 255, 0)',
                                                                'rgb(0, 255, 255)',
                                                                'rgb(0, 128, 128)',
                                                                'rgb(0, 0, 255)',
                                                                'rgb(0, 0, 128)',
                                                                'rgb(255, 0, 255)',
                                                                'rgb(128, 0, 128)'
                                                        ],
                                                        hoverOffset: 4
                                                }]
                                        }
                                });
                                }
                                );
                            </script>
                            <!-- End Doughnut CHart -->

                        </div>
                    </div>

                </div>

            </section>


        </main>

        <%@ include file="footer.jspf" %>
    </body>
</html>
