/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Alumno;
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
public class ControladorLogin {

    ConexionMYSQL con = new ConexionMYSQL();

    public boolean Login(Usuario u) throws SQLException {
        boolean activador = false;
        Connection conn = con.conectarMySQL();
        System.out.println(u.getUsuario());
        System.out.println(u.getContraseña());
        String query = "Select idUsuarios from Usuarios WHERE Usuario='" + u.getUsuario() + "' and Contraseña = '" + u.getContraseña() + "'";
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);

        if (rs.next()) {
            if (rs.getInt(1) != 0) {

                activador = true;
            }

        }

        return activador;
    }

    public boolean checarUsuarioMaestro(Usuario u) throws SQLException {
        boolean activador = false;
        Connection conn = con.conectarMySQL();
        System.out.println(u.getUsuario());
        System.out.println(u.getContraseña());
        String query = "select count(idMaestroS) from Maestros inner join Usuarios on Maestros.idUsuario = Usuarios.idUsuarios where usuario='" + u.getUsuario() + "'";
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        if (rs.next()) {
            if (rs.getInt(1) != 0) {

                activador = true;
            }

        }
        return activador;
    }
    public boolean checarUsuarioAlumno(Usuario u) throws SQLException
    {
        boolean activador=false;
        Connection conn = con.conectarMySQL();
        System.out.println(u.getUsuario());
        System.out.println(u.getContraseña());
        String query = "select count(idAlumnos) from Alumnos inner join Usuarios on Maestros.idUsuario = Usuarios.idUsuarios where usuario='" + u.getUsuario() + "'";
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        if (rs.next()) {
            if (rs.getInt(1) != 0) {

                activador = true;
            }

        }
        
        return activador;
    }

}
