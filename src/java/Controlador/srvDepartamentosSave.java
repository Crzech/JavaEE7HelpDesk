/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ModeloDepartamentos;
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
public class srvDepartamentosSave extends HttpServlet {

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
            ModeloDepartamentos nuevo_departamento = new ModeloDepartamentos();
            boolean saved = false;
            boolean deleted = false;
            if (request.getParameter("departamento_id") != null && "update".equals(request.getParameter("action_formulario"))) {
                nuevo_departamento.setNombre_departamento(request.getParameter("nombre_departamento"));
                nuevo_departamento.setId_departamento(Integer.parseInt(request.getParameter("departamento_id")));
                saved = nuevo_departamento.update();      
            } else if (request.getParameter("departamento_id") != null && "delete".equals(request.getParameter("action_formulario"))) {
                nuevo_departamento.setId_departamento(Integer.parseInt(request.getParameter("departamento_id")));
                deleted = nuevo_departamento.delete();
                request.setAttribute("processed_delete", true);
                request.setAttribute("departamento_deleted", deleted);
            } else {
                nuevo_departamento.setNombre_departamento(request.getParameter("nombre_departamento"));
                saved = nuevo_departamento.save();
            }
            request.setAttribute("departamento_processed", true);
            request.setAttribute("departamento_saved", saved);
            RequestDispatcher rd = request.getRequestDispatcher("departamentos.jsp");
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
