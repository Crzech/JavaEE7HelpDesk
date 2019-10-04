/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ModeloDepartamentos;
import Modelo.ModeloSolicitud;
import Modelo.ModeloUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author christianpernillo
 */
public class srvSolicitudController extends HttpServlet {

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
            ModeloSolicitud nueva_solicitud = new ModeloSolicitud();
            int result;
            int action;
            if (request.getParameter("solicitud_id") != null && "update".equals(request.getParameter("action_formulario"))) {
                nueva_solicitud.setDepartamento(new ModeloDepartamentos(Integer.parseInt(request.getParameter("idDepartamento"))));
                nueva_solicitud.setTipo_solicitud(Integer.parseInt(request.getParameter("tipoSolicitud")));
                nueva_solicitud.setDescripcion_solicitud(request.getParameter("descSolicitud"));
                HttpSession session = request.getSession();
                nueva_solicitud.setUsuario(new ModeloUsuario(session.getAttribute("username").toString()));
                nueva_solicitud.setId_solicitud(Integer.parseInt(request.getParameter("solicitud_id")));
                
                result = nueva_solicitud.update();    

                action = 2;
            } else if (request.getParameter("solicitud_id") != null && "delete".equals(request.getParameter("action_formulario"))) {
                nueva_solicitud.setId_solicitud(Integer.parseInt(request.getParameter("usuario_id")));
                result = nueva_solicitud.delete();
                action = 3;
            } else {
                nueva_solicitud.setDepartamento(new ModeloDepartamentos(Integer.parseInt(request.getParameter("idDepartamento"))));
                nueva_solicitud.setTipo_solicitud(Integer.parseInt(request.getParameter("tipoSolicitud")));
                nueva_solicitud.setDescripcion_solicitud(request.getParameter("descSolicitud"));
                HttpSession session = request.getSession();
                nueva_solicitud.setUsuario(new ModeloUsuario(session.getAttribute("username").toString()));
                nueva_solicitud.setEstado(1);
                result = nueva_solicitud.save();  
                action = 1;
            }
            request.setAttribute("processed", true);
            request.setAttribute("action", action);
            request.setAttribute("result", result);
            RequestDispatcher rd = request.getRequestDispatcher("usuarios.jsp");
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
