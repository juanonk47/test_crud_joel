<%-- 
    Document   : eliminarAlumno
    Created on : 13/02/2019, 06:46:32 PM
    Author     : juani
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Alumno"%>
<%@page import="Controlador.ControladorAlumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            Alumno a = new Alumno();
            Usuario u = new Usuario();
            a.setIdAlumno(Integer.parseInt(id));
            ControladorAlumno ca = new ControladorAlumno();
            u.setIdUsuario(ca.BuscaridUsuario(a));
            ca.EliminarAlumno(Integer.parseInt(id));
            ca.EliminarUsuario(u);
            request.getRequestDispatcher("ListaAlumnos.jsp").forward(request, response);
        %>
    </body>
</html>
