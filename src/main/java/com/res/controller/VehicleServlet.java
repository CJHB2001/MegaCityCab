package com.res.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.res.model.Vehicle;
import service.VehicleService;

@WebServlet("/vehicle")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 1024 * 1024 * 5,
                 maxRequestSize = 1024 * 1024 * 5 * 5)
public class VehicleServlet extends HttpServlet {
    private VehicleService vehicleService = new VehicleService();
    private static final String UPLOAD_DIRECTORY = "vehicle_images";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("edit".equals(action)) {
            int vehicleId = Integer.parseInt(request.getParameter("id"));
            try {
                Vehicle vehicle = vehicleService.getVehicleById(vehicleId);
                request.setAttribute("vehicle", vehicle);
                request.getRequestDispatcher("/AdminArea/editVehicle.jsp").forward(request, response);
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/AdminArea/cab.jsp");
            }
        } else if ("delete".equals(action)) {
            int vehicleId = Integer.parseInt(request.getParameter("id"));
            try {
                vehicleService.deleteVehicle(vehicleId);
                session.setAttribute("alertMessage", "Vehicle deleted successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/cab.jsp");
        } else {
            try {
                request.setAttribute("vehicleList", vehicleService.getAllVehicles());
                request.getRequestDispatcher("/AdminArea/vehicle.jsp").forward(request, response);
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
                response.sendRedirect(request.getContextPath() + "/AdminArea/cab.jsp");
            }
        }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String vehicleType = request.getParameter("vehicleType");
            String engineNumber = request.getParameter("engineNumber");
            String vehicleNumber = request.getParameter("vehicleNumber");
            String brand = request.getParameter("brand");
            String color = request.getParameter("color");
            String vehicleFuelType = request.getParameter("vehicleFuelType");
            int doors = Integer.parseInt(request.getParameter("doors"));
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            int driverId = Integer.parseInt(request.getParameter("driverName"));
            String driverName = request.getParameter("driverName");

            try {
                Vehicle vehicle = vehicleService.getVehicleById(id);
                vehicle.setVehicleType(vehicleType);
                vehicle.setEngineNumber(engineNumber);
                vehicle.setVehicleNumber(vehicleNumber);
                vehicle.setBrand(brand);
                vehicle.setColor(color);
                vehicle.setVehicleFuelType(vehicleFuelType);
                vehicle.setDoors(doors);
                vehicle.setCapacity(capacity);
                vehicle.setDriverId(driverId);
                vehicle.setDriverName(driverName);

                Part filePart = request.getPart("profilePhoto");
                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    String fileExtension = fileName.substring(fileName.lastIndexOf("."));
                    String newFileName = UUID.randomUUID().toString() + fileExtension;
                    String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();
                    String filePath = uploadPath + File.separator + newFileName;
                    filePart.write(filePath);
                    vehicle.setImagePath(UPLOAD_DIRECTORY + File.separator + newFileName);
                }

                vehicleService.updateVehicle(vehicle);
                session.setAttribute("alertMessage", "Vehicle updated successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/cab.jsp");
        } else {
            String vehicleType = request.getParameter("vehicleType");
            String engineNumber = request.getParameter("engineNumber");
            String vehicleNumber = request.getParameter("vehicleNumber");
            String brand = request.getParameter("brand");
            String color = request.getParameter("color");
            String vehicleFuelType = request.getParameter("vehicleFuelType");
            int doors = Integer.parseInt(request.getParameter("doors"));
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            int driverId = Integer.parseInt(request.getParameter("driverName"));
            String driverName = request.getParameter("driverName");

            Part filePart = request.getPart("profilePhoto");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = UUID.randomUUID().toString() + fileExtension;
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            String filePath = uploadPath + File.separator + newFileName;
            filePart.write(filePath);

            String imagePath = UPLOAD_DIRECTORY + File.separator + newFileName;
            Vehicle vehicle = new Vehicle();
            vehicle.setVehicleType(vehicleType);
            vehicle.setEngineNumber(engineNumber);
            vehicle.setVehicleNumber(vehicleNumber);
            vehicle.setBrand(brand);
            vehicle.setColor(color);
            vehicle.setVehicleFuelType(vehicleFuelType);
            vehicle.setDoors(doors);
            vehicle.setCapacity(capacity);
            vehicle.setDriverId(driverId);
            vehicle.setDriverName(driverName);
            vehicle.setImagePath(imagePath);

            try {
                vehicleService.addVehicle(vehicle);
                session.setAttribute("alertMessage", "New vehicle added successfully!");
                session.setAttribute("alertType", "success");
            } catch (SQLException e) {
                session.setAttribute("alertMessage", "Error: " + e.getMessage());
                session.setAttribute("alertType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/AdminArea/cab.jsp");
        }
    }
}