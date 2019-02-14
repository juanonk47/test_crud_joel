<%-- 
    Document   : eliminarClases
    Created on : 13/02/2019, 06:58:53 PM
    Author     : juani
--%>

<%@page import="Controlador.ControladorClase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id= request.getParameter("id");
            ControladorClase ca=new ControladorClase();
            ca.EliminarClase(Integer.parseInt(id));
            request.getRequestDispatcher("MostrarClases.jsp").forward(request, response);
        %>
    </body>
</html>
