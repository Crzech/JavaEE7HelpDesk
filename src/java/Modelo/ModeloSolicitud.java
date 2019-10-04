/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
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
        try {
            Statement stm = cn.createStatement();
            ResultSet set = stm.executeQuery("SELECT * FROM hd_solicitud WHERE usuario_id = '" + id_usuario + "'");
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
    
    
    
}
