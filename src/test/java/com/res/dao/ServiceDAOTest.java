package com.res.dao;

import static org.junit.jupiter.api.Assertions.*;
import com.res.model.Service;

import util.DatabaseUtil;

import java.sql.SQLException;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ServiceDAOTest {
    private ServiceDAO serviceDAO;
    private Service testService;

    @BeforeEach
    public void setUp() throws SQLException {
        serviceDAO = new ServiceDAO();
        testService = new Service("Test Service", "Test Description", "/test.jpg");
        cleanUpTestData();
        serviceDAO.addService(testService);
    }

    @AfterEach
    public void tearDown() throws SQLException {
        cleanUpTestData();
    }

    private void cleanUpTestData() throws SQLException {
        try (var conn = DatabaseUtil.getConnection();
             var stmt = conn.prepareStatement("DELETE FROM services WHERE service_name IN (?, ?)")) {
            stmt.setString(1, "Test Service");
            stmt.setString(2, "Updated Service");
            stmt.executeUpdate();
        }
    }

    @Test
    public void testAddAndGetService() throws SQLException {
        Service retrieved = serviceDAO.getServiceById(testService.getId());
        assertNotNull(retrieved);
        assertEquals("Test Service", retrieved.getServiceName());
    }

    @Test
    public void testGetAllServices() throws SQLException {
        List<Service> services = serviceDAO.getAllServices();
        assertFalse(services.isEmpty());
        assertEquals("Test Service", services.get(0).getServiceName());
    }

    @Test
    public void testUpdateService() throws SQLException {
        testService.setDescription("Updated Description");
        serviceDAO.updateService(testService);
        
        Service updated = serviceDAO.getServiceById(testService.getId());
        assertEquals("Updated Description", updated.getDescription());
    }

    @Test
    public void testDeleteService() throws SQLException {
        serviceDAO.deleteService(testService.getId());
        assertNull(serviceDAO.getServiceById(testService.getId()));
    }
}