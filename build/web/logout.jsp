<%-- Document : logout Created on : 11 may 2022, 15:47:04 Author : David Sean --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <jsp:include page="header.jsp"></jsp:include> 
            <title>Gescap Logout</title>
        </head>

        <body>

        <% HttpSession sesion = request.getSession();
            sesion.invalidate();
            response.sendRedirect("login.jsp");%>      



    </body>

</html>