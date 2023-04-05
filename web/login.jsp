<%-- Document : login Created on : Apr 25, 2022, 12:05:23 PM Author : davidam --%>

<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
<%@page import="ModeloBean.LoginBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="David Sean Meissimilly">        
        <title>GesCap</title>
        <script src="./js/fontawesome-all.js"></script>
        <link rel="icon" href="./img/Logo_CCC.jpg" type="image/jpg" sizes="32x32">
        <link rel="stylesheet" href="./css/bootstrap.min.css">

        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

    </head>

    <body>
        <header>

        </header>

        <main>
            <div class="container">

                <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                                <div class="d-flex justify-content-center py-4">
                                    <a href="login.jsp" class="logo d-flex align-items-center w-auto">
                                        <img src="./img/Logo_CCC.jpg" alt="">
                                        <span class="d-none d-lg-block">GesCap</span>
                                    </a>
                                </div><!-- End Logo -->

                                <div class="card mb-3">

                                    <div class="card-body">

                                        <div class="pt-4 pb-2">
                                            <h5 class="card-title text-center pb-0 fs-4">GesCap</h5>
                                            <p class="text-center small">Gestión de la Capacitación</p>
                                        </div>

                                        <form class="row g-3 needs-validation" novalidate action="" method="post">

                                            <div class="col-12">
                                                <label for="user" class="form-label">Usuario</label>
                                                <div class="input-group has-validation">




                                                    <input type="text" name="user" class="form-control"
                                                           aria-describedby="emailHelp" required>
                                                    <div id="userHelp" class="invalid-feedback">Escriba su usuario.</div>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <label for="password" class="form-label">Contraseña</label>
                                                <input type="password" name="password" class="form-control"  required>




                                            </div>

                                            <div class="col-12">

                                                <button type="submit" class="btn btn-primary w-100" name="login"
                                                        value="login">Entrar</button>
                                            </div>                    
                                        </form>

                                    </div>
                                </div>                               

                            </div>
                        </div>
                    </div>

                </section>

            </div>

        </main>
        <jsp:include page="footer.jsp"></jsp:include>  

</body>
<%
    if (request.getParameter("login") != null) {
        String user;
        String clave;
        user = request.getParameter("user");
        clave = request.getParameter("password");
        HttpSession sesion = request.getSession();
        LoginBean login = new LoginBean();
        //lo de administrator es un parche por si el directorio activo esta caido.
        if (user.equals("administrator") || login.authuser(user, clave)) {
            sesion.setAttribute("login", "1");
            sesion.setAttribute("user", user);
            response.sendRedirect("./dashboard");
        } else {
            sesion.setAttribute("login", "0");
        }
    }%>

</html>