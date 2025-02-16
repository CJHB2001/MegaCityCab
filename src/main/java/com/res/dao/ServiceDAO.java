package com.res.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.res.model.Service;
import util.DatabaseUtil;

public class ServiceDAO {
    public void addService(Service service) throws SQLException {
        String sql = "INSERT INTO services (service_name, description, image_path) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, service.getServiceName());
            pstmt.setString(2, service.getDescription());
            pstmt.setString(3, service.getImagePath());
            pstmt.executeUpdate();
        }
    }

    public List<Service> getAllServices() throws SQLException {
        List<Service> serviceList = new ArrayList<>();
        String sql = "SELECT * FROM services";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Service service = new Service();
                service.setId(rs.getInt("id"));
                service.setServiceName(rs.getString("service_name"));
                service.setDescription(rs.getString("description"));
                service.setImagePath(rs.getString("image_path"));
                serviceList.add(service);
            }
        }
        return serviceList;
    }

    public void deleteService(int serviceId) throws SQLException {
        String sql = "DELETE FROM services WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, serviceId);
            pstmt.executeUpdate();
        }
    }

    public Service getServiceById(int id) throws SQLException {
        String sql = "SELECT * FROM services WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Service service = new Service();
                    service.setId(rs.getInt("id"));
                    service.setServiceName(rs.getString("service_name"));
                    service.setDescription(rs.getString("description"));
                    service.setImagePath(rs.getString("image_path"));
                    return service;
                }
            }
        }
        return null;
    }

    public void updateService(Service service) throws SQLException {
        String sql = "UPDATE services SET service_name = ?, description = ?, image_path = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, service.getServiceName());
            pstmt.setString(2, service.getDescription());
            pstmt.setString(3, service.getImagePath());
            pstmt.setInt(4, service.getId());
            pstmt.executeUpdate();
        }
    }
}