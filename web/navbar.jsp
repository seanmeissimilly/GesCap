<%-- 
    Document   : navbar
    Created on : 5 abr 2023, 8:55:30
    Author     : davidam
--%>

<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>

<!-- Reviso si ya se ha logueado -->
<% HttpSession sesion = request.getSession();
    if (sesion.getAttribute("login") == null
            || sesion.getAttribute("login").equals("0")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">
    <div class="d-flex align-items-center justify-content-between">
        <a href="./dashboard" class="logo d-flex align-items-center">        
            <span class="d-none d-lg-block">GesCap</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div>
    <!-- End Logo -->

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">
            <li class="nav-item dropdown pe-3">
                <!-- Para que el usuario logueado salgo en la navbar -->
                <%
                    //Busco en la base de datos el usuario.  
                    Usuario userapp = new UsuarioBean().list(sesion.getAttribute("user").toString());
                %>
                <a class="nav-link nav-profile d-flex align-items-center pe-0"  data-bs-toggle="dropdown">                            
                    <span class="d-none d-md-block dropdown-toggle ps-2"><%=userapp.getNombre()%></span>
                </a><!-- End Profile Iamge Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li class="dropdown-header">
                        <h6><%=userapp.getUsername()%></h6>                        
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="404.jsp">
                            <i class="bi bi-question-circle"></i>
                            <span>┐Necesitas Ayuda?</span>
                        </a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li>
                        <a class="dropdown-item d-flex align-items-center" href="logout.jsp">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Salir</span>
                        </a>
                    </li>

                </ul><!-- End Profile Dropdown Items -->
            </li><!-- End Profile Nav -->
        </ul>                
    </nav>

</header><!-- End Header -->

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="./dashboard">
                <i class="bi bi-grid"></i>
                <span>Tablero</span>
            </a>
        </li><!-- End Dashboard Nav -->


        <%
            //Para llevar el tema de los roles.
            String consultor = "";
            String editor = "";
            if (userapp.getRol().equals("1")) {
                consultor = "hidden";
            } else if (userapp.getRol().equals("2")) {
                editor = "hidden";
            }
        %>
        <li class="nav-item" <%=consultor%>>
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="">
                <i class="bi bi-journal-text"></i><span>Formularios</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="accion_add.jsp">
                        <i class="bi bi-circle"></i><span>Acciones</span>
                    </a>
                </li>
                <li>
                    <a href="persona_list.jsp" <%=editor%>>
                        <i class="bi bi-circle"></i><span>Personas</span>
                    </a>
                </li>
                <li>
                    <a href="entidad_list.jsp?page=1"  <%=editor%>>
                        <i class="bi bi-circle"></i><span>Entidades</span>
                    </a>
                </li>
                <li>
                    <a href="organizacion_list.jsp" <%=editor%>>
                        <i class="bi bi-circle"></i><span>Organizaciones</span>
                    </a>
                </li>                
                <li>
                    <a href="rol_list.jsp" <%=editor%>>
                        <i class="bi bi-circle"></i><span>Usuarios</span>
                    </a>
                </li>
                
                
            </ul>
        </li><!-- End Forms Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-layout-text-window-reverse"></i><span>Reportes</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="reporte_accion_1.jsp">
                        <i class="bi bi-circle"></i><span>Plan Detallado</span>
                    </a>
                </li>
                <li>
                    <a href="reporte_accion_2.jsp">
                        <i class="bi bi-circle"></i><span>Listar Acciones</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Tables Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="404.jsp">
                <i class="bi bi-question-circle"></i>
                <span>┐Necesitas Ayuda?</span>
            </a>
        </li><!-- End F.A.Q Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="login.jsp">
                <i class="bi bi-box-arrow-in-right"></i>
                <span>Entrada</span>
            </a>
        </li><!-- End Login Page Nav -->
    </ul>

</aside><!-- End Sidebar-->
