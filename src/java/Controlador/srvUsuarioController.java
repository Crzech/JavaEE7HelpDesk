/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ModeloDepartamentos;
import Modelo.ModeloUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author christianpernillo
 */
public class srvUsuarioController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            ModeloUsuario nuevo_usuario = new ModeloUsuario();
            int result;
            int action;
            if (request.getParameter("usuario_id") != null && "update".equals(request.getParameter("action_formulario"))) {
               nuevo_usuario.setUsername(request.getParameter("username_usuario"));
                nuevo_usuario.setPassword(request.getParameter("password_usuario"));
                nuevo_usuario.setPerfil(Integer.parseInt(request.getParameter("perfil_usuario")));
                nuevo_usuario.setNombre(request.getParameter("nombre_usuario"));
                nuevo_usuario.setApellido(request.getParameter("apellido_usuario"));
                nuevo_usuario.setDepartamento(new ModeloDepartamentos(Integer.parseInt(request.getParameter("departamento_usuario"))));
                nuevo_usuario.setId_usuario(Integer.parseInt(request.getParameter("usuario_id")));
                result = nuevo_usuario.update();      
                action = 2;
            } else if (request.getParameter("usuario_id") != null && "delete".equals(request.getParameter("action_formulario"))) {
                nuevo_usuario.setId_usuario(Integer.parseInt(request.getParameter("usuario_id")));
                result = nuevo_usuario.delete();
                action = 3;
            } else {
                nuevo_usuario.setUsername(request.getParameter("username_usuario"));
                nuevo_usuario.setPassword(request.getParameter("password_usuario"));
                nuevo_usuario.setPerfil(Integer.parseInt(request.getParameter("perfil_usuario")));
                nuevo_usuario.setNombre(request.getParameter("nombre_usuario"));
                nuevo_usuario.setApellido(request.getParameter("apellido_usuario"));
                nuevo_usuario.setDepartamento(new ModeloDepartamentos(Integer.parseInt(request.getParameter("departamento_usuario"))));
                nuevo_usuario.setEstado(1);
                result = nuevo_usuario.save();  
                action = 1;
            }
            request.setAttribute("processed", true);
            request.setAttribute("action", action);
            request.setAttribute("result", result);
            RequestDispatcher rd = request.getRequestDispatcher("solicitudes.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
