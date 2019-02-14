<%-- 
    Document   : eliminarMaestro
    Created on : 13/02/2019, 09:39:58 PM
    Author     : juani
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Maestro"%>
<%@page import="Controlador.ControladorMaestro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           Maestro m= new Maestro();
           Usuario u=new Usuario();
            String id= request.getParameter("id");
            m.setIdMaestros(Integer.parseInt(id));
            ControladorMaestro cm= new ControladorMaestro();
            int idUsuario=cm.BuscaridUsuario(m);
            u.setIdUsuario(idUsuario);
            cm.EliminarUsuario(u);
            cm.EliminarMaestro(m);
            request.getRequestDispatcher("ListaMaestros.jsp").forward(request, response);
        %>
    </body>
</html>
