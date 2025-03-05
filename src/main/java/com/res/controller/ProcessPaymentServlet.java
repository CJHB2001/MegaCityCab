package com.res.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.res.dao.BookingDAO;

@WebServlet("/processPayment")
public class ProcessPaymentServlet extends HttpServlet {
    private BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        try {
            bookingDAO.updatePaymentStatus(bookingId, 1);
            session.setAttribute("paymentSuccess", true);
            response.sendRedirect(request.getContextPath() + "/PublicArea/payment.jsp");
        } catch (SQLException e) {
            session.setAttribute("paymentSuccess", false);
            session.setAttribute("alertMessage", "Error processing payment: " + e.getMessage());
            session.setAttribute("alertType", "danger");
            response.sendRedirect(request.getContextPath() + "/PublicArea/payment.jsp");
        }
    }
}