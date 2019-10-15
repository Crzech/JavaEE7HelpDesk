/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author christianpernillo
 */
public class ModeloResolucionAsignacion {
    public int id_resolucion;
    public ModeloSolicitudAsignacion asignacion;
    public int tipo;
    public String descripcion;
    public long fecha;

    public int getId_resolucion() {
        return id_resolucion;
    }

    public void setId_resolucion(int id_resolucion) {
        this.id_resolucion = id_resolucion;
    }

    public ModeloSolicitudAsignacion getAsignacion() {
        return asignacion;
    }

    public void setAsignacion(ModeloSolicitudAsignacion asignacion) {
        this.asignacion = asignacion;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public long getFecha() {
        return fecha;
    }

    public void setFecha(long fecha) {
        this.fecha = fecha;
    }
    
    public ArrayList<ModeloResolucionAsignacion> getList(int id_usuario) {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        ArrayList<ModeloResolucionAsignacion> list = new ArrayList<>();
        int contador = 0;
//       Buscar libreria itextpdf
        try {
            Statement stm = cn.createStatement();
            ResultSet set;
            set = stm.executeQuery("SELECT * FROM hd_asignacion_resolucion INNER JOIN hd_solicitud_asignacion ON hd_asignacion_resolucion.id_asignacion = hd_solicitud_asignacion.id_solicitud_asignacion WHERE hd_solicitud_asignacion.id_usuario = '" + id_usuario + "' AND hd_solicitud_asignacion.estado = 2 ORDER BY hd_asignacion_resolucion.fecha DESC");
            while (set.next()) {
                ModeloResolucionAsignacion resolucion = new ModeloResolucionAsignacion();
                resolucion.setAsignacion(new ModeloSolicitudAsignacion(set.getInt("id_asignacion")));
            }
        } catch (Exception ex) {

        }
        con.desconectar();
        return list;
    }
    public String testList(int id_usuario) {
        String query = "SELECT * FROM hd_asignacion_resolucion INNER JOIN hd_solicitud_asignacion ON hd_asignacion_resolucion.id_asignacion = hd_solicitud_asignacion.id_solicitud_asignacion WHERE hd_solicitud_asignacion.id_usuario = '" + id_usuario + "' AND hd_solicitud_asignacion.estado = 2 ORDER BY hd_asignacion_resolucion.fecha DESC";
        return query;
    }
    
    public int save() {
        int result = 0;
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            long unixTime = System.currentTimeMillis() / 1000L;
            PreparedStatement stm = cn.prepareStatement("INSERT INTO hd_asignacion_resolucion (id_asignacion, tipo, descripcion, fecha) VALUES (?, ?, ?, ?)");
            stm.setInt(1, this.getAsignacion().getId_solicitud_asignacion());
            stm.setInt(2, this.getTipo());
            stm.setString(3, this.getDescripcion());
            stm.setLong(4, unixTime);
            stm.executeUpdate();
            
            PreparedStatement stm2 = cn.prepareStatement("UPDATE hd_solicitud_asignacion SET estado = 2 WHERE id_solicitud_asignacion = ?");
            stm2.setInt(1, this.getAsignacion().getId_solicitud_asignacion());
            stm2.executeUpdate();          
            
            PreparedStatement stm3 = cn.prepareStatement("UPDATE hd_solicitud SET estado = 3 WHERE id_solicitud = ?");
            stm3.setInt(1, this.getAsignacion().getSolicitud().getId_solicitud());
            stm3.executeUpdate();
            stm3.executeUpdate();
            
            result = 1;

        } catch (Exception ex) {
            result = 2;

        }
        con.desconectar();
        return result;
    }
}
