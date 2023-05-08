<%-- Document : 404 Created on : 14 jun 2022, 17:25:04 Author : David Sean --%>

<%@page import="ModeloBean.UsuarioBean"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <jsp:include page="header.jsp"></jsp:include>  
        <title>GesCap 404 Error</title>
    </head>

    <body>
        <jsp:include page="navbar.jsp"></jsp:include> 

        <main id="main" class="main">
            <section class="page-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4">
                            <div class="text-center mt-4">
                                <img class="mb-4 img-error" src="./img/error-404-monochrome.svg" />
                                <p class="lead">Esta URL solicitada no se encontró en este servidor.</p>
                                <a href="./dashboard">
                                    <i class="fas fa-arrow-left me-1"></i>
                                    Retornar a Inicio.
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>       
        
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>