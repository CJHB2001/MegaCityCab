package com.res.dao;

import static org.junit.jupiter.api.Assertions.*;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.res.model.Booking;

public class BookingDAOTest {
    private BookingDAO bookingDAO;
    private Booking testBooking;

    @BeforeEach
    public void setUp() throws SQLException {
        bookingDAO = new BookingDAO();
        testBooking = createTestBooking();
        bookingDAO.addBooking(testBooking);
    }
    
    

    private Booking createTestBooking() {
        Booking booking = new Booking();
        booking.setCustomerId(1001);
        booking.setRegistrationNumber("TEST-123");
        booking.setEmail("test@example.com");
        booking.setName("Test User");
        booking.setPhoneNumber("0770000000");
        booking.setPickUpPoint("Colombo");
        booking.setDropOffPoint("Kandy");
        booking.setPassengers(2);
        booking.setVehicleType("Sedan");
        booking.setDistanceKm(150.0f);
        booking.setTotalBill(20000.0f);
        booking.setRideDate(Date.valueOf("2024-03-25"));
        booking.setRideTime(Time.valueOf("10:00:00"));
        booking.setVehicleType("Sedan");
        booking.setMessage("Test booking");
        booking.setBookingStatus(0);
        return booking;
    }

    @AfterEach
    public void tearDown() throws SQLException {
        List<Booking> bookings = bookingDAO.getAllBookings();
        for (Booking booking : bookings) {
            bookingDAO.deleteBooking(booking.getId());
        }
    }

    @Test
    public void testAddAndGetBooking() throws SQLException {
        List<Booking> bookings = bookingDAO.getAllBookings();
        assertFalse(bookings.isEmpty());
        Booking retrieved = bookings.get(0);
        assertEquals("Test User", retrieved.getName());
        assertEquals("Sedan", retrieved.getVehicleType());
    }

    @Test
    public void testUpdateBookingStatus() throws SQLException {
        Booking booking = bookingDAO.getAllBookings().get(0);
        bookingDAO.updateBookingStatus(booking.getId(), 1);
        
        Booking updated = bookingDAO.getBookingById(booking.getId());
        assertEquals(1, updated.getBookingStatus());
    }

    @Test
    public void testAssignCarToBooking() throws SQLException {
        Booking booking = bookingDAO.getAllBookings().get(0);
        bookingDAO.assignCarToBooking(booking.getId(), 5);
        
        Booking updated = bookingDAO.getBookingById(booking.getId());
        assertEquals(5, updated.getCarId());
    }

    @Test
    public void testUpdateTripStatus() throws SQLException {
        Booking booking = bookingDAO.getAllBookings().get(0);
        bookingDAO.updateTripStatus(booking.getId(), 2);
        
        Booking updated = bookingDAO.getBookingById(booking.getId());
        assertEquals(2, updated.getTripStatus());
    }

    @Test
    public void testUpdatePaymentStatus() throws SQLException {
        Booking booking = bookingDAO.getAllBookings().get(0);
        bookingDAO.updatePaymentStatus(booking.getId(), 1);
        
        Booking updated = bookingDAO.getBookingById(booking.getId());
        assertEquals(1, updated.getPaymentStatus());
    }

    @Test
    public void testDeleteBooking() throws SQLException {
        Booking booking = bookingDAO.getAllBookings().get(0);
        bookingDAO.deleteBooking(booking.getId());
        
        List<Booking> bookings = bookingDAO.getAllBookings();
        assertTrue(bookings.isEmpty());
    }
}