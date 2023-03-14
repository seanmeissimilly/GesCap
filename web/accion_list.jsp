<%-- Document : accion_list Created on : Apr 9, 2022, 12:43:27 AM Author : davidam --%>

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
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
                <div class="container-fluid">
                    <a class="navbar-brand" href="panel.jsp">GesCap</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href=".jsp">Areas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href=".jsp">Modalidades</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href=".jsp">Escolaridad</a>
                            </li>                           

                        </ul>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search"
                                   aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Buscar</button>
                        </form>
                    </div>
                </div>
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