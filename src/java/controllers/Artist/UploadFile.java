package controllers.Artist;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.*;
import common.*;
import java.io.File;
import models.Account;

// @author thanh
@WebServlet("/UploadFileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50) // 50 MB
public class UploadFile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadFile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadFile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession ses = request.getSession();
        Account a = (Account) ses.getAttribute("user_ses");
        if (a != null && a.getRole() == 2) {
            if (request.getParameter("cancle") != null) {
                request.getRequestDispatcher("/views/InputFile.jsp").forward(request, response);
            }
            request.getRequestDispatcher("/views/InputFile.jsp").forward(request, response);

        } else {
            request.getRequestDispatcher("/views/forbiden.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String basePath = "D:\\Music\\Music\\web\\resources\\songs";
        Part filePart = request.getPart("mp3File");
        String fileName = filePart.getSubmittedFileName();
        String outputPath;

        String title = request.getParameter("title");
        String artist = request.getParameter("artist");
        String album = request.getParameter("album");
        String genre = request.getParameter("genre");
        String releaseDate = request.getParameter("rdate");

        outputPath = basePath + "\\" + album + "\\" + fileName;

        File directory = new File(basePath + "\\" + album);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        if (request.getParameter("loadData") != null) {
            request.setAttribute("showAlert", true);
        }

        String status = FileUtils.writeFile(filePart, outputPath);

        request.setAttribute("title_d", title);
        request.setAttribute("artist_d", artist);
        request.setAttribute("album_d", album);
        request.setAttribute("genre_d", genre);
        request.setAttribute("rdate_d", releaseDate);
        request.setAttribute("filePath", fileName);
        request.setAttribute("output", status);
        doGet(request, response);
    }

    private String getSubmittedFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private void loadData() {

    }

    //Returns a short description of the servlet.
    //@return a String containing servlet description
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
