package com.res.dao;

import static org.junit.jupiter.api.Assertions.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.res.model.Customer;

import util.DatabaseUtil;

public class CustomerDAOTest {
    private CustomerDAO customerDAO;
    private Customer testCustomer;

    @BeforeEach
    public void setUp() throws SQLException {
        // Clean up any previous test data first
        cleanUpTestData();
        
        customerDAO = new CustomerDAO();
        testCustomer = createTestCustomer();
        customerDAO.addCustomer(testCustomer);
    }

    private Customer createTestCustomer() throws SQLException {
        Customer customer = new Customer();
        customer.setFirstName("Test");
        customer.setLastName("User");
        customer.setPhone("0770000000");
        customer.setEmail("test@example.com");
        customer.setPassword("testpass");
        customer.setAddressLine1("Test Address");
        customer.setAddressLine2(null); // Adding the missing field
        customer.setNicNumber("987654321V");
        // Let the DAO generate the registration number instead of hardcoding it
        customer.setRegistrationNumber(customerDAO.generateRegistrationNumber());
        return customer;
    }

    @AfterEach
    public void tearDown() throws SQLException {
        // Clean up test data after each test
        cleanUpTestData();
    }
    
    private void cleanUpTestData() throws SQLException {
        // Delete test customer data from the database
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM customers WHERE email = ? OR phone = ? OR nic_number = ?")) {
            stmt.setString(1, "test@example.com");
            stmt.setString(2, "0770000000");
            stmt.setString(3, "987654321V");
            stmt.executeUpdate();
        }
    }

    @Test
    public void testAddCustomer() throws SQLException {
        // Create a new customer with different data
        Customer newCustomer = new Customer();
        newCustomer.setFirstName("John");
        newCustomer.setLastName("Doe");
        newCustomer.setPhone("0771111177");
        newCustomer.setEmail("john@example.com");
        newCustomer.setPassword("password123");
        newCustomer.setAddressLine1("123 Main St");
        newCustomer.setAddressLine2("Apt 4B");
        newCustomer.setNicNumber("555555552V");
        newCustomer.setRegistrationNumber(customerDAO.generateRegistrationNumber());
        
        boolean result = customerDAO.addCustomer(newCustomer);
        assertTrue(result, "Customer should be added successfully");
        
        // Verify customer exists
        assertTrue(customerDAO.isEmailExists("john@example.com"));
        
        // Clean up the additional test customer
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement("DELETE FROM customers WHERE email = ?")) {
            stmt.setString(1, "john@example.com");
            stmt.executeUpdate();
        }
    }

    @Test
    public void testEmailExists() throws SQLException {
        assertTrue(customerDAO.isEmailExists("test@example.com"), "Email should exist");
        assertFalse(customerDAO.isEmailExists("nonexistent@test.com"), "Email should not exist");
    }

    @Test
    public void testPhoneExists() throws SQLException {
        assertTrue(customerDAO.isPhoneExists("0770000000"), "Phone number should exist");
        assertFalse(customerDAO.isPhoneExists("0771111177"), "Phone number should not exist");
    }

    @Test
    public void testNicNumberExists() throws SQLException {
        assertTrue(customerDAO.isNicNumberExists("987654321V"), "NIC number should exist");
        assertFalse(customerDAO.isNicNumberExists("000000000V"), "NIC number should not exist");
    }

    @Test
    public void testGenerateRegistrationNumber() throws SQLException {
        String regNumber = customerDAO.generateRegistrationNumber();
        assertTrue(regNumber.matches("CUST\\d{5}"), "Registration number should match the pattern CUST followed by 5 digits");
    }
    
    @Test
    public void testGetCustomerByEmailAndPassword() throws SQLException {
        Customer customer = customerDAO.getCustomerByEmailAndPassword("test@example.com", "testpass");
        assertNotNull(customer, "Customer should be found with correct credentials");
        assertEquals("Test", customer.getFirstName(), "First name should match");
        assertEquals("User", customer.getLastName(), "Last name should match");
        
        // Test with incorrect password
        Customer invalidCustomer = customerDAO.getCustomerByEmailAndPassword("test@example.com", "wrongpass");
        assertNull(invalidCustomer, "Customer should not be found with incorrect password");
    }
    
    @Test
    public void testGetAllCustomers() throws SQLException {
        List<Customer> customers = customerDAO.getAllCustomers();
        assertFalse(customers.isEmpty(), "Customer list should not be empty");
        
        // Check if our test customer is in the list
        boolean found = false;
        for (Customer customer : customers) {
            if ("test@example.com".equals(customer.getEmail())) {
                found = true;
                assertEquals("Test", customer.getFirstName(), "First name should match");
                assertEquals("User", customer.getLastName(), "Last name should match");
                break;
            }
        }
        assertTrue(found, "Test customer should be in the list of all customers");
    }
}