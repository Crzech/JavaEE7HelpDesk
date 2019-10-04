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
public class ModeloUsuario {
    public int id_usuario;
    public String username;
    public String nombre;
    public String apellido;
    public int perfil;
    public ModeloDepartamentos departamento;
    public String password;
    public int estado;
    
    
    public ModeloUsuario() {
        
    }
    
    public ModeloUsuario(String username) {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            Statement stm = cn.createStatement();
            ResultSet set = stm.executeQuery("SELECT * FROM hd_usuario WHERE username = '" + username + "'");
            while (set.next()) {
                this.username = set.getString("username");
                this.nombre = set.getString("nombre");
                this.apellido = set.getString("apellido");
                this.perfil = set.getInt("perfil");
            }
        } catch (Exception ex) {
            
        }
        con.desconectar();
    }

    public String getUsername() {
        return username;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public int getPerfil() {
        return perfil;
    }

    public int getId_usuario() {
        return id_usuario;
    }


    public ModeloDepartamentos getDepartamento() {
        return departamento;
    }

    public String getPassword() {
        return password;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    

    public void setPassword(String password) {
        this.password = password;
    }
    
    

    public void setDepartamento(ModeloDepartamentos departamento) {
        this.departamento = departamento;
    }
    
    

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
    

    public void setUsername(String username) {
        this.username = username;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setPerfil(int perfil) {
        this.perfil = perfil;
    }
    
    
    
    public boolean verificarUsuario(String username, String password) {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        boolean respuesta = false;
        try {
            Statement stm = cn.createStatement();
            ResultSet set = stm.executeQuery("SELECT * FROM hd_usuario WHERE username = '" + username + "' AND password = '" + password + "'");
            while (set.next()) {
                respuesta = true;
            }
        } catch (Exception ex) {
            
        }
        con.desconectar();
        return respuesta;
    }
    
    public ArrayList<ModeloUsuario> getList() {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        ArrayList<ModeloUsuario> list = new ArrayList<>();
        int contador = 0;
        try {
            Statement stm = cn.createStatement();
            ResultSet set = stm.executeQuery("SELECT * FROM hd_usuario WHERE estado = 1 AND perfil != 1");
            while (set.next()) {
                ModeloUsuario usuario = new ModeloUsuario();
                usuario.setId_usuario(set.getInt("id_usuario"));
                usuario.setUsername(set.getString("username"));
                usuario.setNombre(set.getString("nombre"));
                usuario.setApellido(set.getString("apellido"));
                usuario.setPerfil(set.getInt("perfil"));
                usuario.setDepartamento(new ModeloDepartamentos(set.getInt("departamento_id")));
                list.add(usuario);
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
            Statement stmexistentes = cn.createStatement();
            ResultSet rs = stmexistentes.executeQuery("SELECT * FROM hd_usuario WHERE estado = 1 AND username = '" + this.getUsername() + "'");
            int counter = 0;
            while(rs.next()) {
                counter += 1;
            }
            if(counter < 1) {
                PreparedStatement stm = cn.prepareStatement("INSERT INTO hd_usuario (username, password, nombre, apellido, perfil, estado, departamento_id) VALUES (?, ?, ?, ?, ?, ?, ?)");
                stm.setString(1, this.getUsername());
                stm.setString(2, this.getPassword());
                stm.setString(3, this.getNombre());
                stm.setString(4, this.getApellido());
                stm.setInt(5, this.getPerfil());
                stm.setInt(6, this.getEstado());
                stm.setInt(7, this.getDepartamento().getId_departamento());
                stm.executeUpdate();
                result = 1;
            } else {
                result = 2;
            }
        } catch (Exception ex) {
            result = 3;
            
        }
        con.desconectar();
        return result;
    }
    
    public int update(){
       int result = 0;
       Conexion con = new Conexion();
       con.conectar();
       Connection cn = con.getCn();
       try {
           Statement stmexistentes = cn.createStatement();
            ResultSet rs = stmexistentes.executeQuery("SELECT * FROM hd_usuario WHERE estado = 1 AND username = '" + this.getUsername() + "' AND id_usuario != '" + this.getId_usuario() + "'");
            int counter = 0;
            while(rs.next()) {
                counter += 1;
            }
            if(counter < 1) {
                PreparedStatement stm = cn.prepareStatement("UPDATE hd_usuario SET username = ?, password = ?, nombre = ?, apellido = ?, perfil = ?, departamento_id = ? WHERE id_usuario = ?");
                stm.setString(1, this.getUsername());
                stm.setString(2, this.getPassword());
                stm.setString(3, this.getNombre());
                stm.setString(4, this.getApellido());
                stm.setInt(5, this.getPerfil());
                stm.setInt(6, this.getDepartamento().getId_departamento());
                stm.setInt(7, this.getId_usuario());
                stm.executeUpdate();
                result = 1;
            } else {
                result = 2;
            }
       } catch (Exception ex) {
           result = 3;
       }
       con.desconectar();
       return result;
   }

   public int delete(){
       int result = 0;
       Conexion con = new Conexion();
       con.conectar();
       Connection cn = con.getCn();
       try {
           PreparedStatement stm = cn.prepareStatement("UPDATE hd_usuario SET estado = 0 WHERE id_usuario = ?");
           stm.setInt(1, this.getId_usuario());
           stm.executeUpdate();
           result = 1;
       } catch (Exception ex) {
           result = 2;
       }
       con.desconectar();
       return result;
   }
   
   public ModeloUsuario(int id_usuario) {
        Conexion con = new Conexion();
        con.conectar();
        Connection cn = con.getCn();
        try {
            Statement stm = cn.createStatement();
            ResultSet set = stm.executeQuery("SELECT * FROM hd_usuario WHERE id_usuario = '" + id_usuario + "'");
            while (set.next()) {
                this.id_usuario = set.getInt("id_usuario");
                this.username = set.getString("username");
                this.password = set.getString("password");
                this.nombre = set.getString("nombre");
                this.apellido = set.getString("apellido");
                this.perfil = set.getInt("perfil");
                this.estado = set.getInt("estado");
                this.departamento = new ModeloDepartamentos(set.getInt("departamento_id"));
            }
        } catch (Exception ex) {
            
        }
        con.desconectar();
   }
}
