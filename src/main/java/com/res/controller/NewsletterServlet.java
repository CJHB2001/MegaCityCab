package com.res.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.res.model.Newsletter;
import service.NewsletterService;

@WebServlet("/newsletter")
public class NewsletterServlet extends HttpServlet {
    private NewsletterService newsletterService = new NewsletterService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("delete".equals(action)) {
            int newsletterId = Integer.parseInt(request.getParameter("id"));
            try {
                newsletterService.deleteNewsletter(newsletterId);
                session.setAttribute("alertMessage", "Newsletter deleted successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/newsletter_index.jsp");
        } else {
            try {
                request.setAttribute("newsletterList", newsletterService.getAllNewsletters());
                request.getRequestDispatcher("/AdminArea/newsletter_index.jsp").forward(request, response);
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/AdminArea/newsletter_index.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        boolean agreement = "on".equals(request.getParameter("agreement"));

        Newsletter newsletter = new Newsletter(email, agreement);
        HttpSession session = request.getSession();

        try {
            newsletterService.addNewsletter(newsletter);
            session.setAttribute("alertMessage", "Thank you for subscribing to our newsletter!");
            session.setAttribute("alertType", "success");
        } catch (SQLException e) {
            session.setAttribute("alertMessage", "Error: " + e.getMessage());
            session.setAttribute("alertType", "danger");
        }
        response.sendRedirect(request.getContextPath() + "/PublicArea/index.jsp");
    }
}