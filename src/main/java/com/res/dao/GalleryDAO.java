package com.res.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.res.model.Gallery;
import util.DatabaseUtil;

public class GalleryDAO {
    public void addGallery(Gallery gallery) throws SQLException {
        String sql = "INSERT INTO gallery (title, description, image_path) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, gallery.getTitle());
            pstmt.setString(2, gallery.getDescription());
            pstmt.setString(3, gallery.getImagePath());
            pstmt.executeUpdate();
        }
    }

    public List<Gallery> getAllGalleries() throws SQLException {
        List<Gallery> galleryList = new ArrayList<>();
        String sql = "SELECT * FROM gallery";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Gallery gallery = new Gallery();
                gallery.setId(rs.getInt("id"));
                gallery.setTitle(rs.getString("title"));
                gallery.setDescription(rs.getString("description"));
                gallery.setImagePath(rs.getString("image_path"));
                galleryList.add(gallery);
            }
        }
        return galleryList;
    }

    public void deleteGallery(int galleryId) throws SQLException {
        String sql = "DELETE FROM gallery WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, galleryId);
            pstmt.executeUpdate();
        }
    }

    public Gallery getGalleryById(int id) throws SQLException {
        String sql = "SELECT * FROM gallery WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Gallery gallery = new Gallery();
                    gallery.setId(rs.getInt("id"));
                    gallery.setTitle(rs.getString("title"));
                    gallery.setDescription(rs.getString("description"));
                    gallery.setImagePath(rs.getString("image_path"));
                    return gallery;
                }
            }
        }
        return null;
    }

    public void updateGallery(Gallery gallery) throws SQLException {
        String sql = "UPDATE gallery SET title = ?, description = ?, image_path = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, gallery.getTitle());
            pstmt.setString(2, gallery.getDescription());
            pstmt.setString(3, gallery.getImagePath());
            pstmt.setInt(4, gallery.getId());
            pstmt.executeUpdate();
        }
    }
}