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
import com.res.model.Booking;
import service.BookingService;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    private BookingService bookingService = new BookingService();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
        	session.setAttribute("alertMessage", "You cannot book a ride without logging in. Please log in to your account.");
            session.setAttribute("alertType", "error");
            response.sendRedirect(request.getContextPath() + "/PublicArea/signIn.jsp");
            return;
        }

        int customerId = Integer.parseInt(request.getParameter("customerId"));
        String registrationNumber = request.getParameter("registrationNumber");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String pickUpPoint = request.getParameter("pickUpPoint");
        String dropOffPoint = request.getParameter("dropOffPoint");
        int passengers = Integer.parseInt(request.getParameter("passengers"));
        String vehicleType = request.getParameter("vehicleType");
        float distanceKm = Float.parseFloat(request.getParameter("distanceKm"));

        // Clean the totalBill input by removing "LKR " prefix
        String totalBillInput = request.getParameter("totalBill");
        float totalBill = Float.parseFloat(totalBillInput.replace("LKR ", "")); // Remove "LKR " before parsing

        Date rideDate = Date.valueOf(request.getParameter("rideDate"));

        // Handle rideTime input
        String rideTimeInput = request.getParameter("rideTime");
        Time rideTime = null;
        if (rideTimeInput != null && !rideTimeInput.isEmpty()) {
            // Ensure the rideTime input is in the correct format (HH:mm:ss)
            if (!rideTimeInput.contains(":")) {
                // If the input is in a different format (e.g., "1430"), convert it to "HH:mm:ss"
                rideTimeInput = rideTimeInput.substring(0, 2) + ":" + rideTimeInput.substring(2, 4) + ":00";
            } else if (rideTimeInput.length() == 5) {
                // If the input is in "HH:mm" format, append ":00" to make it "HH:mm:ss"
                rideTimeInput += ":00";
            }
            rideTime = Time.valueOf(rideTimeInput);
        }

        String message = request.getParameter("message");

        Booking booking = new Booking();
        booking.setCustomerId(customerId);
        booking.setRegistrationNumber(registrationNumber);
        booking.setEmail(email);
        booking.setName(name);
        booking.setPhoneNumber(phoneNumber);
        booking.setPickUpPoint(pickUpPoint);
        booking.setDropOffPoint(dropOffPoint);
        booking.setPassengers(passengers);
        booking.setVehicleType(vehicleType);
        booking.setDistanceKm(distanceKm);
        booking.setTotalBill(totalBill);
        booking.setRideDate(rideDate);
        booking.setRideTime(rideTime);
        booking.setMessage(message);
        booking.setBookingStatus(0); // Default status

        try {
            bookingService.addBooking(booking);
            session.setAttribute("alertMessage", "Your booking was successful. Our team will confirm your booking as soon as possible. Stay with us.");
            session.setAttribute("alertType", "success");
        } catch (Exception e) {
            session.setAttribute("alertMessage", "Error: " + e.getMessage());
            session.setAttribute("alertType", "danger");
        }

        response.sendRedirect(request.getContextPath() + "/PublicArea/bookRide.jsp");
    }

  
}