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
public class ModeloSolicitud {

    public int id_solicitud;
    public ModeloDepartamentos departamento;
    public int tipo_solicitud;
    public String Descripcion_solicitud;
    public int fecha_creacion;
    public ModeloUsuario usuario;
    public int estado;

    public ModeloSolicitud() {

    }

    public int getId_solicitud() {
        return id_solicitud;
    }

    public void setId_solicitud(int id_solicitud) {
        this.id_solicitud = id_solicitud;
    }

    public ModeloDepartamentos getDepartamento() {
        return departamento;
    }

    public void setDepartamento(ModeloDepartamentos departamento) {
        this.departamento = departamento;
    }

    public int getTipo_solicitud() {
        return tipo_solicitud;
    }

    public void setTipo_solicitud(int tipo_solicitud) {
        this.tipo_solicitud = tipo_solicitud;
    }

    public String getDescripcion_solicitud() {
        return Descripcion_solicitud;
    }

    public void setDescripcion_solicitud(String Descripcion_solicitud) {
        this.Descripcion_solicitud = Descripcion_solicitud;
    }

    public int getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(int fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public ModeloUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(ModeloUsuario usuario) {
        this.usuario = usuario;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public ArrayList<ModeloSolicitud> getList(int id_usuario) {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        ArrayList<ModeloSolicitud> list = new ArrayList<>();
        int contador = 0;
        ModeloUsuario currentUser = new ModeloUsuario(id_usuario);
        try {
            Statement stm = cn.createStatement();
            ResultSet set;
            if(currentUser.getPerfil() != 1) {
                set = stm.executeQuery("SELECT * FROM hd_solicitud WHERE usuario_id = '" + id_usuario + "' AND estado != 0");
            } else {
                set = stm.executeQuery("SELECT * FROM hd_solicitud WHERE estado != 0");
            }
            while (set.next()) {
                ModeloSolicitud solicitud = new ModeloSolicitud();
                solicitud.setId_solicitud(set.getInt("id_solicitud"));
                solicitud.setDepartamento(new ModeloDepartamentos(set.getInt("id_departamento")));
                solicitud.setTipo_solicitud(set.getInt("tipo_solicitud"));
                solicitud.setDescripcion_solicitud(set.getString("descripcion_solicitud"));
                solicitud.setFecha_creacion(set.getInt("fecha_creacion"));
                solicitud.setUsuario(new ModeloUsuario(set.getInt("usuario_id")));
                solicitud.setEstado(set.getInt("estado"));

                list.add(solicitud);
            }
        } catch (Exception ex) {

        }
        con.desconectar();
        return list;
    }

    public int save() {
        int result = 0;
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            long unixTime = System.currentTimeMillis() / 1000L;
            PreparedStatement stm = cn.prepareStatement("INSERT INTO hd_solicitud (id_departamento, tipo_solicitud, descripcion_solicitud, fecha_creacion, usuario_id, estado) VALUES (?, ?, ?, ?, ?, ?)");
            stm.setInt(1, this.getDepartamento().getId_departamento());
            stm.setInt(2, this.getTipo_solicitud());
            stm.setString(3, this.getDescripcion_solicitud());
            stm.setLong(4, unixTime);
            stm.setInt(5, this.getUsuario().getId_usuario());
            stm.setInt(6, this.getEstado());
            stm.executeUpdate();
            result = 1;

        } catch (Exception ex) {
            result = 2;

        }
        con.desconectar();
        return result;
    }

    public int update() {
        int result = 0;
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            PreparedStatement stm = cn.prepareStatement("UPDATE hd_solicitud SET id_departamento = ?, tipo_solicitud = ?, descripcion_solicitud = ? WHERE id_solicitud = ?");
            stm.setInt(1, this.getDepartamento().getId_departamento());
            stm.setInt(2, this.getTipo_solicitud());
            stm.setString(3, this.getDescripcion_solicitud());
            stm.setInt(4, this.getId_solicitud());
            stm.executeUpdate();
            result = 1;
        } catch (Exception ex) {
            result = 2;
        }
        con.desconectar();
        return result;
    }

    public int delete() {
        int result = 0;
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            PreparedStatement stm = cn.prepareStatement("UPDATE hd_solicitud SET estado = 0 WHERE id_solicitud = ?");
            stm.setInt(1, this.getId_solicitud());
            stm.executeUpdate();
            result = 1;
        } catch (Exception ex) {
            result = 2;
        }
        con.desconectar();
        return result;
    }

    public ModeloSolicitud(int id_solicitud) {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            Statement stm = cn.createStatement();
            ResultSet set = stm.executeQuery("SELECT * FROM hd_solicitud WHERE id_solicitud = '" + id_solicitud + "'");
            while (set.next()) {
                this.id_solicitud = set.getInt("id_solicitud");
                this.departamento = new ModeloDepartamentos(set.getInt("id_departamento"));
                this.tipo_solicitud = set.getInt("tipo_solicitud");
                this.Descripcion_solicitud = set.getString("descripcion_solicitud");
                this.fecha_creacion = set.getInt("fecha_creacion");
                this.usuario = new ModeloUsuario(set.getInt("usuario_id"));
                this.estado = set.getInt("estado");
            }
        } catch (Exception ex) {

        }
        con.desconectar();
    }

}
