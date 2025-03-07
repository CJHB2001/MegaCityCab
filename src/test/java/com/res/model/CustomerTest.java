package com.res.model;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CustomerTest {
    private Customer customer;

    @BeforeEach
    public void setUp() {
        customer = new Customer("John", "Doe", "0771234567", "john@test.com", 
                "password123", "123 Main St", "Apt 4B", "123456789V", "CUST00001");
    }

    @Test
    public void testGettersAndSetters() {
        customer.setId(1);
        assertEquals(1, customer.getId());
        assertEquals("John", customer.getFirstName());
        assertEquals("Doe", customer.getLastName());
        assertEquals("0771234567", customer.getPhone());
        assertEquals("john@test.com", customer.getEmail());
        assertEquals("password123", customer.getPassword());
        assertEquals("123 Main St", customer.getAddressLine1());
        assertEquals("Apt 4B", customer.getAddressLine2());
        assertEquals("123456789V", customer.getNicNumber());
        assertEquals("CUST00001", customer.getRegistrationNumber());
    }
}