/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DAO;
import dto.Mobile;

/**
 *
 * @author Tuấn Anh
 */
public class UpdateController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "SearchController";
        try {
            // Retrieve parameters from the request
            String mobileId = request.getParameter("mobileId");
            String description = request.getParameter("description");
            float price = Float.parseFloat(request.getParameter("price"));
            String mobileName = request.getParameter("mobileName");
            int yearOfProduction = Integer.parseInt(request.getParameter("yearOfProduction"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Parse notSale parameter as an integer
            int notSaleInt = Integer.parseInt(request.getParameter("notSale"));

            // Convert notSaleInt to boolean (1 represents true, 0 represents false)
            boolean notSale = notSaleInt == 1;

            Mobile mobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);
            DAO dao = new DAO();
            boolean checkUpdate = dao.Update(mobile);

            if (checkUpdate) {
                url = "SearchController";
                request.setAttribute("noti", "Update successful");
            } else {
                request.setAttribute("noti", "Update fail");
            }
        } catch (Exception e) {
            // Handle exceptions properly
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
