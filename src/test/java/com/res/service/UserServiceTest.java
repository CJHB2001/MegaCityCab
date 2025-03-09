package com.res.service;

import static org.junit.jupiter.api.Assertions.*;
import static service.UserService.*;
import com.res.model.User;
import com.res.model.UserRole;

import service.UserService;

import java.sql.SQLException;
import java.util.List;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class UserServiceTest {
    private UserService userService;
    private User testDriver;
    private int testDriverId;

    @BeforeEach
    void setUp() throws SQLException {
        userService = new UserService();
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
        userService.addDriver(testDriver);
        
        User addedDriver = userService.getUserByEmail("testdriver@example.com");
        this.testDriverId = addedDriver.getId();
    }

    @AfterEach
    void tearDown() throws SQLException {
        if (testDriverId != 0) {
            userService.deleteDriver(testDriverId);
        }
    }

   
    @Test
    void testAddDriver() throws SQLException {
        List<User> drivers = userService.getAllDrivers();
        assertTrue(drivers.stream().anyMatch(d -> 
            d.getEmail().equals("testdriver@example.com")
        ));
    }



    @Test
    void testGetDriverById() throws SQLException {
        User driver = userService.getDriverById(testDriverId);
        assertNotNull(driver);
        assertEquals("LIC123", driver.getLicenseId());
        assertEquals(UserRole.DRIVER, driver.getRole());
    }

    @Test
    void testUpdateDriver() throws SQLException {
        User driver = userService.getDriverById(testDriverId);
        driver.setAge(35);
        driver.setExperience("10 years");
        userService.updateDriver(driver);
        
        User updatedDriver = userService.getDriverById(testDriverId);
        assertEquals(35, updatedDriver.getAge());
        assertEquals("10 years", updatedDriver.getExperience());
    }

    @Test
    void testDeleteDriver() throws SQLException {
        userService.deleteDriver(testDriverId);
        User deletedDriver = userService.getDriverById(testDriverId);
        assertNull(deletedDriver);
    }


    @Test
    void testIsEmailExists() throws SQLException {
        assertTrue(userService.isEmailExists("testdriver@example.com"));
        assertFalse(userService.isEmailExists("nonexistent@example.com"));
    }
}