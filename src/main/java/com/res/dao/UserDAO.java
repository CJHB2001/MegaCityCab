package com.res.dao;

import com.res.model.User;
import com.res.model.UserRole;
import util.DatabaseUtil;
import service.UserService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
  
    public int authenticate(String email, String password, String roleValue) throws SQLException {
        String sql = "SELECT password, role FROM users WHERE email = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, email);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String storedPassword = rs.getString("password");
                    String storedRole = rs.getString("role");
                    if (password.equals(storedPassword)) {
                        if (roleValue.equals(storedRole)) {
                            return UserService.AUTH_SUCCESS;
                        } else {
                            return UserService.INVALID_ROLE;
                        }
                    } else {
                        return UserService.INVALID_PASSWORD;
                    }
                } else {
                    return UserService.INVALID_EMAIL;
                }
            }
        }
    }

    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, email);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setEmail(rs.getString("email"));
                    user.setRoleFromString(rs.getString("role"));
                    user.setName(rs.getString("name"));
                    user.setAge(rs.getInt("age"));
                    user.setExperience(rs.getString("experience"));
                    user.setLicenseId(rs.getString("license_id"));
                    user.setGender(rs.getString("gender"));
                    user.setProfilePhoto(rs.getString("profile_photo"));
                    return user;
                }
            }
        }
        return null;
    }
    

    public void addDriver(User driver) throws SQLException {
        String sql = "INSERT INTO users (email, password, role, name, age, experience, license_id, gender, profile_photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, driver.getEmail());
            pstmt.setString(2, driver.getPassword());
            pstmt.setString(3, UserRole.DRIVER.getValue()); 
            pstmt.setString(4, driver.getName());
            pstmt.setInt(5, driver.getAge());
            pstmt.setString(6, driver.getExperience());
            pstmt.setString(7, driver.getLicenseId());
            pstmt.setString(8, driver.getGender());
            pstmt.setString(9, driver.getProfilePhoto());
            pstmt.executeUpdate();
        }
    }
    
    public List<User> getAllDrivers() throws SQLException {
        List<User> driverList = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             
            pstmt.setString(1, UserRole.DRIVER.getValue());
             
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    User driver = new User();
                    driver.setId(rs.getInt("id"));
                    driver.setEmail(rs.getString("email"));
                    driver.setRoleFromString(rs.getString("role"));
                    driver.setName(rs.getString("name"));
                    driver.setAge(rs.getInt("age"));
                    driver.setExperience(rs.getString("experience"));
                    driver.setLicenseId(rs.getString("license_id"));
                    driver.setGender(rs.getString("gender"));
                    driver.setProfilePhoto(rs.getString("profile_photo"));
                    driverList.add(driver);
                }
            }
        }
        return driverList;
    }
    
    public User getDriverById(int id) throws SQLException {
        String sql = "SELECT * FROM users WHERE id = ? AND role = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.setString(2, UserRole.DRIVER.getValue());
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User driver = new User();
                    driver.setId(rs.getInt("id"));
                    driver.setEmail(rs.getString("email"));
                    driver.setPassword(rs.getString("password"));
                    driver.setRoleFromString(rs.getString("role"));
                    driver.setName(rs.getString("name"));
                    driver.setAge(rs.getInt("age"));
                    driver.setExperience(rs.getString("experience"));
                    driver.setLicenseId(rs.getString("license_id"));
                    driver.setGender(rs.getString("gender"));
                    driver.setProfilePhoto(rs.getString("profile_photo"));
                    return driver;
                }
            }
        }
        return null;
    }
    
    public void updateDriver(User driver) throws SQLException {
        String sql = "UPDATE users SET email = ?, password = ?, name = ?, age = ?, experience = ?, license_id = ?, gender = ?, profile_photo = ? WHERE id = ? AND role = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, driver.getEmail());
            pstmt.setString(2, driver.getPassword());
            pstmt.setString(3, driver.getName());
            pstmt.setInt(4, driver.getAge());
            pstmt.setString(5, driver.getExperience());
            pstmt.setString(6, driver.getLicenseId());
            pstmt.setString(7, driver.getGender());
            pstmt.setString(8, driver.getProfilePhoto());
            pstmt.setInt(9, driver.getId());
            pstmt.setString(10, UserRole.DRIVER.getValue());
            pstmt.executeUpdate();
        }
    }
    
    public void deleteDriver(int id) throws SQLException {
        String sql = "DELETE FROM users WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
    }
    
    public boolean isEmailExists(String email) throws SQLException {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; 
                }
            }
        }
        return false;
    }
}