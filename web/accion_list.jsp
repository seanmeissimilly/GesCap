<%-- Document : accion_list Created on : Apr 9, 2022, 12:43:27 AM Author : davidam --%>

<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <title>GesCap Acciones de Capacitación</title>
    </head>

    <body>
        <% HttpSession sesion = request.getSession();
            if (sesion.getAttribute("login") == null
                    || sesion.getAttribute("login").equals("0")) {
                response.sendRedirect("login.jsp");
            }%>
        <header>
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
                                <hr class="dropdown-divider">
                            </li>                            
                            <li>
                                <hr class="dropdown-divider">
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center" href="404.jsp">
                                    <i class="bi bi-question-circle"></i>
                                    <span>¿Necesitas Ayuda ?</span>
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
        </header>

        <main>


            <!-- Start of Form -->
            <form>
                <!-- 1. Text Input -->
                <div class="form-group">
                    <label for="username">Enter Username</label>
                    <input type="text" class="form-control" id="username" aria-describedby="Username" placeholder="Enter Username">
                    <small id="Username" class="form-text text-muted">Enter username to login.</small>
                </div>
                <!-- 2. Password -->
                <div class="form-group">
                    <label for="password">Enter Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password">
                </div>
                <!-- 3. Single Select -->
                <div class="form-group">
                    <label for="singleselect">Single Select from the Dropdown</label>
                    <select class="form-control" id="singleselect">
                        <option>Option 1</option>
                        <option>Option 2</option>
                        <option>Option 3</option>
                        <option>Option 4</option>
                        <option>Option 5</option>
                    </select>
                </div>
                <!-- 4. Multiple Select -->
                <div class="form-group">
                    <label for="multipleselect">Multiple Select from List</label>
                    <select multiple class="form-control" id="multipleselect">
                        <option>Option 1</option>
                        <option>Option 2</option>
                        <option>Option 3</option>
                        <option>Option 4</option>
                        <option>Option 5</option>
                    </select>
                </div>
                <!-- 5. Textarea -->
                <div class="form-group">
                    <label for="textarea">Textarea Input</label>
                    <textarea class="form-control" id="textarea" rows="5"></textarea>
                </div>
                <!-- 6. File Upload -->
                <div class="form-group">
                    <label for="fileupload">Upload File</label>
                    <input type="file" class="form-control-file" id="fileupload" aria-describedby="fileupload">
                    <small id="fileupload" class="form-text text-muted">Choose the file from your computer and the browse screen depends on your operating system.</small>
                </div>
                <!-- 7. Radio Buttons -->
                <fieldset class="form-group">
                    <legend>Radio Buttons</legend>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="radio" id="radio1" value="Option 1" checked>
                            Option 1</label>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="radio" id="radio2" value="Option 2">
                            Option 2 </label>
                    </div>
                    <div class="form-check disabled">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="radio" id="radio3" value="Option 3" disabled>
                            Option 3</label>
                    </div>
                </fieldset>
                <!-- 8. Checkbox -->
                <fieldset class="form-group">
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input">
                            This is a checkbox 1.
                        </label>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input">
                            This is a checkbox 2.
                        </label>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input">
                            This is a checkbox 3.
                        </label>
                    </div>
                </fieldset>
                <!-- 9. Submit Button -->
                <button type="submit" class="btn btn-success">Submit</button>
            </form>
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
                        <a class="btn btn-dark btn-social mx-2" href="https://es-la.facebook.com/cimexcuba/"
                           aria-label="Facebook"><i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="btn btn-dark btn-social mx-2" href="404.jsp" aria-label="Twitter"><i
                                class="fab fa-twitter"></i>
                        </a>
                        <a class="btn btn-dark btn-social mx-2" href="404.jsp" aria-label="Youtube"><i
                                class="fab fa-youtube"></i>
                        </a>                    
                    </div>
                </div>
            </div>
        </footer>
        <script src="./js/bootstrap.bundle.min.js"></script>
    </body>

</html>