package com.res.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class VehicleTest {
    private Vehicle vehicle;

    @BeforeEach
    public void setUp() {
        vehicle = new Vehicle();
        vehicle.setId(1);
        vehicle.setVehicleType("SUV");
        vehicle.setEngineNumber("ENG123456");
        vehicle.setVehicleNumber("CAB-001");
        vehicle.setBrand("Toyota");
        vehicle.setColor("Black");
        vehicle.setVehicleFuelType("Petrol");
        vehicle.setDoors(4);
        vehicle.setCapacity(6);
        vehicle.setDriverId(101);
        vehicle.setDriverName("John Doe");
        vehicle.setDriverExperience("5 years");
        vehicle.setDriverProfilePhoto("/uploads/driver.jpg");
        vehicle.setImagePath("/vehicles/suv.jpg");
    }

    @Test
    public void testGettersAndSetters() {
        assertEquals(1, vehicle.getId());
        assertEquals("SUV", vehicle.getVehicleType());
        assertEquals("ENG123456", vehicle.getEngineNumber());
        assertEquals("CAB-001", vehicle.getVehicleNumber());
        assertEquals("Toyota", vehicle.getBrand());
        assertEquals("Black", vehicle.getColor());
        assertEquals("Petrol", vehicle.getVehicleFuelType());
        assertEquals(4, vehicle.getDoors());
        assertEquals(6, vehicle.getCapacity());
        assertEquals(101, vehicle.getDriverId());
        assertEquals("John Doe", vehicle.getDriverName());
        assertEquals("5 years", vehicle.getDriverExperience());
        assertEquals("/uploads/driver.jpg", vehicle.getDriverProfilePhoto());
        assertEquals("/vehicles/suv.jpg", vehicle.getImagePath());
    }
}