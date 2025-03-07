package com.res.model;

import static org.junit.jupiter.api.Assertions.*;
import java.sql.Date;
import java.sql.Time;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class BookingTest {
    private Booking booking;
    private Date testDate;
    private Time testTime;

    @BeforeEach
    public void setUp() {
        testDate = Date.valueOf("2024-03-20");
        testTime = Time.valueOf("14:30:00");
        booking = new Booking(
            1, 1001, "ABC-1234", "test@example.com", "John Doe", "0771234567",
            "Colombo", "Kandy", 4, "SUV", 120.5f, 15000.0f, testDate, testTime,
            "Special request", 0, 5, "CAB-001", "/images/vehicle.jpg", "Toyota",
            "Black", "Petrol", 4, 6, 200, "Driver Name", "/images/driver.jpg",
            35, "5 years", "DL-12345", "Male", 0, 0
        );
    }

    @Test
    public void testGettersAndSetters() {
        assertEquals(1, booking.getId());
        assertEquals(1001, booking.getCustomerId());
        assertEquals("ABC-1234", booking.getRegistrationNumber());
        assertEquals("test@example.com", booking.getEmail());
        assertEquals("John Doe", booking.getName());
        assertEquals("0771234567", booking.getPhoneNumber());
        assertEquals("Colombo", booking.getPickUpPoint());
        assertEquals("Kandy", booking.getDropOffPoint());
        assertEquals(4, booking.getPassengers());
        assertEquals("SUV", booking.getVehicleType());
        assertEquals(120.5f, booking.getDistanceKm(), 0.001);
        assertEquals(15000.0f, booking.getTotalBill(), 0.001);
        assertEquals(testDate, booking.getRideDate());
        assertEquals(testTime, booking.getRideTime());
        assertEquals("Special request", booking.getMessage());
        assertEquals(0, booking.getBookingStatus());
        assertEquals(5, booking.getCarId());
        assertEquals("CAB-001", booking.getVehicleNumber());
        assertEquals("/images/vehicle.jpg", booking.getVehicleImagePath());
        assertEquals("Toyota", booking.getVehicleBrand());
        assertEquals("Black", booking.getVehicleColor());
        assertEquals("Petrol", booking.getVehicleFuelType());
        assertEquals(4, booking.getVehicleDoors());
        assertEquals(6, booking.getVehicleCapacity());
        assertEquals(200, booking.getDriverId());
        assertEquals("Driver Name", booking.getDriverName());
        assertEquals("/images/driver.jpg", booking.getDriverImagePath());
        assertEquals(35, booking.getDriverAge());
        assertEquals("5 years", booking.getDriverExperience());
        assertEquals("DL-12345", booking.getDriverLicenseId());
        assertEquals("Male", booking.getDriverGender());
        assertEquals(0, booking.getTripStatus());
        assertEquals(0, booking.getPaymentStatus());
    }
}