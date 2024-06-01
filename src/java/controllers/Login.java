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
import jakarta.servlet.http.Cookie;

/**
 *
 * @author thanh
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private LoginDAO d;

    @Override
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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user_r");
        String pass = request.getParameter("pass_r");
        init();
        if (d.getLogin(user, pass) != null) {
            Account c = d.getLogin(user, pass);
            HttpSession ses = request.getSession();
            ses.setAttribute("user_ses", c);
            saveToCookie(request, response, c);
            response.sendRedirect(request.getContextPath() + "/Home");
        } else {
            request.setAttribute("error", "Wrong username or password!");
            doGet(request, response);
        }

    }

    private void saveToCookie(HttpServletRequest request, HttpServletResponse response, Account c) {
        String cValue = c.getUseName() + "-" + c.getPassword();
        HttpSession ses = request.getSession();
        Cookie cookie = new Cookie("user", cValue);
        cookie.setPath("/");
        cookie.setMaxAge(24 * 60 * 60);//24h
        response.addCookie(cookie);
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
