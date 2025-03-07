package com.res.service;

import static org.junit.jupiter.api.Assertions.*;
import com.res.model.Vehicle;

import service.VehicleService;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class VehicleServiceTest {
    private VehicleService vehicleService;
    private Vehicle testVehicle;

    @BeforeEach
    public void setUp() throws SQLException {
        vehicleService = new VehicleService();
        testVehicle = createTestVehicle();
        vehicleService.addVehicle(testVehicle);
    }

    private Vehicle createTestVehicle() {
        Vehicle vehicle = new Vehicle();
        vehicle.setVehicleType("Van");
        vehicle.setEngineNumber("VAN-ENG-123");
        vehicle.setVehicleNumber("VAN-001");
        vehicle.setBrand("Ford");
        vehicle.setColor("Blue");
        vehicle.setVehicleFuelType("Petrol");
        vehicle.setDoors(3);
        vehicle.setCapacity(8);
        vehicle.setDriverId(103);
        vehicle.setImagePath("/vehicles/van.jpg");
        return vehicle;
    }

    @AfterEach
    public void tearDown() throws SQLException {
        vehicleService.deleteVehicle(testVehicle.getId());
    }

    @Test
    public void testVehicleCRUD() throws SQLException {
        // Test Read
        List<Vehicle> vehicles = vehicleService.getAllVehicles();
        assertFalse(vehicles.isEmpty());
        
        // Test Update
        Vehicle toUpdate = vehicles.get(0);
        toUpdate.setCapacity(10);
        vehicleService.updateVehicle(toUpdate);
        
        Vehicle updated = vehicleService.getVehicleById(toUpdate.getId());
        assertEquals(10, updated.getCapacity());
        
        // Test Delete
        vehicleService.deleteVehicle(updated.getId());
        assertNull(vehicleService.getVehicleById(updated.getId()));
    }
}