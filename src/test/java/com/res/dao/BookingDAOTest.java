package com.res.dao;

import static org.junit.jupiter.api.Assertions.*;
import com.res.model.Booking;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class BookingDAOTest {
    private BookingDAO bookingDAO;
    private Booking testBooking;
    private int createdBookingId;

    @BeforeEach
    void setUp() throws SQLException {
        bookingDAO = new BookingDAO();
        
        // Create test booking
        testBooking = new Booking();
        testBooking.setCustomerId(1);
        testBooking.setRegistrationNumber("REG-123");
        testBooking.setEmail("test@example.com");
        testBooking.setName("Test User");
        testBooking.setPhoneNumber("123-456-7890");
        testBooking.setPickUpPoint("Central Station");
        testBooking.setDropOffPoint("Downtown Office");
        testBooking.setPassengers(3);
        testBooking.setVehicleType("SUV");
        testBooking.setDistanceKm(15.5f);
        testBooking.setTotalBill(45.75f);
        testBooking.setRideDate(new Date(System.currentTimeMillis()));
        testBooking.setRideTime(new Time(System.currentTimeMillis()));
        testBooking.setMessage("Test booking");
        testBooking.setBookingStatus(0);
        
        bookingDAO.addBooking(testBooking);
        
        // Get the generated ID
        List<Booking> bookings = bookingDAO.getAllBookings();
        this.createdBookingId = bookings.get(0).getId();
    }

    @AfterEach
    void tearDown() throws SQLException {
        if (createdBookingId != 0) {
            bookingDAO.deleteBooking(createdBookingId);
        }
    }

    @Test
    void testAddBooking() throws SQLException {
        List<Booking> bookings = bookingDAO.getAllBookings();
        assertFalse(bookings.isEmpty());
        assertEquals("Test User", bookings.get(0).getName());
    }

    @Test
    void testGetAllBookings() throws SQLException {
        List<Booking> bookings = bookingDAO.getAllBookings();
        assertTrue(bookings.size() > 0);
        assertEquals("SUV", bookings.get(0).getVehicleType());
    }

    @Test
    void testGetBookingById() throws SQLException {
        Booking booking = bookingDAO.getBookingById(createdBookingId);
        assertNotNull(booking);
        assertEquals("test@example.com", booking.getEmail());
        assertEquals(15.5f, booking.getDistanceKm(), 0.01);
    }

    @Test
    void testUpdateBookingStatus() throws SQLException {
        bookingDAO.updateBookingStatus(createdBookingId, 1);
        Booking updated = bookingDAO.getBookingById(createdBookingId);
        assertEquals(1, updated.getBookingStatus());
    }

    @Test
    void testAssignCarToBooking() throws SQLException {
        int testCarId = 5; // Assume existing car ID
        bookingDAO.assignCarToBooking(createdBookingId, testCarId);
        Booking updated = bookingDAO.getBookingById(createdBookingId);
        assertEquals(testCarId, updated.getCarId());
    }

    @Test
    void testUpdateTripStatus() throws SQLException {
        // Test normal trip status update
        bookingDAO.updateTripStatus(createdBookingId, 2);
        Booking updated = bookingDAO.getBookingById(createdBookingId);
        assertEquals(2, updated.getTripStatus());
        
        // Test trip completion with payment
        bookingDAO.updateTripStatus(createdBookingId, 3);
        updated = bookingDAO.getBookingById(createdBookingId);
        assertEquals(3, updated.getTripStatus());
        assertEquals(1, updated.getPaymentStatus());
    }

    @Test
    void testUpdatePaymentStatus() throws SQLException {
        bookingDAO.updatePaymentStatus(createdBookingId, 1);
        Booking updated = bookingDAO.getBookingById(createdBookingId);
        assertEquals(1, updated.getPaymentStatus());
    }

    @Test
    void testDeleteBooking() throws SQLException {
        bookingDAO.deleteBooking(createdBookingId);
        List<Booking> bookings = bookingDAO.getAllBookings();
        assertTrue(bookings.isEmpty());
    }
}