/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Alumno;
import Modelo.Maestro;
import Modelo.Persona;
import Modelo.Usuario;
import coneccion.ConexionMYSQL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author juani
 */
public class ControladorAlumno {
    ConexionMYSQL con = new ConexionMYSQL();
    public void RegistrarAlumno(Persona p,Alumno a) throws SQLException
    {
        Connection conn = con.conectarMySQL();
        String query = "call CreacionAlumno('"+p.getNombre()+"','"+p.getTelefono()+"','"+p.getDireccion()+"', '"+a.getGrado()+"', '"+a.getGrupo()+"')";
        Statement s = conn.createStatement();
        s.executeUpdate(query);
        
    }
    public void EliminarAlumno(int id) throws SQLException
    {
        Connection conn = con.conectarMySQL();
        String query = "delete from Alumnos where idAlumnos ="+id;
        Statement s = conn.createStatement();
        s.executeUpdate(query);
    }
    
    public void UpdateAlumno(Persona p,Alumno a) throws SQLException
    {
        Connection conn = con.conectarMySQL();
        String query = "call modificarAlumno("+a.getIdAlumno()+",'"+p.getNombre()+"','"+p.getTelefono()+"','"+p.getDireccion()+"','"+a.getGrado()+"','"+a.getGrupo()+"')";
        Statement s = conn.createStatement();
        s.executeUpdate(query);
        
    }
     public void EliminarUsuario(Usuario u) throws SQLException
    {
        Connection conn = con.conectarMySQL();
        String query = "delete from Usuarios WHERE idUsuarios="+u.getIdUsuario();
        Statement s = conn.createStatement();
        s.executeUpdate(query);
        
    }
    public int BuscaridUsuario(Alumno a) throws SQLException
    {
        Connection conn= con.conectarMySQL();
        int id=0;
        String query = "select idUsuario from Alumnos inner join Usuarios on Alumnos.idUsuario = Usuarios.idUsuarios where idAlumnos="+a.getIdAlumno()+";";
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
    
}
