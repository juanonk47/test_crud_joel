<%-- 
    Document   : ListaAlumnos
    Created on : 13/02/2019, 04:46:47 PM
    Author     : juani
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="coneccion.ConexionMYSQL"%>
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
        <!-- Sidebar -->
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
        
        <table  border ="1" width="600" id="center" title="LISTA DE ALUMNOS">
            <tr>
                <th>LISTA DE ALUMNOS</th>
            </tr>
            <tr bgcolor="skyblue" >
                
                <th>Nombre</th><th>Usuario</th>
                <th>Contraseña</th><th>Grado</th>
                <th>Grupo</th><th>Direccion</th>
                <th>Telefono</th>
            </tr>
            <%
                try {

                    ConexionMYSQL con = new ConexionMYSQL();
                    Connection conn = con.conectarMySQL();
                    String query = "select idAlumnos,nombre,usuario,contraseña,grado,grupo,direccion,telefono from Alumnos inner join Usuarios on Alumnos.idUsuario = Usuarios.idUsuarios inner join Persona on Alumnos.idPersona = Persona.idPersona;";
                    Statement s = conn.createStatement();
                    ResultSet r = s.executeQuery(query);
                    while (r.next()) {
                        System.out.println(r.getString(1));
            %>
            <tr>
                <th><%= r.getString(2)%></th>
                <th><%= r.getString(3)%></th>
                <th><%= r.getString(4)%></th>
                <th><%= r.getString(5)%></th>
                <th><%= r.getString(6)%></th>
                <th><%= r.getString(7)%></th>
                <th><%= r.getString(8)%></th>
                <th>
                    <a href="eliminarAlumno.jsp?id=<%=r.getString(1)%>">
                        <img src="img/eliminar.png" width="30" height="30">
                    </a>
                    <a href="editarAlumno.jsp?id=<%=r.getString(1)%>">
                        <img src="img/editar.png" width="30" height="30">
                    </a>
                </th>
            </tr>
            <%
                    }
                    s.close();
                    r.close();
                    conn.close();
                } catch (Exception e) {
                    System.out.println(e.toString());
                }
            %>
        </table>
    </body>
</html>
