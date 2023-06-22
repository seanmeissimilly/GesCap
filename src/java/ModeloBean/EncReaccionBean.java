/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloBean;

import Config.Conexion;
import Modelo.EncReaccion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author davidam
 */
public class EncReaccionBean {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public EncReaccionBean() {
    }

    public boolean add(EncReaccion reaccion) {
        String sql = "INSERT INTO encuestareaccion ("
                + "id_accion,"
                + "resultado1,"
                + "resultado2,"
                + "resultado3,"
                + "resultado4,"
                + "resultado5,"
                + "tra_real1,"
                + "tra_real2,"
                + "tra_real3,"
                + "tra_real4,"
                + "tra_plan1,"
                + "tra_plan2,"
                + "tra_plan3,"
                + "tra_plan4,"
                + "cua_dirreal1,"
                + "cua_dirreal2,"
                + "cua_dirreal3,"
                + "cua_dirplan1,"
                + "cua_dirplan2,"
                + "cua_dirplan3,"
                + "cua_ejecreal1,"
                + "cua_ejecreal2,"
                + "cua_ejecreal3,"
                + "cua_ejecplan1,"
                + "cua_ejecplan2,"
                + "cua_ejecplan3"
                + ")"
                + "VALUES"
                + "('" + reaccion.getId_accion() + "','" + reaccion.getResultado1() + "','" + reaccion.getResultado2() + "','" + reaccion.getResultado3() + "','" + reaccion.getResultado4() + "','" + reaccion.getResultado5() + "','" + reaccion.getTra_real1() + "','" + reaccion.getTra_real2() + "','" + reaccion.getTra_real3() + "','" + reaccion.getTra_real4() + "','" + reaccion.getTra_plan1() + "','" + reaccion.getTra_plan2() + "','" + reaccion.getTra_plan3() + "','" + reaccion.getTra_plan4() + "','" + reaccion.getCua_dirreal1() + "','" + reaccion.getCua_dirreal2() + "','" + reaccion.getCua_dirreal3() + "','" + reaccion.getCua_dirplan1() + "','" + reaccion.getCua_dirplan2() + "','" + reaccion.getCua_dirplan3() + "','" + reaccion.getCua_ejecreal1() + "','" + reaccion.getCua_ejecreal2() + "','" + reaccion.getCua_ejecreal3() + "','" + reaccion.getCua_ejecplan1() + "','" + reaccion.getCua_ejecplan2() + "','" + reaccion.getCua_ejecplan3() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public EncReaccion list(int id_accion) {
        EncReaccion reaccion = new EncReaccion();
        String sql = "SELECT\n"
                + "	encuestareaccion.id_accion,\n"
                + "	encuestareaccion.id_encuestareacc,\n"
                + "	encuestareaccion.resultado1,\n"
                + "	encuestareaccion.resultado2,\n"
                + "	encuestareaccion.resultado3,\n"
                + "	encuestareaccion.resultado4,\n"
                + "	encuestareaccion.resultado5,\n"
                + "	encuestareaccion.tra_real1,\n"
                + "	encuestareaccion.tra_real2,\n"
                + "	encuestareaccion.tra_real3,\n"
                + "	encuestareaccion.tra_real4,\n"
                + "	encuestareaccion.tra_plan1,\n"
                + "	encuestareaccion.tra_plan2,\n"
                + "	encuestareaccion.tra_plan3,\n"
                + "	encuestareaccion.tra_plan4,\n"
                + "	encuestareaccion.cua_dirreal1,\n"
                + "	encuestareaccion.cua_ejecplan3,\n"
                + "	encuestareaccion.cua_ejecplan2,\n"
                + "	encuestareaccion.cua_ejecplan1,\n"
                + "	encuestareaccion.cua_ejecreal3,\n"
                + "	encuestareaccion.cua_ejecreal2,\n"
                + "	encuestareaccion.cua_ejecreal1,\n"
                + "	encuestareaccion.cua_dirplan3,\n"
                + "	encuestareaccion.cua_dirplan2,\n"
                + "	encuestareaccion.cua_dirplan1,\n"
                + "	encuestareaccion.cua_dirreal3,\n"
                + "encuestareaccion.cua_dirreal2 \n"
                + "FROM\n"
                + "	encuestareaccion\n"
                + "	INNER JOIN accioncapacitacion ON encuestareaccion.id_accion = accioncapacitacion.id_accion\n"
                + "WHERE\n"
                + "	encuestareaccion.id_accion = '" + id_accion + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                reaccion = new EncReaccion();
                reaccion.setId_encuestareacc(Integer.parseInt(rs.getString("encuestareaccion.id_encuestareacc")));
                reaccion.setId_accion(Integer.parseInt(rs.getString("encuestareaccion.id_accion")));

                reaccion.setResultado1(Integer.parseInt(rs.getString("encuestareaccion.resultado1")));
                reaccion.setResultado2(Integer.parseInt(rs.getString("encuestareaccion.resultado2")));
                reaccion.setResultado3(Integer.parseInt(rs.getString("encuestareaccion.resultado3")));
                reaccion.setResultado4(Integer.parseInt(rs.getString("encuestareaccion.resultado4")));
                reaccion.setResultado5(Integer.parseInt(rs.getString("encuestareaccion.resultado5")));

                reaccion.setTra_real1(Integer.parseInt(rs.getString("encuestareaccion.tra_real1")));
                reaccion.setTra_real2(Integer.parseInt(rs.getString("encuestareaccion.tra_real2")));
                reaccion.setTra_real3(Integer.parseInt(rs.getString("encuestareaccion.tra_real3")));
                reaccion.setTra_real4(Integer.parseInt(rs.getString("encuestareaccion.tra_real4")));

                reaccion.setTra_plan1(Integer.parseInt(rs.getString("encuestareaccion.tra_plan1")));
                reaccion.setTra_plan2(Integer.parseInt(rs.getString("encuestareaccion.tra_plan2")));
                reaccion.setTra_plan3(Integer.parseInt(rs.getString("encuestareaccion.tra_plan3")));
                reaccion.setTra_plan4(Integer.parseInt(rs.getString("encuestareaccion.tra_plan4")));

                reaccion.setCua_dirplan1(Integer.parseInt(rs.getString("encuestareaccion.cua_dirplan1")));
                reaccion.setCua_dirplan2(Integer.parseInt(rs.getString("encuestareaccion.cua_dirplan2")));
                reaccion.setCua_dirplan3(Integer.parseInt(rs.getString("encuestareaccion.cua_dirplan3")));

                reaccion.setCua_ejecplan1(Integer.parseInt(rs.getString("encuestareaccion.cua_ejecplan1")));
                reaccion.setCua_ejecplan2(Integer.parseInt(rs.getString("encuestareaccion.cua_ejecplan2")));
                reaccion.setCua_ejecplan3(Integer.parseInt(rs.getString("encuestareaccion.cua_ejecplan3")));

                reaccion.setCua_dirreal1(Integer.parseInt(rs.getString("encuestareaccion.cua_dirreal1")));
                reaccion.setCua_dirreal2(Integer.parseInt(rs.getString("encuestareaccion.cua_dirreal2")));
                reaccion.setCua_dirreal3(Integer.parseInt(rs.getString("encuestareaccion.cua_dirreal3")));

                reaccion.setCua_ejecreal1(Integer.parseInt(rs.getString("encuestareaccion.cua_ejecreal1")));
                reaccion.setCua_ejecreal2(Integer.parseInt(rs.getString("encuestareaccion.cua_ejecreal2")));
                reaccion.setCua_ejecreal3(Integer.parseInt(rs.getString("encuestareaccion.cua_ejecreal3")));

            }
        } catch (Exception e) {
        }
        return reaccion;
    }

    public boolean update(EncReaccion reaccion) {
        String sql = "UPDATE encuestareaccion SET id_accion='" + reaccion.getId_accion() + "',resultado1='" + reaccion.getResultado1() + "',resultado2='" + reaccion.getResultado2() + "',resultado3='" + reaccion.getResultado3() + "',resultado4='" + reaccion.getResultado4() + "',resultado5='" + reaccion.getResultado5() + "',tra_real1='" + reaccion.getTra_real1() + "',tra_real2='" + reaccion.getTra_real2() + "',tra_real3='" + reaccion.getTra_real3() + "',tra_real4='" + reaccion.getTra_real4() + "',tra_plan1='" + reaccion.getTra_plan1() + "',tra_plan2='" + reaccion.getTra_plan2() + "',tra_plan3='" + reaccion.getTra_plan3() + "',tra_plan4='" + reaccion.getTra_plan4() + "',cua_dirreal1='" + reaccion.getCua_dirreal1() + "',cua_dirreal2='" + reaccion.getCua_dirreal2() + "',cua_dirreal3='" + reaccion.getCua_dirreal3() + "',cua_dirplan1='" + reaccion.getCua_dirplan1() + "',cua_dirplan2='" + reaccion.getCua_dirplan2() + "',cua_dirplan3='" + reaccion.getCua_dirplan3() + "',cua_ejecreal1='" + reaccion.getCua_ejecreal1() + "',cua_ejecreal2='" + reaccion.getCua_ejecreal2() + "',cua_ejecreal3='" + reaccion.getCua_ejecreal3() + "',cua_ejecplan1='" + reaccion.getCua_ejecplan1() + "',cua_ejecplan2='" + reaccion.getCua_ejecplan2() + "',cua_ejecplan3='" + reaccion.getCua_ejecplan3() + "' WHERE encuestareaccion.id_accion='" + reaccion.getId_accion() + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
}
