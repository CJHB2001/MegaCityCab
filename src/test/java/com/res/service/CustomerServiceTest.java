package com.res.service;

import static org.junit.jupiter.api.Assertions.*;
import java.sql.SQLException;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.res.model.Customer;
import com.res.dao.CustomerDAO;
import service.CustomerService;

public class CustomerServiceTest {
    private CustomerService customerService;
    private CustomerDAO customerDAO;
    private Customer testCustomer;

    @BeforeEach
    public void setUp() throws SQLException {
        customerService = new CustomerService();
        customerDAO = new CustomerDAO(); // Initialize CustomerDAO
        testCustomer = new Customer();
        testCustomer.setFirstName("Service");
        testCustomer.setLastName("Test");
        testCustomer.setPhone("0702740540");
        testCustomer.setEmail("te123@test.com");
        testCustomer.setPassword("servicepass");
        testCustomer.setAddressLine1("Service Address");
        testCustomer.setNicNumber("999999789V");
        testCustomer.setRegistrationNumber(customerDAO.generateRegistrationNumber()); 

        customerService.addCustomer(testCustomer);
    }

    @AfterEach
    public void tearDown() throws SQLException {
        // Clean up test data by deleting test customer
        List<Customer> customers = customerService.getAllCustomers();
        for (Customer customer : customers) {
            if (customer.getEmail().equals("service@test.com")) {
                // Implement deleteCustomer method in CustomerService and call it here
    
            }
        }
    }

    @Test
    public void testRegistration() throws SQLException {
        assertTrue(customerService.isEmailExists("service@test.com"));
        assertTrue(customerService.isNicNumberExists("555555555V")); // Match the correct test NIC
    }

    @Test
    public void testValidateCustomer() throws SQLException {
        Customer valid = customerService.validateCustomer("service@test.com", "servicepass");
        assertNotNull(valid);
        assertEquals("Service", valid.getFirstName());

        Customer invalid = customerService.validateCustomer("wrong@test.com", "wrongpass");
        assertNull(invalid);
    }

    @Test
    public void testRegistrationNumberGeneration() throws SQLException {
        String regNumber = customerService.generateRegistrationNumber();
        assertTrue(regNumber.startsWith("CUST"));
    }
}
