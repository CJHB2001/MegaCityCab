package com.res.dao;

import java.sql.*;
import com.res.model.Customer;
import util.DatabaseUtil;

public class CustomerDAO {
    public boolean addCustomer(Customer customer) throws SQLException {
        String sql = "INSERT INTO customers (first_name, last_name, phone, email, password, address_line1, address_line2, nic_number, registration_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, customer.getFirstName());
            pstmt.setString(2, customer.getLastName());
            pstmt.setString(3, customer.getPhone());
            pstmt.setString(4, customer.getEmail());
            pstmt.setString(5, customer.getPassword());
            pstmt.setString(6, customer.getAddressLine1());
            pstmt.setString(7, customer.getAddressLine2());
            pstmt.setString(8, customer.getNicNumber());
            pstmt.setString(9, customer.getRegistrationNumber());
            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        }
    }

    public boolean isEmailExists(String email) throws SQLException {
        String sql = "SELECT * FROM customers WHERE email = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    public boolean isPhoneExists(String phone) throws SQLException {
        String sql = "SELECT * FROM customers WHERE phone = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, phone);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    
    public boolean isNicNumberExists(String nicNumber) throws SQLException {
        String sql = "SELECT * FROM customers WHERE nic_number = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, nicNumber);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        }
    }
    
    public String generateRegistrationNumber() throws SQLException {
        String sql = "SELECT MAX(id) FROM customers";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                int maxId = rs.getInt(1);
                return "CUST" + String.format("%05d", maxId + 1); // Example: CUST00001
            }
        }
        return "CUST00001"; // Default if no customers exist
    }
    public Customer getCustomerByEmailAndPassword(String email, String password) throws SQLException {
        String sql = "SELECT * FROM customers WHERE email = ? AND password = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Customer customer = new Customer();
                    customer.setId(rs.getInt("id"));
                    customer.setFirstName(rs.getString("first_name"));
                    customer.setLastName(rs.getString("last_name"));
                    customer.setPhone(rs.getString("phone"));
                    customer.setEmail(rs.getString("email"));
                    customer.setPassword(rs.getString("password"));
                    customer.setAddressLine1(rs.getString("address_line1"));
                    customer.setAddressLine2(rs.getString("address_line2"));
                    customer.setNicNumber(rs.getString("nic_number"));
                    customer.setRegistrationNumber(rs.getString("registration_number"));
                    return customer;
                }
            }
        }
        return null; // Return null if no customer is found
    }
}