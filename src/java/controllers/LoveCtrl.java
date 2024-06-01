/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import models.*;

/**
 *
 * @author thanh
 */
public class LoveCtrl extends HttpServlet {

    DAO d;

    public void init() {
        d = new DAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoveCtrl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoveCtrl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("type") != null && request.getParameter("sid") != null) {
            int type = Integer.parseInt(request.getParameter("type"));
            int sid = Integer.parseInt(request.getParameter("sid"));
            HttpSession ses = request.getSession();
            if (ses.getAttribute("user_ses") != null) {
                Account a = (Account) ses.getAttribute("user_ses");
                d.updateFavoritesSong(type, a.getId(), sid);
            }
            response.setContentType("text/plain");
            response.getWriter().write("get " + (d.getStatus() != null ? d.getStatus() : "suggest"));
        }
        if (request.getParameter("access") != null) {
            if (request.getParameter("access").equals("true")) {

                HttpSession ses = request.getSession();

                if (ses.getAttribute("user_ses") != null) {
                    Account a = (Account) ses.getAttribute("user_ses");
                    List<Integer> listL = d.getListSongByFavorites(a.getId());
                    request.setAttribute("listL", listL);

                    List<Song> listS = d.getListSongFavoritesByUserId(a.getId());
                    request.setAttribute("listS", listS);
                }

                request.getRequestDispatcher("/views/LovePage.jsp").forward(request, response);
            }
        }

    }

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
