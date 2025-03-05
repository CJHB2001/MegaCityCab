package com.res.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Date;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.res.model.Blog;
import service.BlogService;

@WebServlet("/blog")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 5,
                 maxRequestSize = 1024 * 1024 * 5 * 5)
public class BlogServlet extends HttpServlet {
    private BlogService blogService = new BlogService();
    private static final String UPLOAD_DIRECTORY = "blog_images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("edit".equals(action)) {
            int blogId = Integer.parseInt(request.getParameter("id"));
            try {
                Blog blog = blogService.getBlogById(blogId);
                request.setAttribute("blog", blog);
                request.getRequestDispatcher("/AdminArea/edit_blog.jsp").forward(request, response);
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/AdminArea/blog.jsp");
            }
        } else if ("delete".equals(action)) {
            int blogId = Integer.parseInt(request.getParameter("id"));
            try {
                blogService.deleteBlog(blogId);
                session.setAttribute("alertMessage", "Blog deleted successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/blog.jsp");
        } else {
            try {
                request.setAttribute("blogList", blogService.getAllBlogs());
                request.getRequestDispatcher("/AdminArea/blog_index.jsp").forward(request, response);
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/AdminArea/blog.jsp");
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
            Date date = new Date(); 
            String summary = request.getParameter("summary");

            try {
                Blog blog = blogService.getBlogById(id);
                blog.setTitle(title);
                blog.setDate(date);
                blog.setSummary(summary);

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
                    blog.setImagePath(UPLOAD_DIRECTORY + File.separator + newFileName);
                }

                blogService.updateBlog(blog);
                session.setAttribute("alertMessage", "Blog updated successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/blog.jsp");
        } else {
            String title = request.getParameter("title");
            Date date = new Date(); // Use the current date or parse from request
            String summary = request.getParameter("summary");

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
            Blog blog = new Blog(title, date, summary, imagePath);

            try {
                blogService.addBlog(blog);
                session.setAttribute("alertMessage", "New blog added successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/blog.jsp");
        }
    }
}