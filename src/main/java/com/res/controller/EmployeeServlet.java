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
import com.res.model.Employee;
import service.EmployeeService;

@WebServlet("/employee")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 5,
                 maxRequestSize = 1024 * 1024 * 5 * 5)
public class EmployeeServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeService();
    private static final String UPLOAD_DIRECTORY = "profile_images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("edit".equals(action)) {
            int employeeId = Integer.parseInt(request.getParameter("id"));
            try {
                Employee employee = employeeService.getEmployeeById(employeeId);
                request.setAttribute("employee", employee);
             //   request.getRequestDispatcher("/AdminArea/edit_employee.jsp").forward(request, response);
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/AdminArea/employee_index.jsp");
            }
        } else if ("delete".equals(action)) {
            int employeeId = Integer.parseInt(request.getParameter("id"));
            try {
                employeeService.deleteEmployee(employeeId);
                session.setAttribute("alertMessage", "Employee deleted successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/employee_index.jsp");
        } else {
            try {
                request.setAttribute("userList", employeeService.getAllEmployees());
                request.getRequestDispatcher("/AdminArea/employee_index.jsp").forward(request, response);
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/AdminArea/employee_index.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String status = request.getParameter("status");

            try {
                Employee employee = employeeService.getEmployeeById(id);
                employee.setName(name);
                employee.setAge(age);
                employee.setEmail(email);
                employee.setRole(role);
                employee.setStatus(status);

                Part filePart = request.getPart("newProfileImage");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    String fileExtension = fileName.substring(fileName.lastIndexOf("."));
                    String newFileName = UUID.randomUUID().toString() + fileExtension;
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();
                    String filePath = uploadPath + File.separator + newFileName;
                    filePart.write(filePath);
                    employee.setProfileImagePath(UPLOAD_DIRECTORY + File.separator + newFileName);
                }

                employeeService.updateEmployee(employee);
                session.setAttribute("alertMessage", "Employee updated successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/employee_index.jsp");
        } else {
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String status = request.getParameter("status");

            Part filePart = request.getPart("profileImage");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = UUID.randomUUID().toString() + fileExtension;
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            String filePath = uploadPath + File.separator + newFileName;
            filePart.write(filePath);

            String profileImagePath = UPLOAD_DIRECTORY + File.separator + newFileName;
            Employee employee = new Employee(name, age, email, role, status, profileImagePath);

            try {
                employeeService.addEmployee(employee);
                session.setAttribute("alertMessage", "New employee added successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/employee_index.jsp");
        }
    }
}