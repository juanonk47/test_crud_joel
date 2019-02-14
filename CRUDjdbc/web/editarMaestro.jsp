<%-- 
    Document   : editarMaestro
    Created on : 13/02/2019, 09:40:11 PM
    Author     : juani
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="coneccion.ConexionMYSQL"%>
<%@page import="coneccion.ConexionMYSQL"%>
<%@page import="Controlador.ControladorMaestro"%>
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
        <%
            String id = request.getParameter("id");
            try {

                ConexionMYSQL con = new ConexionMYSQL();
                Connection conn = con.conectarMySQL();
                String query = "select idUsuarios,Nombre,Telefono,Materia,Direccion from Maestros inner join Usuarios on Maestros.idUsuario = Usuarios.idUsuarios inner join Persona on Maestros.idPersona = Persona.idPersona WHERE idMaestros="+id;
                Statement s = conn.createStatement();
                ResultSet r = s.executeQuery(query);
                if (r.next()) {
                    System.out.println(r.getString(1));
              

        %>
        <div class="inputs">
            <form action="EditarMaestro" id="center" >
                ID <input type="text" id="txtid" name="txtID"  value="<%= r.getString(1)%>" readonly="readonly"><br>
                Nombre Completo <input type="text" placeholder="Nombre completo" name="txtNombre" value="<%= r.getString(2)%>" autofocus><br>
                Telefono <input type="text" placeholder="Telefono" name="txtTelefono"value="<%= r.getString(3)%>"><br>
                Materia <input type="text" placeholder="Gado" id="txtMateria" name="txtMateria"value="<%= r.getString(4)%>"><br>
                Direccion <input type="text" placeholder="Direccion" name="txtDireccion" value="<%= r.getString(5)%>" ><br>
                <input type="submit" id="submit" name="btnLogin" value="EDITAR">
                <%}
                    conn.close();
                    
                    } catch (Exception e) {

                    }
                %>
            </form>
        </div>
    </body>
</html>
