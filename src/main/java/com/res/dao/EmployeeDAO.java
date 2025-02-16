package com.res.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.res.model.Employee;
import util.DatabaseUtil;

public class EmployeeDAO {
    public void addEmployee(Employee employee) throws SQLException {
        String sql = "INSERT INTO employees (name, age, email, role, status, profile_image_path) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, employee.getName());
            pstmt.setInt(2, employee.getAge());
            pstmt.setString(3, employee.getEmail());
            pstmt.setString(4, employee.getRole());
            pstmt.setString(5, employee.getStatus());
            pstmt.setString(6, employee.getProfileImagePath());
            pstmt.executeUpdate();
        }
    }

    public List<Employee> getAllEmployees() throws SQLException {
        List<Employee> employeeList = new ArrayList<>();
        String sql = "SELECT * FROM employees";
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setId(rs.getInt("id"));
                employee.setName(rs.getString("name"));
                employee.setAge(rs.getInt("age"));
                employee.setEmail(rs.getString("email"));
                employee.setRole(rs.getString("role"));
                employee.setStatus(rs.getString("status"));
                employee.setProfileImagePath(rs.getString("profile_image_path"));
                employeeList.add(employee);
            }
        }
        return employeeList;
    }

    public void deleteEmployee(int employeeId) throws SQLException {
        String sql = "DELETE FROM employees WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, employeeId);
            pstmt.executeUpdate();
        }
    }

    public Employee getEmployeeById(int id) throws SQLException {
        String sql = "SELECT * FROM employees WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Employee employee = new Employee();
                    employee.setId(rs.getInt("id"));
                    employee.setName(rs.getString("name"));
                    employee.setAge(rs.getInt("age"));
                    employee.setEmail(rs.getString("email"));
                    employee.setRole(rs.getString("role"));
                    employee.setStatus(rs.getString("status"));
                    employee.setProfileImagePath(rs.getString("profile_image_path"));
                    return employee;
                }
            }
        }
        return null;
    }

    public void updateEmployee(Employee employee) throws SQLException {
        String sql = "UPDATE employees SET name = ?, age = ?, email = ?, role = ?, status = ?, profile_image_path = ? WHERE id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, employee.getName());
            pstmt.setInt(2, employee.getAge());
            pstmt.setString(3, employee.getEmail());
            pstmt.setString(4, employee.getRole());
            pstmt.setString(5, employee.getStatus());
            pstmt.setString(6, employee.getProfileImagePath());
            pstmt.setInt(7, employee.getId());
            pstmt.executeUpdate();
        }
    }
}