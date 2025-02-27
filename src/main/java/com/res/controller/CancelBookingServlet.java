package com.res.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.res.dao.BookingDAO;
import com.res.model.Booking;
import service.BookingService;


@WebServlet("/cancel-booking")
public class CancelBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("id"));
        BookingDAO bookingDAO = new BookingDAO();
        HttpSession session = request.getSession();

        try {
            // Update booking status to 3 (cancelled)
            bookingDAO.updateBookingStatus(bookingId, 3);
            session.setAttribute("alertMessage", "Booking cancel successfully!");
            session.setAttribute("alertType", "success");
            response.sendRedirect(request.getContextPath() + "/PublicArea/bookingInfo.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/bookingInfo.jsp?cancelError=true");
        }
    }
}