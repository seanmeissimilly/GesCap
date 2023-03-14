<%-- Document : add Created on : Apr 5, 2022, 2:39:33 PM Author : davidam --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="icon" href="./img/Logo_CCC.jpg" type="image/jpg" sizes="32x32">
        <link href="./css/styles.css" rel="stylesheet" />
        <script src="./js/fontawesome-all.js"></script>
        <title>GesCap Adicionar Persona</title>
    </head>

    <body>
        <% HttpSession sesion = request.getSession();
            if (sesion.getAttribute("login") == null
                    || sesion.getAttribute("login").equals("0")) {
                response.sendRedirect("login.jsp");
            }%>

        <header>
            <nav class="navbar navbar-light" style="background-color: #e3f2fd;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="panel.jsp">GesCap</a>
                </div>
            </nav>
        </header>
        <main>
            <div class="container">
                <div class="col-lg-6">
                    <h4>Agregar Persona</h4>
                    <form action="Controlador">
                        <div class="mb-3">                           
                            <label for="nombre_organizacion" class="form-label">CI</label>
                            <input class="form-control" type="text" name="txtCi"><br>
                        </div>
                        <div class="mb-3">
                            <label for="nombre_organizacion" class="form-label">Nombre</label>                          
                            <input class="form-control" type="text" name="txtNombre"><br>
                        </div>
                        <div class="mb-3">
                            <label for="nombre_organizacion" class="form-label">Primer Apellido</label>  

                            <input class="form-control" type="text" name="txtPrimerApellido"><br>
                        </div>
                        <div class="mb-3">
                            <label for="nombre_organizacion" class="form-label">Segundo Apellido</label>                           
                            <input class="form-control" type="text" name="txtSegundoApellido"><br>
                        </div>
                        <button class="btn btn-primary" type="submit" name="accion" value="add_person">Agregar</button>                        
                        <a class="btn btn-secondary" href="Controlador?accion=persona_list">Regresar</a>
                    </form>
                </div>

            </div>
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
        <script src="./js/bootstrap.bundle.min.js"></script>
    </body>

</html>