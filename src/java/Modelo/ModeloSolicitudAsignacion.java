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
public class ModeloSolicitudAsignacion {

    public int id_solicitud_asignacion;
    public ModeloSolicitud solicitud;
    public ModeloUsuario usuario;
    public long fecha_final;
    public int prioridad;
    public int estado;
    public long fecha_asignacion;

    public ModeloSolicitudAsignacion() {

    }

    public int getId_solicitud_asignacion() {
        return id_solicitud_asignacion;
    }

    public void setId_solicitud_asignacion(int id_solicitud_asignacion) {
        this.id_solicitud_asignacion = id_solicitud_asignacion;
    }

    public ModeloSolicitud getSolicitud() {
        return solicitud;
    }

    public void setSolicitud(ModeloSolicitud solicitud) {
        this.solicitud = solicitud;
    }

    public ModeloUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(ModeloUsuario usuario) {
        this.usuario = usuario;
    }

    public long getFecha_final() {
        return fecha_final;
    }

    public void setFecha_final(long fecha_final) {
        this.fecha_final = fecha_final;
    }

    public int getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(int prioridad) {
        this.prioridad = prioridad;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public long getFecha_asignacion() {
        return fecha_asignacion;
    }

    public void setFecha_asignacion(long fecha_asignacion) {
        this.fecha_asignacion = fecha_asignacion;
    }

    public ArrayList<ModeloSolicitudAsignacion> getList(int id_usuario) {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        ArrayList<ModeloSolicitudAsignacion> list = new ArrayList<>();
        int contador = 0;
//        ModeloUsuario currentUser = new ModeloUsuario(id_usuario);
        try {
            Statement stm = cn.createStatement();
            ResultSet set;
            set = stm.executeQuery("SELECT * FROM hd_solicitud_asignacion WHERE id_usuario = '" + id_usuario + "' AND estado != 0 AND estado != 2 ORDER BY prioridad ASC");
            while (set.next()) {
                ModeloSolicitudAsignacion asignacion = new ModeloSolicitudAsignacion();
                asignacion.setId_solicitud_asignacion(set.getInt("id_solicitud_asignacion"));
                asignacion.setSolicitud(new ModeloSolicitud(set.getInt("id_solicitud")));
                asignacion.setUsuario(new ModeloUsuario(set.getInt("id_usuario")));
                asignacion.setFecha_final(set.getLong("fecha_final"));
                asignacion.setPrioridad(set.getInt("prioridad"));
                asignacion.setEstado(set.getInt("estado"));
                asignacion.setFecha_asignacion(set.getLong("fecha_asignacion"));

                list.add(asignacion);
            }
        } catch (Exception ex) {

        }
        con.desconectar();
        return list;
    }
    public ArrayList<ModeloSolicitudAsignacion> getCompletadasList(int id_usuario) {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        ArrayList<ModeloSolicitudAsignacion> list = new ArrayList<>();
        int contador = 0;
//        ModeloUsuario currentUser = new ModeloUsuario(id_usuario);
        try {
            Statement stm = cn.createStatement();
            ResultSet set;
            set = stm.executeQuery("SELECT * FROM hd_solicitud_asignacion WHERE id_usuario = '" + id_usuario + "' AND estado = 2 ORDER BY prioridad ASC, fecha_final DESC");
            while (set.next()) {
                ModeloSolicitudAsignacion asignacion = new ModeloSolicitudAsignacion();
                asignacion.setId_solicitud_asignacion(set.getInt("id_solicitud_asignacion"));
                asignacion.setSolicitud(new ModeloSolicitud(set.getInt("id_solicitud")));
                asignacion.setUsuario(new ModeloUsuario(set.getInt("id_usuario")));
                asignacion.setFecha_final(set.getLong("fecha_final"));
                asignacion.setPrioridad(set.getInt("prioridad"));
                asignacion.setEstado(set.getInt("estado"));
                asignacion.setFecha_asignacion(set.getLong("fecha_asignacion"));

                list.add(asignacion);
            }
        } catch (Exception ex) {

        }
        con.desconectar();
        return list;
    }

   

//    public int save() {
//        int result = 0;
//        Conexion con = new Conexion();
//        con.conectar();
//        Connection cn = con.getCn();
//        try {
//            long unixTime = System.currentTimeMillis() / 1000L;
//            PreparedStatement stm = cn.prepareStatement("INSERT INTO hd_solicitud (id_departamento, tipo_solicitud, descripcion_solicitud, fecha_creacion, usuario_id, estado) VALUES (?, ?, ?, ?, ?, ?)");
//            stm.setInt(1, this.getDepartamento().getId_departamento());
//            stm.setInt(2, this.getTipo_solicitud());
//            stm.setString(3, this.getDescripcion_solicitud());
//            stm.setLong(4, unixTime);
//            stm.setInt(5, this.getUsuario().getId_usuario());
//            stm.setInt(6, this.getEstado());
//            stm.executeUpdate();
//            result = 1;
//
//        } catch (Exception ex) {
//            result = 2;
//
//        }
//        con.desconectar();
//        return result;
//    }
//
//    public int update() {
//        int result = 0;
//        Conexion con = new Conexion();
//        con.conectar();
//        Connection cn = con.getCn();
//        try {
//            PreparedStatement stm = cn.prepareStatement("UPDATE hd_solicitud SET id_departamento = ?, tipo_solicitud = ?, descripcion_solicitud = ? WHERE id_solicitud = ?");
//            stm.setInt(1, this.getDepartamento().getId_departamento());
//            stm.setInt(2, this.getTipo_solicitud());
//            stm.setString(3, this.getDescripcion_solicitud());
//            stm.setInt(4, this.getId_solicitud());
//            stm.executeUpdate();
//            result = 1;
//        } catch (Exception ex) {
//            result = 2;
//        }
//        con.desconectar();
//        return result;
//    }
//
//    public int delete() {
//        int result = 0;
//        Conexion con = new Conexion();
//        con.conectar();
//        Connection cn = con.getCn();
//        try {
//            PreparedStatement stm = cn.prepareStatement("UPDATE hd_solicitud SET estado = 0 WHERE id_solicitud = ?");
//            stm.setInt(1, this.getId_solicitud());
//            stm.executeUpdate();
//            result = 1;
//        } catch (Exception ex) {
//            result = 2;
//        }
//        con.desconectar();
//        return result;
//    }
//
    public ModeloSolicitudAsignacion(int id_solicitud_asignacion) {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            Statement stm = cn.createStatement();
            ResultSet set = stm.executeQuery("SELECT * FROM hd_solicitud_asignacion WHERE id_solicitud_asignacion = '" + id_solicitud_asignacion + "'");
            while (set.next()) {
               this.id_solicitud_asignacion = id_solicitud_asignacion;
               this.solicitud = new ModeloSolicitud(set.getInt("id_solicitud"));
               this.usuario = new ModeloUsuario(set.getInt("id_usuario"));
               this.prioridad = set.getInt("prioridad");
               this.fecha_final = set.getLong("fecha_final");
               this.fecha_asignacion = set.getLong("fecha_asignacion");
               this.estado = set.getInt("estado");
            }
        } catch (Exception ex) {

        }
        con.desconectar();
    }
//
//    public int asignar(int id_solicitud, int id_usuario, int prioridad, long fecha_final) {
//        int result = 0;
//        Conexion con = new Conexion();
//        con.conectar();
//        Connection cn = con.getCn();
//        try {
//            long unixTime = System.currentTimeMillis() / 1000L;
//            PreparedStatement stm = cn.prepareStatement("INSERT INTO hd_solicitud_asignacion (id_solicitud, id_usuario, fecha_final, prioridad, estado, fecha_asignacion) VALUES (?, ?, ?, ?, ?, ?)");
//            stm.setInt(1, id_solicitud);
//            stm.setInt(2, id_usuario);
//            stm.setLong(3, fecha_final);
//            stm.setInt(4, prioridad);
//            stm.setInt(5, 1);
//            stm.setLong(6, unixTime);
//            stm.executeUpdate();
//
//            PreparedStatement stm2 = cn.prepareStatement("UPDATE hd_solicitud SET estado = 2 WHERE id_solicitud = ?");
//            stm2.setInt(1, id_solicitud);
//            stm2.executeUpdate();
//            result = 1;
//
//        } catch (Exception ex) {
//            result = 2;
//
//        }
//        con.desconectar();
//        return result;
//    }
}
