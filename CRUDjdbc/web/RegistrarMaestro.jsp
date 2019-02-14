<%-- 
    Document   : RegistrarMaestro.jsp
    Created on : 13/02/2019, 09:17:38 PM
    Author     : juani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/cssIndex.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="w3-sidebar w3-light-grey w3-bar-block"  style="width:25%">
            <h3 class="w3-bar-item">Bienvenido ${sessionScope.usuario}</h3>
            <%
                if (session.getAttribute("tipoUsuario").equals(1)) {
            %>
            <a href="RegistrarAlumno.jsp" class="w3-bar-item w3-button">Registrar Alumno</a>
            <a href="ListaAlumnos.jsp" class="w3-bar-item w3-button">Lista Alumnos</a>
            <a href="RegistrarClase.jsp" class="w3-bar-item w3-button">Registrar Clase</a>
            <a href="MostrarClases.jsp" class="w3-bar-item w3-button">Lista de clases</a>
            <a href="RegistrarMaestro.jsp" class="w3-bar-item w3-button">Registrar Maestros</a>
            <a href="ListaMaestros.jsp" class="w3-bar-item w3-button">Lista Maestros</a>
            <a href="index.jsp" class="w3-bar-item w3-button">Salir</a>
            <%
            } else {
            %>
            <a href="#" class="w3-bar-item w3-button">Clases</a>
            <a href="index.jsp" class="w3-bar-item w3-button">Salir</a>
            <%}%>
        </div>
        <div class="inputs">
            <form action="RegistrarMaestro" id="center" >
                Nombre Completo <input type="text" placeholder="Nombre completo" name="txtNombre" autofocus><br>
                Telefono <input type="text" placeholder="Telefono" name="txtTelefono"><br>
                Materia <input type="text" placeholder="Materia" id="txtMateria" name="txtMateria"><br>
                Direccion <input type="text" placeholder="Direccion" name="txtDireccion" ><br>
                <input type="submit" id="submit" name="btnLogin" value="REGISTRAR">

            </form>
        </div>
    </body>
</html>
