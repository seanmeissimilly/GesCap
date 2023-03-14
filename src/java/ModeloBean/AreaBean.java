/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloBean;

import Config.Conexion;
import Modelo.Area;
import Modelo.Clasificacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author David Sean
 */
public class AreaBean {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public AreaBean() {

    }

    public List listar() {
        ArrayList<Area> list = new ArrayList<>();
        String sql = "select * from areaaccion order by id_areaaccion";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Area org = new Area();
                org.setNumero(rs.getString("id_areaaccion"));
                org.setNombre(rs.getString("descripcion"));
                list.add(org);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
