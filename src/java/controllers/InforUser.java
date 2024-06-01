/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;
import common.*;
import java.util.Date;

/**
 *
 * @author thanh
 */
public class InforUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    LoginDAO d;

    public void init() {
        d = new LoginDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InforUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InforUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    boolean editSign;
    boolean passSign;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();
        Account a = (Account) ses.getAttribute("user_ses");
        request.setAttribute("use", a);
        request.getRequestDispatcher("/views/profileUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("editBtn") != null) {
            request.setAttribute("editSign", !editSign);
            editSign = !editSign;
            doGet(request, response);
        }
        if (request.getParameter("submitBtn") != null) {
            String fullname = request.getParameter("fullName_f");
            String email = request.getParameter("email_f");
            String genderParam = request.getParameter("gender_f");
            boolean gender = genderParam != null && genderParam.equals("true");
            String dateParam = request.getParameter("date_f");
            Date date = DateUtils.pasteDate(dateParam);

            HttpSession ses = request.getSession();
            Account a = (Account) ses.getAttribute("user_ses");

            d.updateAccount(fullname, email, gender, date, a.getUseName());

            Account c = d.getLogin(a.getUseName(), a.getPassword());
            ses.setAttribute("user_ses", c);

            doGet(request, response);
        }
        if (request.getParameter("btnChangePass") != null) {
            String f_oPass = request.getParameter("oldPass");
            String nPass = request.getParameter("newPass");
            String oPass = EnCodingUtils.encoding(f_oPass);

            HttpSession ses = request.getSession();
            if (ses.getAttribute("user_ses") != null) {
                Account a = (Account) ses.getAttribute("user_ses");
                if (oPass.equals(a.getPassword())) {
                    d.updatePass(nPass, a.getUseName());
                    request.setAttribute("mess", "update success ");
                } else {
                    request.setAttribute("mess", "wrong password");
                }
            }
            doGet(request, response);

        }
        if (request.getParameter("changePass") != null) {
            request.setAttribute("passSign", !passSign);
            doGet(request, response);
        }
        if (request.getParameter("mess") != null) {
            doGet(request, response);
        }
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
