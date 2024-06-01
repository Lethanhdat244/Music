/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import models.*;

/**
 *
 * @author thanh
 */
public class SongsCtrl extends HttpServlet {

    DAO d;

    public void init() {
        d = new DAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    String[] filterOptions = {"A-Z", "Artist", "Album", "Release Year"};

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        d.loadDB();
        request.setAttribute("dao", d);

        request.setAttribute("filters", filterOptions);
        String sql = "";
        if (request.getParameter("sort1") == null && request.getParameter("sort2") == null) {
            List<Song> listS = d.getSongList();
            if (request.getAttribute("albumId_a") != null) {
                listS = d.getListSongByAlbumId((int) request.getAttribute("albumId_a"));
            }
            request.setAttribute("listS", listS);
        }
        HttpSession ses = request.getSession();
        if (ses.getAttribute("user_ses") != null) {
            Account a = (Account) ses.getAttribute("user_ses");
            List<Integer> listL = d.getListSongByFavorites(a.getId());
            request.setAttribute("listL", listL);
        }
        request.getRequestDispatcher("/views/SongsLib.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        d.loadDB();
        int type = 0;
        List<Song> listS;
        // check sort 1
        if (request.getParameter("sort1") != null) {
            type = Integer.parseInt(request.getParameter("sort1"));
            request.setAttribute("type1", type);
        }
        listS = d.getSongList();
        // get sort2 
        if (request.getParameter("sort2") != null) {
            int gen = Integer.parseInt(request.getParameter("sort2"));
            listS = d.getListSongByGenId(gen);
            request.setAttribute("type2", gen);

        }
        listS = sort(listS, type);
        if (listS.isEmpty()) {
            request.setAttribute("anonn", "No table query");
        }
        request.setAttribute("listS", listS);

        doGet(request, response);
    }

    public List<Song> sort(List<Song> listS, int index) {

        if (index == 1) {
            Comparator<Song> artistNameComparator = Comparator.comparing(song -> song.getAlb().getArtist().getName());
            Collections.sort(listS, artistNameComparator);

        } else if (index == 2) {
            Comparator<Song> albumComparator = Comparator.comparing(song -> song.getAlb().getTitle());
            Collections.sort(listS, albumComparator);

        } else if (index == 3) {
            Comparator<Song> yearComparator = Comparator.comparing(song -> song.getAlb().getRdate());
            Collections.sort(listS, yearComparator);

        } else if (index == 0) {
            Comparator<Song> artistNameComparator = Comparator.comparing(song -> song.getTitle());
            Collections.sort(listS, artistNameComparator);
        }
        return listS;

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
