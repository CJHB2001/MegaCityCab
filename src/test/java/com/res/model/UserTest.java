package com.res.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class UserTest {
    private User user;
    private UserRole testRole;

    @BeforeEach
    void setUp() {
        testRole = UserRole.DRIVER; // Assuming UserRole.DRIVER exists
        user = new User(
            "test@example.com", 
            "password123", 
            testRole, 
            "John Doe", 
            30, 
            "5 years", 
            "LIC123", 
            "Male", 
            "/profile.jpg"
        );
    }

    @Test
    void testGettersAndSetters() {
        user.setId(1);
        assertEquals(1, user.getId());
        assertEquals("test@example.com", user.getEmail());
        assertEquals("password123", user.getPassword());
        assertEquals(testRole, user.getRole());
        assertEquals("John Doe", user.getName());
        assertEquals(30, user.getAge());
        assertEquals("5 years", user.getExperience());
        assertEquals("LIC123", user.getLicenseId());
        assertEquals("Male", user.getGender());
        assertEquals("/profile.jpg", user.getProfilePhoto());
    }

    @Test
    void testUpdateProperties() {
        user.setId(2);
        user.setEmail("new@example.com");
        user.setPassword("newpassword");
        user.setRole(UserRole.ADMIN);
        user.setName("Jane Doe");
        user.setAge(35);
        user.setExperience("10 years");
        user.setLicenseId("LIC456");
        user.setGender("Female");
        user.setProfilePhoto("/new/profile.jpg");

        assertEquals(2, user.getId());
        assertEquals("new@example.com", user.getEmail());
        assertEquals("newpassword", user.getPassword());
        assertEquals(UserRole.ADMIN, user.getRole());
        assertEquals("Jane Doe", user.getName());
        assertEquals(35, user.getAge());
        assertEquals("10 years", user.getExperience());
        assertEquals("LIC456", user.getLicenseId());
        assertEquals("Female", user.getGender());
        assertEquals("/new/profile.jpg", user.getProfilePhoto());
    }

    @Test
    void testRoleStringConversion() {
        // Test converting role enum to string value
        assertEquals("driver", user.getRoleValue()); // Assuming UserRole.DRIVER.getValue() returns "driver"

        // Test setting role from a valid string
        user.setRoleFromString("admin");
        assertEquals(UserRole.ADMIN, user.getRole());
        assertEquals("admin", user.getRoleValue());
    }
}