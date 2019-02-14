<%-- 
    Document   : login
    Created on : 13/02/2019, 04:32:52 AM
    Author     : juani
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="Controlador.ControladorLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <title>Bienvenido ${sessionScope.usuario}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <body>

        <!-- Sidebar -->
        <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:25%">
            <h3 class="w3-bar-item">Bienvenido ${sessionScope.usuario}</h3>
                <%
                    if (session.getAttribute("tipoUsuario").equals(1)) {
                %>
                <a href="RegistrarAlumno.jsp" class="w3-bar-item w3-button">Registrar Alumno</a>
                <a href="ListaAlumnos.jsp" class="w3-bar-item w3-button">Lista Alumno</a>
                <%
                    } else {
                %>
                <a href="#" class="w3-bar-item w3-button">Clases</a>
                <%}%>
        </div>

        <!-- Page Content -->
        <div style="margin-left:25%">

            

        </div>

    </body>
</html>
