package com.res.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.res.model.Review;
import util.DatabaseUtil;

public class ReviewDAO {
    public void addReview(Review review) throws SQLException {
        String sql = "INSERT INTO reviews (first_name, last_name, email, message) VALUES (?, ?, ?, ? )";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, review.getFirstName());
            pstmt.setString(2, review.getLastName());
            pstmt.setString(3, review.getEmail());
            pstmt.setString(4, review.getMessage());
            pstmt.executeUpdate();
        }
    }

    public List<Review> getAllReviews() throws SQLException {
        List<Review> reviewList = new ArrayList<>();
        String sql = "SELECT * FROM reviews";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setFirstName(rs.getString("first_name"));
                review.setLastName(rs.getString("last_name"));
                review.setEmail(rs.getString("email"));
                review.setMessage(rs.getString("message"));
                reviewList.add(review);
            }
        }
        return reviewList;
    }

    public void deleteReview(int reviewId) throws SQLException {
        String sql = "DELETE FROM reviews WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, reviewId);
            pstmt.executeUpdate();
        }
    }
}
