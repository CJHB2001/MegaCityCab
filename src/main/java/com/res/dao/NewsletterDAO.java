package com.res.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.res.model.Newsletter;
import util.DatabaseUtil;

public class NewsletterDAO {
    public void addNewsletter(Newsletter newsletter) throws SQLException {
        String sql = "INSERT INTO newsletter (email, agreement) VALUES (?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, newsletter.getEmail());
            pstmt.setBoolean(2, newsletter.isAgreement());
            pstmt.executeUpdate();
        }
    }

    public List<Newsletter> getAllNewsletters() throws SQLException {
        List<Newsletter> newsletterList = new ArrayList<>();
        String sql = "SELECT * FROM newsletter";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Newsletter newsletter = new Newsletter();
                newsletter.setId(rs.getInt("id"));
                newsletter.setEmail(rs.getString("email"));
                newsletter.setAgreement(rs.getBoolean("agreement"));
                newsletterList.add(newsletter);
            }
        }
        return newsletterList;
    }

    public void deleteNewsletter(int newsletterId) throws SQLException {
        String sql = "DELETE FROM newsletter WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, newsletterId);
            pstmt.executeUpdate();
        }
    }
}