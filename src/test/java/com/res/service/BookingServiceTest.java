package com.res.service;

import static org.junit.jupiter.api.Assertions.*;
import com.res.model.Booking;
import service.BookingService;

import java.sql.SQLException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class BookingServiceTest {
    private BookingService bookingService;
    private int testBookingId;
    private static final int TEST_CAR_ID = 5;

    @BeforeEach
    void setUp() throws SQLException {
        bookingService = new BookingService();
        
        // Create test booking
        Booking testBooking = new Booking();
        testBooking.setCustomerId(1);
        testBooking.setEmail("test@example.com");
        testBooking.setName("Test User");
        testBooking.setPhoneNumber("123-456-7890");
        testBooking.setPickUpPoint("Central Station");
        testBooking.setDropOffPoint("Downtown Office");
        testBooking.setPassengers(3);
        testBooking.setVehicleType("SUV");
        testBooking.setDistanceKm(15.5f);
        testBooking.setTotalBill(45.75f);
        testBooking.setRegistrationNumber("REG12345"); // Replace with actual logic if needed
        testBooking.setRideDate(new Date(System.currentTimeMillis()));
        testBooking.setRideTime(new Time(System.currentTimeMillis()));
        
        bookingService.addBooking(testBooking);
        
        // Get generated ID
        List<Booking> bookings = bookingService.getAllBookings();
        if (!bookings.isEmpty()) {
            this.testBookingId = bookings.get(bookings.size() - 1).getId();
        }
    }

    @AfterEach
    void tearDown() throws SQLException {
        if (testBookingId != 0) {
            bookingService.deleteBooking(testBookingId);
        }
    }

    @Test
    void testAddBooking() throws SQLException {
        List<Booking> bookings = bookingService.getAllBookings();
        assertFalse(bookings.isEmpty());
        assertEquals("SUV", bookings.get(bookings.size() - 1).getVehicleType());
    }

    @Test
    void testGetAllBookings() throws SQLException {
        List<Booking> bookings = bookingService.getAllBookings();
        assertFalse(bookings.isEmpty());
        assertEquals("Test User", bookings.get(bookings.size() - 1).getName());
    }

    @Test
    void testUpdateBookingStatus() throws SQLException {
        bookingService.updateBookingStatus(testBookingId, 2);
        Booking updated = bookingService.getBookingById(testBookingId);
        assertNotNull(updated);
        assertEquals(2, updated.getBookingStatus());
    }

    @Test
    void testAssignCarToBooking() throws SQLException {
        bookingService.assignCarToBooking(testBookingId, TEST_CAR_ID);
        Booking updated = bookingService.getBookingById(testBookingId);
        assertNotNull(updated);
        assertEquals(TEST_CAR_ID, updated.getCarId());
    }

    @Test
    void testUpdateTripStatus() throws SQLException {
        bookingService.updateTripStatus(testBookingId, 2);
        Booking updated = bookingService.getBookingById(testBookingId);
        assertNotNull(updated);
        assertEquals(2, updated.getTripStatus());
        
        bookingService.updateTripStatus(testBookingId, 3);
        updated = bookingService.getBookingById(testBookingId);
        assertNotNull(updated);
        assertEquals(3, updated.getTripStatus());
        assertEquals(1, updated.getPaymentStatus());
    }


    @Test
    void testGetBookingById() throws SQLException {
        Booking booking = bookingService.getBookingById(testBookingId);
        assertNotNull(booking);
        assertEquals("test@example.com", booking.getEmail());
        assertEquals(15.5f, booking.getDistanceKm(), 0.01);
    }

    @Test
    void testDeleteBooking() throws SQLException {
        bookingService.deleteBooking(testBookingId);
        Booking deletedBooking = bookingService.getBookingById(testBookingId);
        assertNull(deletedBooking);
    }
}