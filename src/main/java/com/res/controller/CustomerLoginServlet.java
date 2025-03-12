package com.res.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.res.model.Customer;
import service.CustomerService;

@WebServlet("/customerLogin")
public class CustomerLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        // Input Validations
        if (email == null || email.trim().isEmpty()) {
            session.setAttribute("error", "Email is required.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/signIn.jsp");
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            session.setAttribute("error", "Password is required.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/signIn.jsp");
            return;
        }

        // Validate the customer
        CustomerService customerService = new CustomerService();
        try {
            Customer customer = customerService.validateCustomer(email, password);
            if (customer != null) {
    
                session.setAttribute("customer", customer); 
                session.removeAttribute("error"); 
                response.sendRedirect(request.getContextPath() + "/PublicArea/index.jsp"); 
            } else {
        
                session.setAttribute("error", "Invalid email or password.");
                response.sendRedirect(request.getContextPath() + "/PublicArea/signIn.jsp");
            }
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/PublicArea/signIn.jsp");
        }
    }
}