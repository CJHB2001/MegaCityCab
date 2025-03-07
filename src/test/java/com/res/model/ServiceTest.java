package com.res.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ServiceTest {
    private Service service;

    @BeforeEach
    public void setUp() {
        service = new Service("Car Wash", "Premium car washing service", "/images/carwash.jpg");
        service.setId(1);
    }

    @Test
    public void testConstructorAndGetters() {
        assertEquals(1, service.getId());
        assertEquals("Car Wash", service.getServiceName());
        assertEquals("Premium car washing service", service.getDescription());
        assertEquals("/images/carwash.jpg", service.getImagePath());
    }
    
    @Test
    public void testSetters() {
        // When
        service.setId(2);
        service.setServiceName("Oil Change");
        service.setDescription("Full synthetic oil change");
        service.setImagePath("/images/oilchange.jpg");
        
        // Then
        assertEquals(2, service.getId());
        assertEquals("Oil Change", service.getServiceName());
        assertEquals("Full synthetic oil change", service.getDescription());
        assertEquals("/images/oilchange.jpg", service.getImagePath());
    }
    
    @Test
    public void testNoArgsConstructor() {
        // Given
        Service emptyService = new Service();
        
        // Then
        assertNull(emptyService.getServiceName());
        assertNull(emptyService.getDescription());
        assertNull(emptyService.getImagePath());
        assertEquals(0, emptyService.getId());
    }
}