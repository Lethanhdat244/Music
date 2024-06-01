/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.Admin;

import dal.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import models.Account;

/**
 *
 * @author thanh
 */
public class ManagerAccount extends HttpServlet {

    LoginDAO d;

    public void init() {
        d = new LoginDAO();

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        Account a = (Account) ses.getAttribute("user_ses");
        if (a != null && a.getRole() == 0) {
            String[] roles = {"admin", "user", "artist"};
            List<Account> listA = d.getListAcc();
            request.setAttribute("listA", listA);
            request.setAttribute("roles", roles);

            request.getRequestDispatcher("/views/managerAccount1.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/views/forbiden.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
