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
import javax.servlet.http.HttpSession;
import dao.DAO;
import dto.Account;

public class LoginController extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        DAO ld = new DAO();
        Account acc = ld.checkAccount(id, pass);
        // nếu acc là null thì th đó ko tồn tại
        if (acc == null) {
            request.setAttribute("noti", "Incorrect UserID or Password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("ACC", acc);
            
            // Check the role and redirect accordingly
            if ("1".equals(acc.getRole())) {
                // Staff
                request.getRequestDispatcher("productList.jsp").forward(request, response);
            } else if ("0".equals(acc.getRole())) {
                // User
                request.getRequestDispatcher("productCart.jsp").forward(request, response);
            } else {
                // Handle other roles if needed
                request.setAttribute("noti", "Invalid role");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
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
