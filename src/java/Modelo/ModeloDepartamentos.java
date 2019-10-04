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
public class ModeloDepartamentos {
    public int id_departamento;
    public String nombre_departamento;
    
    public ModeloDepartamentos() {
        
    }

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getNombre_departamento() {
        return nombre_departamento;
    }

    public void setNombre_departamento(String nombre_departamento) {
        this.nombre_departamento = nombre_departamento;
    }
    
    public ArrayList<ModeloDepartamentos> getList() {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        ArrayList<ModeloDepartamentos> list = new ArrayList<>();
        int contador = 0;
        try {
            Statement stm = cn.createStatement();
            ResultSet set = stm.executeQuery("SELECT * FROM hd_departamento");
            while (set.next()) {
                ModeloDepartamentos departamento = new ModeloDepartamentos();
                departamento.setId_departamento(set.getInt("id_departamento"));
                departamento.setNombre_departamento(set.getString("nombre_departamento"));
                list.add(departamento);
            }
        } catch (Exception ex) {
            
        }
        con.desconectar();
        return list;
    }
    
    public boolean save() {
        boolean saved = false;
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            PreparedStatement stm = cn.prepareStatement("INSERT INTO hd_departamento (nombre_departamento) VALUES (?)");
            stm.setString(1, this.nombre_departamento);
            stm.executeUpdate();
            saved = true;
        } catch (Exception ex) {
            saved = false;
        }
        con.desconectar();
        return saved;
    }
    public ModeloDepartamentos(int id_departamento) {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            Statement stm = cn.createStatement();
            ResultSet set = stm.executeQuery("SELECT * FROM hd_departamento WHERE id_departamento = '" + id_departamento + "'");
            while (set.next()) {
                this.id_departamento = set.getInt("id_departamento");
                this.nombre_departamento = set.getString("nombre_departamento");
            }
        } catch (Exception ex) {
            
        }
        con.desconectar();
    }
    
    public boolean update()
    {
        boolean saved = false;
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            PreparedStatement stm = cn.prepareStatement("UPDATE hd_departamento SET nombre_departamento = ? WHERE id_departamento = ?");
            stm.setString(1, this.nombre_departamento);
            stm.setInt(2, this.id_departamento);
            stm.executeUpdate();
            saved = true;
        } catch (Exception ex) {
            saved = false;
        }
        con.desconectar();
        return saved;
    }
    
    public boolean delete(){
        boolean deleted = false;
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            PreparedStatement stm = cn.prepareStatement("DELETE FROM hd_departamento WHERE id_departamento = ?");
            stm.setInt(1, this.id_departamento);
            stm.executeUpdate();
            deleted = true;
        } catch (Exception ex) {
            deleted = false;
        }
        con.desconectar();
        return deleted;
    }
}
