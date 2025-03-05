package com.res.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.res.model.Booking;
import service.BookingService;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {
    private BookingService bookingService = new BookingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        try {
            Booking booking = bookingService.getBookingById(bookingId);


            if (booking != null) {
                System.out.println("Booking ID: " + booking.getId());
                System.out.println("Customer Name: " + booking.getName());
                System.out.println("Pick-up Point: " + booking.getPickUpPoint());
                System.out.println("Drop-off Point: " + booking.getDropOffPoint());
                System.out.println("Ride Date: " + booking.getRideDate());
                System.out.println("Ride Time: " + booking.getRideTime());
                System.out.println("Vehicle Type: " + booking.getVehicleType());
                System.out.println("Distance: " + booking.getDistanceKm() + " KM");
                System.out.println("Total Bill: Rs. " + booking.getTotalBill());
                System.out.println("Payment Status: " + (booking.getPaymentStatus() == 1 ? "Paid" : "Pending"));
            } else {
                System.out.println("No booking found with ID: " + bookingId);
            }
            request.setAttribute("booking", booking);
            request.getRequestDispatcher("/PublicArea/orderBill.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error fetching booking details: " + e.getMessage());
        }
    }
}