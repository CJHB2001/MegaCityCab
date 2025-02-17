package com.res.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.res.model.Blog;
import util.DatabaseUtil;

public class BlogDAO {
    public void addBlog(Blog blog) throws SQLException {
        String sql = "INSERT INTO blog (title, date, summary, image_path) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, blog.getTitle());
            pstmt.setDate(2, new java.sql.Date(blog.getDate().getTime()));
            pstmt.setString(3, blog.getSummary());
            pstmt.setString(4, blog.getImagePath());
            pstmt.executeUpdate();
        }
    }

    public List<Blog> getAllBlogs() throws SQLException {
        List<Blog> blogList = new ArrayList<>();
        String sql = "SELECT * FROM blog";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setDate(rs.getDate("date"));
                blog.setSummary(rs.getString("summary"));
                blog.setImagePath(rs.getString("image_path"));
                blogList.add(blog);
            }
        }
        return blogList;
    }

    public void deleteBlog(int blogId) throws SQLException {
        String sql = "DELETE FROM blog WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, blogId);
            pstmt.executeUpdate();
        }
    }

    public Blog getBlogById(int id) throws SQLException {
        String sql = "SELECT * FROM blog WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Blog blog = new Blog();
                    blog.setId(rs.getInt("id"));
                    blog.setTitle(rs.getString("title"));
                    blog.setDate(rs.getDate("date"));
                    blog.setSummary(rs.getString("summary"));
                    blog.setImagePath(rs.getString("image_path"));
                    return blog;
                }
            }
        }
        return null;
    }

    public void updateBlog(Blog blog) throws SQLException {
        String sql = "UPDATE blog SET title = ?, date = ?, summary = ?, image_path = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, blog.getTitle());
            pstmt.setDate(2, new java.sql.Date(blog.getDate().getTime()));
            pstmt.setString(3, blog.getSummary());
            pstmt.setString(4, blog.getImagePath());
            pstmt.setInt(5, blog.getId());
            pstmt.executeUpdate();
        }
    }
}
