package com.res.dao;

import static org.junit.jupiter.api.Assertions.*;
import com.res.model.Vehicle;

import util.DatabaseUtil;

import java.sql.SQLException;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class VehicleDAOTest {
    private VehicleDAO vehicleDAO;
    private Vehicle testVehicle;

    @BeforeEach
    public void setUp() throws SQLException {
        vehicleDAO = new VehicleDAO();
        testVehicle = createTestVehicle();
        cleanUpTestData();
        vehicleDAO.addVehicle(testVehicle);
    }

    private Vehicle createTestVehicle() {
        Vehicle vehicle = new Vehicle();
        vehicle.setVehicleType("Sedan");
        vehicle.setEngineNumber("ENG654321");
        vehicle.setVehicleNumber("SED-001");
        vehicle.setBrand("Honda");
        vehicle.setColor("White");
        vehicle.setVehicleFuelType("Diesel");
        vehicle.setDoors(4);
        vehicle.setCapacity(4);
        vehicle.setDriverId(102);
        vehicle.setImagePath("/vehicles/sedan.jpg");
        return vehicle;
    }

    @AfterEach
    public void tearDown() throws SQLException {
        cleanUpTestData();
    }

    private void cleanUpTestData() throws SQLException {
        try (var conn = DatabaseUtil.getConnection();
             var stmt = conn.prepareStatement("DELETE FROM vehicle WHERE vehicle_number IN (?, ?)")) {
            stmt.setString(1, "CAB-001");
            stmt.setString(2, "SED-001");
            stmt.executeUpdate();
        }
    }

    @Test
    public void testAddAndGetVehicle() throws SQLException {
        Vehicle retrieved = vehicleDAO.getVehicleById(testVehicle.getId());
        assertNotNull(retrieved);
        assertEquals("Honda", retrieved.getBrand());
    }

    @Test
    public void testUpdateVehicle() throws SQLException {
        testVehicle.setColor("Red");
        vehicleDAO.updateVehicle(testVehicle);
        
        Vehicle updated = vehicleDAO.getVehicleById(testVehicle.getId());
        assertEquals("Red", updated.getColor());
    }

    @Test
    public void testDeleteVehicle() throws SQLException {
        vehicleDAO.deleteVehicle(testVehicle.getId());
        assertNull(vehicleDAO.getVehicleById(testVehicle.getId()));
    }

    @Test
    public void testGetAllVehicles() throws SQLException {
        List<Vehicle> vehicles = vehicleDAO.getAllVehicles();
        assertFalse(vehicles.isEmpty());
        assertEquals("Sedan", vehicles.get(0).getVehicleType());
    }
}