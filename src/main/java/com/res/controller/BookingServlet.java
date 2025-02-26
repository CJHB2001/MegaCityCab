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
        
        if ("delete".equals(action)) {
            try {
                int bookingId = Integer.parseInt(request.getParameter("id"));
                bookingService.deleteBooking(bookingId);
                
                HttpSession session = request.getSession();
                session.setAttribute("alertMessage", "Booking deleted successfully.");
                session.setAttribute("alertType", "success");
            } catch (Exception e) {
                HttpSession session = request.getSession();
                session.setAttribute("alertMessage", "Error deleting booking: " + e.getMessage());
                session.setAttribute("alertType", "error");
            }
            
            response.sendRedirect(request.getContextPath() + "/AdminArea/booking.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        
        if ("updateStatus".equals(action)) {
            // Handle status update
            try {
                int bookingId = Integer.parseInt(request.getParameter("id"));
                int status = Integer.parseInt(request.getParameter("bookingStatus"));
                bookingService.updateBookingStatus(bookingId, status);
                
                session.setAttribute("alertMessage", "Booking status updated successfully.");
                session.setAttribute("alertType", "success");
            } catch (Exception e) {
                session.setAttribute("alertMessage", "Error updating booking status: " + e.getMessage());
                session.setAttribute("alertType", "error");
            }
            
            response.sendRedirect(request.getContextPath() + "/AdminArea/booking.jsp");
            return;
        }
        
        // Handle booking creation
        if (session == null || session.getAttribute("customer") == null) {
            session.setAttribute("alertMessage", "You cannot book a ride without logging in. Please log in to your account.");
            session.setAttribute("alertType", "error");
            response.sendRedirect(request.getContextPath() + "/PublicArea/signIn.jsp");
            return;
        }

        // Check if this is a regular booking form submission
        if (request.getParameter("customerId") != null) {
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
                booking.setBookingStatus(0); // Default status is pending

                bookingService.addBooking(booking);
                session.setAttribute("alertMessage", "Your booking was successful. Our team will confirm your booking as soon as possible. Stay with us.");
                session.setAttribute("alertType", "success");
                
                response.sendRedirect(request.getContextPath() + "/PublicArea/bookRide.jsp");
            } catch (Exception e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/PublicArea/bookRide.jsp");
            }
        } else if (request.getParameter("customer_id") != null) {
            // This is for admin adding a booking
            try {
                int customerId = Integer.parseInt(request.getParameter("customer_id"));
                String name = request.getParameter("name");
                String phoneNumber = request.getParameter("phone_number");
                String pickUpPoint = request.getParameter("pick_up_point");
                String dropOffPoint = request.getParameter("drop_off_point");
                int passengers = Integer.parseInt(request.getParameter("passengers"));
                String vehicleType = request.getParameter("vehicle_type");
                float distanceKm = Float.parseFloat(request.getParameter("distance_km"));
                float totalBill = Float.parseFloat(request.getParameter("total_bill"));
                Date rideDate = Date.valueOf(request.getParameter("ride_date"));
                
                String rideTimeInput = request.getParameter("ride_time");
                Time rideTime = null;
                if (rideTimeInput != null && !rideTimeInput.isEmpty()) {
                    if (rideTimeInput.length() == 5) {
                        rideTimeInput += ":00";
                    }
                    rideTime = Time.valueOf(rideTimeInput);
                }
                
                String message = request.getParameter("message");
                int bookingStatus = Integer.parseInt(request.getParameter("booking_status"));
                int carId = Integer.parseInt(request.getParameter("car_id"));
                
                Booking booking = new Booking();
                booking.setCustomerId(customerId);
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
                booking.setBookingStatus(bookingStatus);
                booking.setCarId(carId);
                
                bookingService.addBooking(booking);
                session.setAttribute("alertMessage", "Booking added successfully.");
                session.setAttribute("alertType", "success");
                
                response.sendRedirect(request.getContextPath() + "/Admin/bookingManagement.jsp");
            } catch (Exception e) {
                session.setAttribute("alertMessage", "Error adding booking: " + e.getMessage());
                session.setAttribute("alertType", "error");
                response.sendRedirect(request.getContextPath() + "/Admin/bookingManagement.jsp");
            }
        }
    }
}