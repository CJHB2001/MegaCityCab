package com.res.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.res.model.Contact;
import service.ContactService;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private ContactService contactService = new ContactService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("delete".equals(action)) {
            int contactId = Integer.parseInt(request.getParameter("id"));
            try {
                contactService.deleteContact(contactId);
                session.setAttribute("alertMessage", "Message deleted successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/contact.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Contact contact = new Contact(fullName, phone, email, message);
        HttpSession session = request.getSession();

        try {
            contactService.addContact(contact);
            session.setAttribute("alertMessage", "Your message has been sent successfully!");
            session.setAttribute("alertType", "success");
        } catch (SQLException e) {
            session.setAttribute("alertMessage", "Error: " + e.getMessage());
            session.setAttribute("alertType", "danger");
        }
        response.sendRedirect(request.getContextPath() + "/PublicArea/contactUs.jsp");
    }
}