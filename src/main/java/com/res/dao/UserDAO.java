package com.res.dao;


import com.res.model.User;

import util.DatabaseUtil;
import service.UserService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    public int authenticate(String email, String password, String role) throws SQLException {
        String sql = "SELECT password, role FROM users WHERE email = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, email);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String storedPassword = rs.getString("password");
                    String storedRole = rs.getString("role");
                    if (password.equals(storedPassword)) {
                        if (role.equals(storedRole)) {
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
                    user.setRole(rs.getString("role"));
                    return user;
                }
            }
        }
        return null;
    }
}