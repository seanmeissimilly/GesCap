/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloBean;

import Config.Conexion;
import Modelo.Ldap;
import Modelo.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author davidam
 */
public class LdapBean {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public LdapBean() {

    }

    public ArrayList<Ldap> listar() {
        ArrayList<Ldap> list = new ArrayList<>();
        String sql = "SELECT * FROM ldap";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Ldap ldap = new Ldap();
                ldap.setIp_ldap(rs.getString("ldap"));
                ldap.setUser_ldap(rs.getString("user_ldap"));
                ldap.setPass_ldap(rs.getString("pass_ldap"));
                ldap.setDate(rs.getString("date"));
                ldap.setUserapp(rs.getString("userapp"));
                list.add(ldap);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
