package com.res.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.res.model.Booking;
import com.res.model.Service;

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
    public void deleteBooking(int bookingId) throws SQLException {
        String sql = "DELETE FROM booking WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, bookingId);
            pstmt.executeUpdate();
        }
    }
    
    public List<Booking> getAllBookings() throws SQLException {
        List<Booking> bookingList = new ArrayList<>();
        String sql = "SELECT * FROM booking";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setId(rs.getInt("id"));
                booking.setCustomerId(rs.getInt("customer_id"));
                booking.setRegistrationNumber(rs.getString("registration_number"));
                booking.setEmail(rs.getString("email"));
                booking.setName(rs.getString("name"));
                booking.setPhoneNumber(rs.getString("phone_number"));
                booking.setPickUpPoint(rs.getString("pick_up_point"));
                booking.setDropOffPoint(rs.getString("drop_off_point"));
                booking.setPassengers(rs.getInt("passengers"));
                booking.setVehicleType(rs.getString("vehicle_type"));
                booking.setDistanceKm(rs.getFloat("distance_km"));
                booking.setTotalBill(rs.getFloat("total_bill"));
                booking.setRideDate(rs.getDate("ride_date"));
                booking.setRideTime(rs.getTime("ride_time"));
                booking.setMessage(rs.getString("message"));
                booking.setBookingStatus(rs.getInt("booking_status"));
                booking.setCarId(rs.getInt("car_id"));
                bookingList.add(booking);
            }
        }
        return bookingList;
    }
}