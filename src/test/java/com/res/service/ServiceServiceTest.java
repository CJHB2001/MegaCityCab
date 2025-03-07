package com.res.service;

import static org.junit.jupiter.api.Assertions.*;
import com.res.model.Service;

import service.ServiceService;

import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ServiceServiceTest {
    private ServiceService serviceService;
    private Service testService;

    @BeforeEach
    public void setUp() throws SQLException {
        serviceService = new ServiceService();
        testService = new Service("Service Test", "Service Description", "/service-test.jpg");
        serviceService.addService(testService);
    }

    @AfterEach
    public void tearDown() throws SQLException {
        serviceService.deleteService(testService.getId());
    }

    @Test
    public void testCRUDOperations() throws SQLException {
        // Test Read
        List<Service> services = serviceService.getAllServices();
        assertFalse(services.isEmpty());
        
        // Test Update
        Service toUpdate = services.get(0);
        toUpdate.setServiceName("Updated Service");
        serviceService.updateService(toUpdate);
        
        Service updated = serviceService.getServiceById(toUpdate.getId());
        assertEquals("Updated Service", updated.getServiceName());
        
        // Test Delete
        serviceService.deleteService(updated.getId());
        assertNull(serviceService.getServiceById(updated.getId()));
    }
}