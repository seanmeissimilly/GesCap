<%-- 
    Document   : 404
    Created on : 14 jun 2022, 17:25:04
    Author     : David Sean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="David Sean Meissimilly">

        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="icon" href="./img/Logo_CCC.jpg" type="image/jpg" sizes="32x32">
        <link href="./css/styles.css" rel="stylesheet" />    
        <script src="./js/fontawesome-all.js"></script>
        <title>Prescap 404 Error</title>    
    </head>

    <body>
        <main>
            <section class="page-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4">
                            <div class="text-center mt-4">
                                <img class="mb-4 img-error" src="./img/error-404-monochrome.svg" />
                                <p class="lead">Esta URL solicitada no se encontró en este servidor.</p>
                                <a href="panel.jsp">
                                    <i class="fas fa-arrow-left me-1"></i>
                                    Retornar a Inicio.
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright 2022 &copy Centro Cimex de Capacitación,
                        <strong>CIMEX</strong>                    
                    </div>

                    <!--Redes Sociales-->
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com/search/top?q=centro%20cimex%20de%20capacitaci%C3%B3n"
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

        <!-- Bootstrap core JavaScript-->
        <script src="./js/bootstrap.bundle.min.js"></script>
    </body>

</html>
