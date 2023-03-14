/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloBean;

import Config.Conexion;
import Modelo.Persona;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author David Sean
 */
public class UsuarioBean {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public UsuarioBean() {
    }

    public boolean add(Usuario user) {

        String sql = "insert into usuarioapp(username, id_entidad, id_rol, admission_date, last_date)values('" + user.getUsername() + "','" + user.getEntidad() + "','" + user.getRol() + "','" + user.getAdmission_date() + "','" + user.getLast_date() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean eliminar(String username) {
        String sql = "delete from usuarioapp where username ='" + username + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean update(Usuario user, String username) {
        String sql = "update usuarioapp set id_entidad='" + user.getEntidad() + "', id_rol='" + user.getRol() + "', last_date='" + user.getLast_date() + "' where username= '" + username + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public List listar() {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "SELECT usuarioapp.username, entidad.descripcion, rol.descripcion, usuarioapp.admission_date, usuarioapp.last_date FROM usuarioapp, entidad, rol WHERE entidad.id_entidad=usuarioapp.id_entidad AND rol.id_rol=usuarioapp.id_rol";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setUsername(rs.getString("username"));
                user.setEntidad(rs.getString("entidad.descripcion"));
                user.setRol(rs.getString("rol.descripcion"));
                user.setAdmission_date(rs.getString("usuarioapp.admission_date"));
                user.setLast_date(rs.getString("usuarioapp.last_date"));
                list.add(user);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List listar(String query) {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "SELECT usuarioapp.username, entidad.descripcion, rol.descripcion, usuarioapp.admission_date, usuarioapp.last_date from usuarioapp, entidad, rol where entidad.id_entidad=usuarioapp.id_entidad AND rol.id_rol=usuarioapp.id_rol And( usuarioapp.username like '%" + query + "%' or entidad.descripcion like '%" + query + "%' or rol.descripcion like '%" + query + "%' or usuarioapp.last_date like '%" + query + "%' or usuarioapp.admission_date like '%" + query + "%')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setUsername(rs.getString("username"));
                user.setEntidad(rs.getString("entidad.descripcion"));
                user.setRol(rs.getString("rol.descripcion"));
                user.setAdmission_date(rs.getString("usuarioapp.admission_date"));
                user.setLast_date(rs.getString("usuarioapp.last_date"));
                list.add(user);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
