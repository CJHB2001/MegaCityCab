package service;


import java.sql.SQLException;
import java.util.List;
import com.res.dao.ServiceDAO;
import com.res.model.Service;

public class ServiceService {
    private ServiceDAO serviceDAO = new ServiceDAO();

    public void addService(Service service) throws SQLException {
        serviceDAO.addService(service);
    }

    public List<Service> getAllServices() throws SQLException {
        return serviceDAO.getAllServices();
    }

    public void deleteService(int serviceId) throws SQLException {
        serviceDAO.deleteService(serviceId);
    }

    public Service getServiceById(int id) throws SQLException {
        return serviceDAO.getServiceById(id);
    }

    public void updateService(Service service) throws SQLException {
        serviceDAO.updateService(service);
    }
}
