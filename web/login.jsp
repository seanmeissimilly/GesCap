<%-- Document : login Created on : Apr 25, 2022, 12:05:23 PM Author : davidam --%>

<%@page import="ModeloBean.LoginBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="David Sean Meissimilly">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <title>GesCap</title>
        <script src="./js/fontawesome-all.js"></script>
        <link rel="icon" href="./img/Logo_CCC.jpg" type="image/jpg" sizes="32x32">
        
    </head>

    <body>
        <header>

        </header>

        <main>
            <div class="col-lg-8 mx-auto p-3 py-md-5">
                <div class="container">
                    <div class="row justify-content-md-center">
                        <div class="card" style="width: 18rem;">
                            <div class="text-center">
                                <!--<img src="./img/prescap.png" class="card-img-top" alt="...">-->
                                <h2>GesCap</h2>
                                <h5>Gestión de la Capacitación</h5>
                            </div>

                            <div class="card-body">
                                <form action="" method="post">
                                    <div class="mb-3">
                                        <label for="user" class="form-label">Usuario</label>
                                        <input type="text" name="user" class="form-control"
                                               aria-describedby="emailHelp" required>
                                        <div id="userHelp" class="form-text">Escriba su Usuario.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="password" class="form-label">Contraseña</label>
                                        <input type="password" name="password" class="form-control" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary" name="login"
                                            value="login">Entrar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </main>
        <!-- Footer -->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright 2022 &copy Centro Cimex de Capacitación,
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
        </footer>
    </div>

    <script src="/js/bootstrap.bundle.min.js"></script>

</body>
<%
    if (request.getParameter("login") != null) {
        String user;
        String clave;
        user = request.getParameter("user");
        clave = request.getParameter("password");
        HttpSession sesion = request.getSession();
        LoginBean login = new LoginBean();
        //lo de admin es un parche por si el directorio activo esta caido.
        if (user.equals("administrator") || login.authuser(user, clave)) {
            sesion.setAttribute("login", "1");
            sesion.setAttribute("user", user);
            response.sendRedirect("panel.jsp");
        } else {
            sesion.setAttribute("login", "0");
        }
    }%>

</html>