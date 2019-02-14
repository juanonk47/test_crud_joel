/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Clase;
import Modelo.Maestro;
import coneccion.ConexionMYSQL;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author juani
 */
public class ControladorClase {
    ConexionMYSQL con = new ConexionMYSQL();
    public void RegistrarClase(Maestro m,Clase c) throws SQLException
    {
        Connection conn= con.conectarMySQL();
        String query = "insert into Clase (idMaestros,Cupo,Descripcion,Lugar) values("+m.getIdMaestros()+","+c.getCupo()+",'"+c.getDescripcion()+"','"+c.getLugar()+"')";
        Statement s = conn.createStatement();
        s.executeUpdate(query);
    }
    public void EliminarClase(int id) throws SQLException
    {
        Connection conn= con.conectarMySQL();
        String query = "delete from Clase where idClase ="+id;
        Statement s = conn.createStatement();
        s.executeUpdate(query);
    }
    public void ModificarClase(Clase c) throws SQLException
    {
        Connection conn= con.conectarMySQL();
        String query = "UPDATE Clase SET Descripcion='"+c.getDescripcion()+"' , Lugar='"+c.getLugar()+"',Cupo="+c.getCupo()+" WHERE idClase="+c.getIdClase()+";";
        Statement s = conn.createStatement();
        s.executeUpdate(query);
    }
    
}
