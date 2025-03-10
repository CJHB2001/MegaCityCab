package com.res.controller;

import com.res.model.User;
import com.res.model.UserRole;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")

public class LoginServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            // Validate the role parameter against the UserRole enum
            UserRole userRole = UserRole.fromString(role);

            int authResult = userService.authenticateUser(email, password, role);
            HttpSession session = request.getSession();
            
            switch (authResult) {
                case UserService.AUTH_SUCCESS:
                    User user = userService.getUserByEmail(email);
                    session.setAttribute("user", user); 
                    if (userRole == UserRole.ADMIN) {
                        response.sendRedirect(request.getContextPath() + "/AdminArea/dashboard.jsp");
                    } else if (userRole == UserRole.DRIVER) {
                    	
                        response.sendRedirect(request.getContextPath() + "/DriverArea/dashboard.jsp");
                    } else if (userRole == UserRole.CUSTOMER) {
                        response.sendRedirect(request.getContextPath() + "/CustomerArea/dashboard.jsp");
                    }
                    break;
                case UserService.INVALID_EMAIL:
                    session.setAttribute("error", "Invalid email");
                    response.sendRedirect(request.getContextPath() + "/AdminArea/login.jsp");
                    break;
                case UserService.INVALID_PASSWORD:
                    session.setAttribute("error", "Invalid password");
                    response.sendRedirect(request.getContextPath() + "/AdminArea/login.jsp");
                    break;
                case UserService.INVALID_ROLE:
                    session.setAttribute("error", "Invalid role");
                    response.sendRedirect(request.getContextPath() + "/AdminArea/login.jsp");
                    break;
                default:
                    session.setAttribute("error", "An error occurred during authentication");
                    response.sendRedirect(request.getContextPath() + "/AdminArea/login.jsp");
            }
        } catch (IllegalArgumentException e) {
            HttpSession session = request.getSession();
            session.setAttribute("error", "Invalid role selected");
            response.sendRedirect(request.getContextPath() + "/AdminArea/login.jsp");
        } catch (SQLException e) {
            throw new ServletException("Database error occurred", e);
        }
    }
}