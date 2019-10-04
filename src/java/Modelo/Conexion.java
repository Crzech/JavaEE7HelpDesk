/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author christianpernillo
 */
public class Conexion {
    public String driver, url, user, password;
    public Connection cn;
    
    public Conexion() {

        this.driver="oracle.jdbc.OracleDriver";

        this.url="jdbc:oracle:thin:@//localhost:1521/orcl";

        this.user="hd_progra2";

        this.password="hd_progra2";

        this.cn = null;

    }
    public String conectar() {
        try {
            Class.forName(this.driver);
            cn = DriverManager.getConnection(this.url, this.user, 
                    this.password);
            return "Ok";
        } catch (Exception ex) {
            return "Error: Descripcion: " + ex.toString();
        }
    }
    
    public String desconectar() {
        try {
            cn.close();
            return "OK";
        } catch (Exception ex) {
            return "Error: Descripcion: " + ex.toString();
        }
    }

    public Connection getCn() {
        return cn;
    }
    
    
}
