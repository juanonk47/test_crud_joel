<%-- 
    Document   : editarClase
    Created on : 13/02/2019, 07:04:56 PM
    Author     : juani
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        <%
            String id = request.getParameter("id");
            try {

                ConexionMYSQL con = new ConexionMYSQL();
                Connection conn = con.conectarMySQL();
                String query = "Select idClase,Descripcion,Lugar,Cupo from Clase WHERE idClase ="+id;
                Statement s = conn.createStatement();
                ResultSet r = s.executeQuery(query);
                if (r.next()) {
                    System.out.println(r.getString(1));


        %>
        <div class="inputs">
            <form action="EditarClase" id="center" >
                ID <input type="text" id="txtid" name="txtID"  value="<%= r.getString(1)%>" readonly="readonly" ><br>
                Descripcion <input type="textarea" placeholder="Descripcion" name="txtDescripcion" value="<%= r.getString(2)%>" autofocus><br>
                Lugar <input type="text" placeholder="Telefono" name="txtLugar"value="<%= r.getString(3)%>"><br>
                Cupo <input type="text" placeholder="Gado" id="txtGrado" name="txtCupo"value="<%= r.getString(4)%>"><br>
                
                <input type="submit" id="submit" name="btnLogin" value="EDITAR">
                <%}
                        conn.close();

                    } catch (Exception e) {

                    }
                %>
            </form>
    </body>
</html>
