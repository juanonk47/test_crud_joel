/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Maestro;
import Modelo.Persona;
import Modelo.Usuario;
import coneccion.ConexionMYSQL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author juani
 */
public class ControladorMaestro {
    ConexionMYSQL con = new ConexionMYSQL();
    public int buscarID(Usuario u) throws SQLException
    {
        
        Connection conn= con.conectarMySQL();
        String query = "select idUsuarios from Maestros inner join Usuarios on Maestros.idUsuario = Usuarios.idUsuarios WHERE Usuario='"+u.getUsuario()+"';";
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        if(rs.next())
        {
            u.setIdUsuario(rs.getInt(1));
            return u.getIdUsuario();
        }
        return 0;
    }
    public void CrearMaestro(Maestro m,Persona p) throws SQLException
    {
        
        Connection conn= con.conectarMySQL();
        String query = "call CreacionMaestro('"+m.getMateria()+"','"+p.getNombre()+"','"+p.getDireccion()+"','"+p.getTelefono()+"')";
        Statement s = conn.createStatement();
        s.executeUpdate(query);
    }
    public void EliminarMaestro(Maestro m) throws SQLException
    {
        Connection conn = con.conectarMySQL();
        String query = "delete from Maestros where idMaestros ="+m.getIdMaestros();
        Statement s = conn.createStatement();
        s.executeUpdate(query);
        Usuario u=new Usuario();
        u.setIdUsuario(BuscaridUsuario(m));
        EliminarUsuario(u);
        
    }
    public void EliminarUsuario(Usuario u) throws SQLException
    {
        Connection conn = con.conectarMySQL();
        String query = "delete from Usuarios WHERE idUsuarios="+u.getIdUsuario();
        Statement s = conn.createStatement();
        s.executeUpdate(query);
        
    }
    public int BuscaridUsuario(Maestro m) throws SQLException
    {
        Connection conn= con.conectarMySQL();
        int id=0;
        String query = "select idUsuarios from Maestros inner join Usuarios on Maestros.idUsuario = Usuarios.idUsuarios WHERE idMaestros="+m.getIdMaestros();
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        if(rs.next())
        {
            id = Integer.parseInt(rs.getString(1));
            System.out.println(id+"RETORNAAAAAAAAAAR ----------------------------------------------------------");
            return id;
        }
        
        return 0;
    }
    
    public void ModificarMaestro(Maestro m,Persona p) throws SQLException
    {
        Connection conn = con.conectarMySQL();
        String query = "call modificarMaestro("+m.getIdMaestros()+",'"+p.getNombre()+"','"+p.getTelefono()+"','"+p.getDireccion()+"','"+m.getMateria()+"')";
        Statement s = conn.createStatement();
        s.executeUpdate(query);
    }
    
    
}
