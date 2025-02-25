package service;

import java.sql.SQLException;
import java.util.List;
import com.res.dao.VehicleDAO;
import com.res.model.Vehicle;

public class VehicleService {
    private VehicleDAO vehicleDAO = new VehicleDAO();

    public void addVehicle(Vehicle vehicle) throws SQLException {
        vehicleDAO.addVehicle(vehicle);
    }

    public List<Vehicle> getAllVehicles() throws SQLException {
        return vehicleDAO.getAllVehicles();
    }

    public void deleteVehicle(int vehicleId) throws SQLException {
        vehicleDAO.deleteVehicle(vehicleId);
    }

    public Vehicle getVehicleById(int id) throws SQLException {
        return vehicleDAO.getVehicleById(id);
    }

    public void updateVehicle(Vehicle vehicle) throws SQLException {
        vehicleDAO.updateVehicle(vehicle);
    }
}