<%-- 
    Document   : index
    Created on : 12/02/2019, 10:56:12 PM
    Author     : juani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD</title>
        <link rel="stylesheet" href="css/cssIndex.css" type="text/css">
    </head>
    <body>
        <div class="container">

       <form id="signup" action="login" method="post">
       
        <div class="header">
        
            <h3>Login</h3>
            
            <p><%
                String alert = (String)session.getAttribute("alerta");
                if(alert != null)
                {
                    out.print(alert);  
                }else
                {
                    out.print("BIENVENIDO");
                }
                  
                %></p>
            
        </div>
        
        <div class="sep"></div>

        <div class="inputs">
            
            <input type="text" placeholder="Usuario" name="txtUsuario" autofocus >
            
            <input type="password" placeholder="Password"name="txtPassword" >
            
            <input type="submit" id="submit" href="#" name="btnLogin" value="Logear">
            
        </div>

    </form>

</div>
​
    </body>
</html>
