package com.res.service;

import static org.junit.jupiter.api.Assertions.*;
import java.sql.SQLException;
import java.sql.Date;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.res.model.Booking;

import service.BookingService;

public class BookingServiceTest {
    private BookingService bookingService;
    private Booking testBooking;

    @BeforeEach
    public void setUp() throws SQLException {
        bookingService = new BookingService();
        testBooking = createTestBooking();
        bookingService.addBooking(testBooking);
    }

    private Booking createTestBooking() {
        Booking booking = new Booking();
        booking.setCustomerId(1002);
        booking.setRegistrationNumber("SERV-456");
        booking.setEmail("service@test.com");
        booking.setName("Service Test");
        booking.setPhoneNumber("0771111111");
        booking.setPickUpPoint("Galle");
        booking.setDropOffPoint("Matara");
        booking.setPassengers(3);
        booking.setVehicleType("Van");
        booking.setDistanceKm(50.0f);
        booking.setTotalBill(5000.0f);
        booking.setRideDate(Date.valueOf("2024-03-26"));
        booking.setMessage("Service layer test");
        booking.setBookingStatus(0);
        return booking;
    }

    @AfterEach
    public void tearDown() throws SQLException {
        List<Booking> bookings = bookingService.getAllBookings();
        for (Booking booking : bookings) {
            bookingService.deleteBooking(booking.getId());
        }
    }

    @Test
    public void testGetAllBookings() throws SQLException {
        List<Booking> bookings = bookingService.getAllBookings();
        assertFalse(bookings.isEmpty());
        assertEquals("Service Test", bookings.get(0).getName());
    }

    @Test
    public void testFullCRUDOperations() throws SQLException {
        // Test Read
        Booking existing = bookingService.getAllBookings().get(0);
        assertNotNull(existing);
        
        // Test Update
        bookingService.updateBookingStatus(existing.getId(), 2);
        Booking updated = bookingService.getBookingById(existing.getId());
        assertEquals(2, updated.getBookingStatus());
        
        // Test Delete
        bookingService.deleteBooking(existing.getId());
        List<Booking> bookings = bookingService.getAllBookings();
        assertTrue(bookings.isEmpty());
    }

    @Test
    public void testSpecialStatusUpdates() throws SQLException {
        Booking booking = bookingService.getAllBookings().get(0);
        
        bookingService.assignCarToBooking(booking.getId(), 10);
        bookingService.updateTripStatus(booking.getId(), 3);
        bookingService.updatePaymentStatus(booking.getId(), 1);
        
        Booking updated = bookingService.getBookingById(booking.getId());
        assertEquals(10, updated.getCarId());
        assertEquals(3, updated.getTripStatus());
        assertEquals(1, updated.getPaymentStatus());
    }
    
}