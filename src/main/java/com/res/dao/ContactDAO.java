package com.res.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.res.model.Contact;
import util.DatabaseUtil;

public class ContactDAO {
    public void addContact(Contact contact) throws SQLException {
        String sql = "INSERT INTO contacts (full_name, phone, email, message) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, contact.getFullName());
            pstmt.setString(2, contact.getPhone());
            pstmt.setString(3, contact.getEmail());
            pstmt.setString(4, contact.getMessage());
            pstmt.executeUpdate();
        }
    }

    public List<Contact> getAllContacts() throws SQLException {
        List<Contact> contactList = new ArrayList<>();
        String sql = "SELECT * FROM contacts";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setId(rs.getInt("id"));
                contact.setFullName(rs.getString("full_name"));
                contact.setPhone(rs.getString("phone"));
                contact.setEmail(rs.getString("email"));
                contact.setMessage(rs.getString("message"));
                contact.setReplied(rs.getBoolean("replied"));
                contactList.add(contact);
            }
        }
        return contactList;
    }
    
    public void deleteContact(int contactId) throws SQLException {
        String sql = "DELETE FROM contacts WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, contactId);
            pstmt.executeUpdate();
        }
    }
    
    public void markAsReplied(int contactId) throws SQLException {
        String sql = "UPDATE contacts SET replied = true WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, contactId);
            pstmt.executeUpdate();
        }
    }
}