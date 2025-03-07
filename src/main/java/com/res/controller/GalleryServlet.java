package com.res.controller;



import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.res.model.Gallery;
import service.GalleryService;

@WebServlet("/gallery")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 5,
                 maxRequestSize = 1024 * 1024 * 5 * 5)
public class GalleryServlet extends HttpServlet {
    GalleryService galleryService = new GalleryService();
    private static final String UPLOAD_DIRECTORY = "gallery_images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("edit".equals(action)) {
            int galleryId = Integer.parseInt(request.getParameter("id"));
            try {
                Gallery gallery = galleryService.getGalleryById(galleryId);
                request.setAttribute("gallery", gallery);

            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/AdminArea/gallery.jsp");
            }
        } else if ("delete".equals(action)) {
            int galleryId = Integer.parseInt(request.getParameter("id"));
            try {
                galleryService.deleteGallery(galleryId);
                session.setAttribute("alertMessage", "Gallery deleted successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/gallery.jsp");
        } else {
            try {
                request.setAttribute("galleryList", galleryService.getAllGalleries());
                request.getRequestDispatcher("/AdminArea/gallery_index.jsp").forward(request, response);
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/AdminArea/gallery.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");

            try {
                Gallery gallery = galleryService.getGalleryById(id);
                gallery.setTitle(title);
                gallery.setDescription(description);

                Part filePart = request.getPart("newImage");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    String fileExtension = fileName.substring(fileName.lastIndexOf("."));
                    String newFileName = UUID.randomUUID().toString() + fileExtension;
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();
                    String filePath = uploadPath + File.separator + newFileName;
                    filePart.write(filePath);
                    gallery.setImagePath(UPLOAD_DIRECTORY + File.separator + newFileName);
                }

                galleryService.updateGallery(gallery);
                session.setAttribute("alertMessage", "Gallery updated successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/gallery.jsp");
        } else {
            String title = request.getParameter("title");
            String description = request.getParameter("description");

            Part filePart = request.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = UUID.randomUUID().toString() + fileExtension;
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            String filePath = uploadPath + File.separator + newFileName;
            filePart.write(filePath);

            String imagePath = UPLOAD_DIRECTORY + File.separator + newFileName;
            Gallery gallery = new Gallery(title, description, imagePath);

            try {
                galleryService.addGallery(gallery);
                session.setAttribute("alertMessage", "New gallery added successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/gallery.jsp");
        }
    }

	
}