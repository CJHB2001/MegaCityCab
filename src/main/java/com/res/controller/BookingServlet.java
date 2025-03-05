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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("delete".equals(action)) {
            // Handle delete booking
            try {
                int bookingId = Integer.parseInt(request.getParameter("id"));
                bookingService.deleteBooking(bookingId);
                session.setAttribute("alertMessage", "Booking deleted successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/booking.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("updateStatus".equals(action)) {
            // Handle update booking status
            try {
                int bookingId = Integer.parseInt(request.getParameter("id"));
                int status = Integer.parseInt(request.getParameter("bookingStatus"));
                bookingService.updateBookingStatus(bookingId, status);
                session.setAttribute("alertMessage", "Booking status updated successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/booking.jsp");
        } else if ("assignCar".equals(action)) {
            // Handle assign car to booking
            try {
                int bookingId = Integer.parseInt(request.getParameter("id"));
                int carId = Integer.parseInt(request.getParameter("carId"));
                bookingService.assignCarToBooking(bookingId, carId);
                session.setAttribute("alertMessage", "Car assigned to booking successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/booking.jsp");
        } else {
            // Handle add booking
            if (session == null || session.getAttribute("customer") == null) {
                session.setAttribute("alertMessage", "You cannot book a ride without logging in. Please log in to your account.");
                session.setAttribute("alertType", "error");
                response.sendRedirect(request.getContextPath() + "/PublicArea/signIn.jsp");
                return;
            }

            try {
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
                    if (!rideTimeInput.contains(":")) {
                        rideTimeInput = rideTimeInput.substring(0, 2) + ":" + rideTimeInput.substring(2, 4) + ":00";
                    } else if (rideTimeInput.length() == 5) {
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
                booking.setBookingStatus(0); 

                bookingService.addBooking(booking);
                session.setAttribute("alertMessage", "Your booking was successful. Our team will confirm your booking as soon as possible. Stay with us.");
                session.setAttribute("alertType", "success");
                response.sendRedirect(request.getContextPath() + "/PublicArea/bookRide.jsp");
            } catch (Exception e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/PublicArea/bookRide.jsp");
            }
        }
    }
}