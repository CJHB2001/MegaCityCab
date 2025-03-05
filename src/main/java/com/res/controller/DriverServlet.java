// Updated DriverServlet for profile photo handling
package com.res.controller;

import java.io.IOException;
import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.res.model.User;
import com.res.model.UserRole;
import service.UserService;

@WebServlet("/driver")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, 
    maxFileSize = 1024 * 1024 * 5,  
    maxRequestSize = 1024 * 1024 * 10 
)
public class DriverServlet extends HttpServlet {
    private UserService userService = new UserService();
    private static final String UPLOAD_DIRECTORY = "uploads/profile-photos";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	  String action = request.getParameter("action");
          HttpSession session = request.getSession();

          if ("delete".equals(action)) {
              int driverId = Integer.parseInt(request.getParameter("id"));
              try {
                  userService.deleteDriver(driverId);
                  session.setAttribute("alertMessage", "Driver deleted successfully!");
                  session.setAttribute("alertType", "success");
              } catch (Exception e) {
                  session.setAttribute("alertMessage", "Error: " + e.getMessage());
                  session.setAttribute("alertType", "danger");
              }
              response.sendRedirect(request.getContextPath() + "/AdminArea/driver.jsp");
          }
      }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        // Create uploads directory if it doesn't exist
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String experience = request.getParameter("experience");
            String licenseId = request.getParameter("licenseId");
            String gender = request.getParameter("gender");

            try {
                // Check if the email already exists for another driver
                User existingDriver = userService.getDriverById(id);
                if (!existingDriver.getEmail().equals(email) && userService.isEmailExists(email)) {
                    session.setAttribute("alertMessage", "Error: Email already exists!");
                    session.setAttribute("alertType", "danger");
                    response.sendRedirect(request.getContextPath() + "/AdminArea/driver.jsp");
                    return;
                }

                User driver = userService.getDriverById(id);
                driver.setEmail(email);

                // Only update password if new one is provided
                if (password != null && !password.trim().isEmpty()) {
                    driver.setPassword(password);
                }

                driver.setName(name);
                driver.setAge(age);
                driver.setExperience(experience);
                driver.setLicenseId(licenseId);
                driver.setGender(gender);

                // Handle profile photo update
                Part filePart = request.getPart("profilePhoto");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = getUniqueFileName(getFileName(filePart));
                    String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
                    filePart.write(uploadPath + File.separator + fileName);
                    driver.setProfilePhoto(filePath);
                }

                userService.updateDriver(driver);
                session.setAttribute("alertMessage", "Driver updated successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/driver.jsp");
        } else if ("add".equals(action)) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String experience = request.getParameter("experience");
            String licenseId = request.getParameter("licenseId");
            String gender = request.getParameter("gender");

            try {
                if (userService.isEmailExists(email)) {
                    session.setAttribute("alertMessage", "Error: Email already exists!");
                    session.setAttribute("alertType", "danger");
                    response.sendRedirect(request.getContextPath() + "/AdminArea/driver.jsp");
                    return;
                }

                User driver = new User();
                driver.setEmail(email);
                driver.setPassword(password);
                driver.setRole(UserRole.DRIVER); 
                driver.setName(name);
                driver.setAge(age);
                driver.setExperience(experience);
                driver.setLicenseId(licenseId);
                driver.setGender(gender);

                Part filePart = request.getPart("profilePhoto");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = getUniqueFileName(getFileName(filePart));
                    String filePath = UPLOAD_DIRECTORY + File.separator + fileName;
                    filePart.write(uploadPath + File.separator + fileName);
                    driver.setProfilePhoto(filePath);
                } else {
                    driver.setProfilePhoto("assets/images/default-profile.png");
                }

                userService.addDriver(driver);
                session.setAttribute("alertMessage", "New driver added successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/driver.jsp");
        }
    }
    
    // Helper method to get file name from HTTP header
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "unknown";
    }
    
    // Helper method to generate unique file name
    private String getUniqueFileName(String originalFileName) {
        String extension = "";
        if (originalFileName.contains(".")) {
            extension = originalFileName.substring(originalFileName.lastIndexOf("."));
        }
        return UUID.randomUUID().toString() + extension;
    }
}