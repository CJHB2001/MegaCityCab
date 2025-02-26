package com.res.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.res.model.Vehicle;
import util.DatabaseUtil;

public class VehicleDAO {
    public void addVehicle(Vehicle vehicle) throws SQLException {
        String sql = "INSERT INTO vehicle (vehicle_type, engine_number, vehicle_number, brand, color, vehicle_fuel_type, doors, capacity, driver_id, image_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, vehicle.getVehicleType());
            pstmt.setString(2, vehicle.getEngineNumber());
            pstmt.setString(3, vehicle.getVehicleNumber());
            pstmt.setString(4, vehicle.getBrand());
            pstmt.setString(5, vehicle.getColor());
            pstmt.setString(6, vehicle.getVehicleFuelType());
            pstmt.setInt(7, vehicle.getDoors());
            pstmt.setInt(8, vehicle.getCapacity());
            pstmt.setInt(9, vehicle.getDriverId());

            pstmt.setString(10, vehicle.getImagePath());
            pstmt.executeUpdate();
        }
    }

    public List<Vehicle> getAllVehicles() throws SQLException {
        List<Vehicle> vehicleList = new ArrayList<>();
        String sql = "SELECT v.*, u.name AS driver_name FROM vehicle v " +
                     "JOIN users u ON v.driver_id = u.id"; // Join with users table
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Vehicle vehicle = new Vehicle();
                vehicle.setId(rs.getInt("id"));
                vehicle.setVehicleType(rs.getString("vehicle_type"));
                vehicle.setEngineNumber(rs.getString("engine_number"));
                vehicle.setVehicleNumber(rs.getString("vehicle_number"));
                vehicle.setBrand(rs.getString("brand"));
                vehicle.setColor(rs.getString("color"));
                vehicle.setVehicleFuelType(rs.getString("vehicle_fuel_type"));
                vehicle.setDoors(rs.getInt("doors"));
                vehicle.setCapacity(rs.getInt("capacity"));
                vehicle.setDriverId(rs.getInt("driver_id"));
                vehicle.setDriverName(rs.getString("driver_name")); // Fetch driver name from users table
                vehicle.setImagePath(rs.getString("image_path"));
                vehicleList.add(vehicle);
            }
        }
        return vehicleList;
    }

    public void deleteVehicle(int vehicleId) throws SQLException {
        String sql = "DELETE FROM vehicle WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, vehicleId);
            pstmt.executeUpdate();
        }
    }

    public Vehicle getVehicleById(int id) throws SQLException {
        String sql = "SELECT * FROM vehicle WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Vehicle vehicle = new Vehicle();
                    vehicle.setId(rs.getInt("id"));
                    vehicle.setVehicleType(rs.getString("vehicle_type"));
                    vehicle.setEngineNumber(rs.getString("engine_number"));
                    vehicle.setVehicleNumber(rs.getString("vehicle_number"));
                    vehicle.setBrand(rs.getString("brand"));
                    vehicle.setColor(rs.getString("color"));
                    vehicle.setVehicleFuelType(rs.getString("vehicle_fuel_type"));
                    vehicle.setDoors(rs.getInt("doors"));
                    vehicle.setCapacity(rs.getInt("capacity"));
                    vehicle.setDriverId(rs.getInt("driver_id"));
                    vehicle.setImagePath(rs.getString("image_path"));
                    return vehicle;
                }
            }
        }
        return null;
    }

    public void updateVehicle(Vehicle vehicle) throws SQLException {
        String sql = "UPDATE vehicle SET vehicle_type = ?, engine_number = ?, vehicle_number = ?, brand = ?, color = ?, vehicle_fuel_type = ?, doors = ?, capacity = ?, driver_id = ?, image_path = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, vehicle.getVehicleType());
            pstmt.setString(2, vehicle.getEngineNumber());
            pstmt.setString(3, vehicle.getVehicleNumber());
            pstmt.setString(4, vehicle.getBrand());
            pstmt.setString(5, vehicle.getColor());
            pstmt.setString(6, vehicle.getVehicleFuelType());
            pstmt.setInt(7, vehicle.getDoors());
            pstmt.setInt(8, vehicle.getCapacity());
            pstmt.setInt(9, vehicle.getDriverId());
        
            pstmt.setString(10, vehicle.getImagePath());
            pstmt.setInt(11, vehicle.getId());
            pstmt.executeUpdate();
        }
    }
}