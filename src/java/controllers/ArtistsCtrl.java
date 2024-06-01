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
import java.util.ArrayList;
import java.util.List;
import models.Album;
import models.Artist;

/**
 *
 * @author thanh
 */
public class ArtistsCtrl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ArtistsCtrl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ArtistsCtrl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    DAO d;

    @Override
    public void init() {
        d = new DAO();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        d.loadDB();
        request.setAttribute("dao", d);
        if (request.getParameter("type") != null) {
            int type = Integer.parseInt(request.getParameter("type"));
            if (type == 2) {
                int artId = Integer.parseInt(request.getParameter("artId"));
                List<Album> listA = new ArrayList<>();
                for (Artist a : d.getArt()) {
                    if (artId == a.getId()) {
                        request.setAttribute("art", a);
                    }
                }
                for (Album a : d.getAlb()) {
                    if (a.getArtist().getId() == artId) {
                        listA.add(a);
                    }
                }
                request.setAttribute("listA", listA);

                request.setAttribute("artId", artId);
                request.getRequestDispatcher("/views/ArtistInfo.jsp").forward(request, response);
            }
        }

        request.getRequestDispatcher("/views/ArtistLib.jsp").forward(request, response);

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
