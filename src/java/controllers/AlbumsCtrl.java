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
import java.util.List;
import models.*;

/**
 *
 * @author thanh
 */
public class AlbumsCtrl extends HttpServlet {

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
            out.println("<title>Servlet Albums</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Albums at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        d.loadDB();
        request.setAttribute("dao", d);
        // pagging - type = 1 
        paggingGet(request, response);
        // load more - type = 3
        int amount = 3;

        if (request.getParameter("type") != null) {
            int type = Integer.parseInt(request.getParameter("type"));
            if (type == 3) {
                if (request.getParameter("loadAmount") != null) {
                    amount = Integer.parseInt(request.getParameter("loadAmount")) + 4;
                }
            } else if (type == 2) {
                int albumId = Integer.parseInt(request.getParameter("albumId"));
                Album a = d.getListSongByAlbumId(albumId).get(0).getAlb();
                request.setAttribute("album_a", a);
                request.setAttribute("albumId_a", albumId);
                request.getRequestDispatcher("/Songs").forward(request, response);
            }
        }
        request.setAttribute("amount", amount);
        String type_p = request.getParameter("type");

        request.getRequestDispatcher("/views/AlbumsLib.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        paggingPost(request, response);
        doGet(request, response);

    }

    private void paggingGet(HttpServletRequest request, HttpServletResponse response) {
        int nrpp = 3;
        int index = -1;

        //get index from post
        if (request.getAttribute("index") != null) {
            index = (int) request.getAttribute("index");
            request.setAttribute("success", "get success + " + index);
        }

        Paging p = new Paging(nrpp, index, d.getAlb().size());
        p.calc();
        request.setAttribute("page", p);
    }

    private void paggingPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String h = (String) request.getParameter("input1");
        request.setAttribute("hello", h);
        int index = Integer.parseInt(request.getParameter("index"));
        int totalPage = Integer.parseInt(request.getParameter("totalPage"));

        if (request.getParameter("btnHome") != null) {
            index = 0;
        }
        if (request.getParameter("btnEnd") != null) {
            index = totalPage;
        }
        if (request.getParameter("btnPre") != null) {
            index -= 1;
        }
        if (request.getParameter("btnNext") != null) {
            index += 1;
        }

        for (int i = 0; i < totalPage; i++) {
            if (request.getParameter("btn" + i) != null) {
                index = i;
            }
        }
        request.setAttribute("index", index);
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
