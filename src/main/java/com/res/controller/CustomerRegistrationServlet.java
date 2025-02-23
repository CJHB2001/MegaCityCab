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

@WebServlet("/register")
public class CustomerRegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String nicNumber = request.getParameter("nicNumber");

        HttpSession session = request.getSession();

        // Input Validations
        if (firstName == null || firstName.trim().isEmpty()) {
            session.setAttribute("error", "First Name is required.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/signUp.jsp");
            return;
        }

        if (lastName == null || lastName.trim().isEmpty()) {
            session.setAttribute("error", "Last Name is required.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/signUp.jsp");
            return;
        }

        if (phone == null || !phone.matches("\\d{10}")) {
            session.setAttribute("error", "Phone number must be 10 digits.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/signUp.jsp");
            return;
        }

        if (email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            session.setAttribute("error", "Invalid email address.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/signUp.jsp");
            return;
        }

        if (password == null || password.length() < 8) {
            session.setAttribute("error", "Password must be at least 8 characters long.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/signUp.jsp");
            return;
        }

        if (addressLine1 == null || addressLine1.trim().isEmpty()) {
            session.setAttribute("error", "Address Line 1 is required.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/signUp.jsp");
            return;
        }

        if (nicNumber == null || !nicNumber.matches("\\d{9}[Vv]")) {
            session.setAttribute("error", "NIC number must be 9 digits followed by 'V' or 'v'.");
            response.sendRedirect(request.getContextPath() + "/PublicArea/signUp.jsp");
            return;
        }

        // Check if email or phone already exists
        CustomerService customerService = new CustomerService();
        try {
            if (customerService.isEmailExists(email)) {
                session.setAttribute("error", "Email already exists.");
                response.sendRedirect(request.getContextPath() + "/PublicArea/signUp.jsp");
                return;
            }

            if (customerService.isPhoneExists(phone)) {
                session.setAttribute("error", "Phone number already exists.");
                response.sendRedirect(request.getContextPath() + "/PublicArea/signUp.jsp");
                return;
            }

            // Generate a registration number
            String registrationNumber = customerService.generateRegistrationNumber();

            // Create a new customer
            Customer customer = new Customer();
            customer.setFirstName(firstName);
            customer.setLastName(lastName);
            customer.setPhone(phone);
            customer.setEmail(email);
            customer.setPassword(password); // In a real application, hash the password
            customer.setAddressLine1(addressLine1);
            customer.setAddressLine2(addressLine2);
            customer.setNicNumber(nicNumber);
            customer.setRegistrationNumber(registrationNumber);

            // Add the customer to the database
            boolean isSuccess = customerService.addCustomer(customer);
            if (isSuccess) {
                session.setAttribute("success", "Registration successful! Your registration number is: " + registrationNumber);
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            } else {
                session.setAttribute("error", "Registration failed. Please try again.");
                response.sendRedirect(request.getContextPath() + "/register.jsp");
            }
        } catch (SQLException e) {
            session.setAttribute("error", "Database error: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "//PublicArea/signUp.jsp");
        }
    }
}