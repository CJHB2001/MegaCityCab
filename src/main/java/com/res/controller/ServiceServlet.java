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
import com.res.model.Service;
import service.ServiceService;

@WebServlet("/service")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 5,
                 maxRequestSize = 1024 * 1024 * 5 * 5)
public class ServiceServlet extends HttpServlet {
    private ServiceService serviceService = new ServiceService();
    private static final String UPLOAD_DIRECTORY = "service_images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("edit".equals(action)) {
            int serviceId = Integer.parseInt(request.getParameter("id"));
            try {
                Service service = serviceService.getServiceById(serviceId);
                request.setAttribute("service", service);
                request.getRequestDispatcher("/AdminArea/edit_service.jsp").forward(request, response);
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/AdminArea/service.jsp");
            }
        } else if ("delete".equals(action)) {
            int serviceId = Integer.parseInt(request.getParameter("id"));
            try {
                serviceService.deleteService(serviceId);
                session.setAttribute("alertMessage", "Service deleted successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/service.jsp");
        } else {
            try {
                request.setAttribute("serviceList", serviceService.getAllServices());
                request.getRequestDispatcher("/AdminArea/service_index.jsp").forward(request, response);
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/AdminArea/service.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String serviceName = request.getParameter("serviceName");
            String description = request.getParameter("description");

            try {
                Service service = serviceService.getServiceById(id);
                service.setServiceName(serviceName);
                service.setDescription(description);

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
                    service.setImagePath(UPLOAD_DIRECTORY + File.separator + newFileName);
                }

                serviceService.updateService(service);
                session.setAttribute("alertMessage", "Service updated successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/service.jsp");
        } else {
            String serviceName = request.getParameter("serviceName");
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
            Service service = new Service(serviceName, description, imagePath);

            try {
                serviceService.addService(service);
                session.setAttribute("alertMessage", "New service added successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/service.jsp");
        }
    }
}
