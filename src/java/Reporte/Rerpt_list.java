/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Reporte;

import Config.Conexion;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author davidam
 */
public class Rerpt_list {
    
    String fecha_inicial;
    String fecha_final;
    String entidadejecutora;
    String entidad;
    String path;
    Connection conexion;

    public Rerpt_list(String fecha_inicial, String fecha_final, String entidadejecutora, String entidad, String path) {
        this.fecha_inicial = fecha_inicial;
        this.fecha_final = fecha_final;
        this.entidadejecutora = entidadejecutora;
        this.entidad = entidad;
        this.path = path;
        
        Conexion cn = new Conexion();
        conexion = cn.getConnection();
    }
    
    public void showreport() {
        try {
            Map parameters = new HashMap();
            parameters.put("entj", entidadejecutora);
            parameters.put("ent", entidad);
            parameters.put("fecha_inicial", fecha_inicial);
            parameters.put("fecha_final", fecha_final);

            /*Establecemos la ruta del reportegetRealPath("")*/
            JasperReport reporte = JasperCompileManager.compileReport(path);
            JasperPrint mostareporte = JasperFillManager.fillReport(reporte, parameters, conexion);
            JasperViewer.viewReport(mostareporte);
        } catch (JRException ex) {
            Logger.getLogger(Rerpt_plan.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
