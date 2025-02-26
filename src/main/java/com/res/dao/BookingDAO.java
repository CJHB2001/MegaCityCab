package com.res.dao;

import java.sql.*;
import com.res.model.Booking;
import util.DatabaseUtil;

public class BookingDAO {
    public void addBooking(Booking booking) throws SQLException {
        String sql = "INSERT INTO booking (customer_id, registration_number, email, name, phone_number, pick_up_point, drop_off_point, passengers, vehicle_type, distance_km, total_bill, ride_date, ride_time, message, booking_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, booking.getCustomerId());
            pstmt.setString(2, booking.getRegistrationNumber());
            pstmt.setString(3, booking.getEmail());
            pstmt.setString(4, booking.getName());
            pstmt.setString(5, booking.getPhoneNumber());
            pstmt.setString(6, booking.getPickUpPoint());
            pstmt.setString(7, booking.getDropOffPoint());
            pstmt.setInt(8, booking.getPassengers());
            pstmt.setString(9, booking.getVehicleType());
            pstmt.setFloat(10, booking.getDistanceKm());
            pstmt.setFloat(11, booking.getTotalBill());
            pstmt.setDate(12, booking.getRideDate());
            pstmt.setTime(13, booking.getRideTime());
            pstmt.setString(14, booking.getMessage());
            pstmt.setInt(15, booking.getBookingStatus());
            pstmt.executeUpdate();
        }
    }
}