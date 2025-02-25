package service;


import com.res.dao.UserDAO;
import com.res.model.User;
import com.res.model.UserRole;

import java.sql.SQLException;
import java.util.List;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public static final int AUTH_SUCCESS = 0;
    public static final int INVALID_EMAIL = 1;
    public static final int INVALID_PASSWORD = 2;
    public static final int INVALID_ROLE = 3;

    public int authenticateUser(String email, String password, String role) throws SQLException {
        return userDAO.authenticate(email, password, role);
    }

    public User getUserByEmail(String email) throws SQLException {
        return userDAO.getUserByEmail(email);
    }
    
    public void addDriver(User driver) throws SQLException {
        driver.setRole(UserRole.DRIVER);
        userDAO.addDriver(driver);
    }
    
    public List<User> getAllDrivers() throws SQLException {
        return userDAO.getAllDrivers();
    }
    
    public User getDriverById(int id) throws SQLException {
        return userDAO.getDriverById(id);
    }
    
    public void updateDriver(User driver) throws SQLException {
     
        driver.setRole(UserRole.DRIVER);
        userDAO.updateDriver(driver);
    }

    public void deleteDriver(int id) throws SQLException {
        userDAO.deleteDriver(id);
    }
    
    public boolean isEmailExists(String email) throws SQLException {
        return userDAO.isEmailExists(email);
    }
}
