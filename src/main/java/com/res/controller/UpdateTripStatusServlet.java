package com.res.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.res.dao.BookingDAO;

@WebServlet("/updateTripStatus")
public class UpdateTripStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("id"));
        int tripStatus = Integer.parseInt(request.getParameter("tripStatus"));
        HttpSession session = request.getSession();
        BookingDAO bookingDAO = new BookingDAO();
        try {
            bookingDAO.updateTripStatus(bookingId, tripStatus);
            session.setAttribute("alertMessage", "Trip Status Changed Successfully!");
            session.setAttribute("alertType", "success");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("alertMessage", "Failed to Update Trip Status!");
            session.setAttribute("alertType", "error");
        }
        response.sendRedirect(request.getContextPath() + "/DriverArea/rides.jsp");
    }
}