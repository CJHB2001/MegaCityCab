package com.res.dao;

import static org.junit.jupiter.api.Assertions.*;
import static service.UserService.*;
import com.res.model.User;
import com.res.model.UserRole;
import java.sql.SQLException;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class UserDAOTest {
    private UserDAO userDAO;
    private User testDriver;
    private int testDriverId;

    @BeforeEach
    void setUp() throws SQLException {
        userDAO = new UserDAO();
        testDriver = new User(
            "testdriver@example.com", 
            "password123", 
            UserRole.DRIVER, 
            "Test Driver", 
            30, 
            "5 years", 
            "LIC123", 
            "Male", 
            "/profile.jpg"
        );
        userDAO.addDriver(testDriver);
        
        // Get generated ID for teardown
        User addedDriver = userDAO.getUserByEmail("testdriver@example.com");
        this.testDriverId = addedDriver.getId();
    }

    @AfterEach
    void tearDown() throws SQLException {
        if (testDriverId != 0) {
            userDAO.deleteDriver(testDriverId);
        }
    }

   

    @Test
    void testAddDriver() throws SQLException {
        List<User> drivers = userDAO.getAllDrivers();
        assertTrue(drivers.stream().anyMatch(d -> 
            d.getEmail().equals("testdriver@example.com")
        ));
    }

    @Test
    void testGetAllDrivers() throws SQLException {
        List<User> drivers = userDAO.getAllDrivers();
        assertFalse(drivers.isEmpty());
    }

    @Test
    void testGetDriverById() throws SQLException {
        User driver = userDAO.getDriverById(testDriverId);
        assertNotNull(driver);
        assertEquals("Test Driver", driver.getName());
        assertEquals("password123", driver.getPassword());
    }

    @Test
    void testUpdateDriver() throws SQLException {
        User driver = userDAO.getDriverById(testDriverId);
        driver.setName("Updated Driver");
        driver.setExperience("10 years");
        userDAO.updateDriver(driver);
        
        User updatedDriver = userDAO.getDriverById(testDriverId);
        assertEquals("Updated Driver", updatedDriver.getName());
        assertEquals("10 years", updatedDriver.getExperience());
    }

    @Test
    void testDeleteDriver() throws SQLException {
        userDAO.deleteDriver(testDriverId);
        User deletedDriver = userDAO.getDriverById(testDriverId);
        assertNull(deletedDriver);
    }

    @Test
    void testGetUserByEmail() throws SQLException {
        User user = userDAO.getUserByEmail("testdriver@example.com");
        assertNotNull(user);
        assertEquals(30, user.getAge());
        assertEquals("LIC123", user.getLicenseId());
        assertEquals(UserRole.DRIVER, user.getRole());
    }

    @Test
    void testIsEmailExists() throws SQLException {
        assertTrue(userDAO.isEmailExists("testdriver@example.com"));
        assertFalse(userDAO.isEmailExists("nonexistent@example.com"));
    }
}