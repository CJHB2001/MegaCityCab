package com.res.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class TestDatabaseUtil {
    private static final String JDBC_URL = "jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1";
    private static final String USER = "sa";
    private static final String PASSWORD = "";
    
    static {
        try {
            Class.forName("org.h2.Driver");
            initializeTestDatabase();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
    }
    
    private static void initializeTestDatabase() throws SQLException {
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            // Create the gallery table for testing
            stmt.execute("CREATE TABLE IF NOT EXISTS gallery (" +
                         "id INT AUTO_INCREMENT PRIMARY KEY," +
                         "title VARCHAR(255) NOT NULL," +
                         "description TEXT," +
                         "image_path VARCHAR(255))");
        }
    }
    
    public static void resetDatabase() throws SQLException {
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.execute("DELETE FROM gallery");
            stmt.execute("ALTER TABLE gallery ALTER COLUMN id RESTART WITH 1");
        }
    }
}