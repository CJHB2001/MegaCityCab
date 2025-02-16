package service;


import com.res.dao.UserDAO;
import com.res.model.User;

import java.sql.SQLException;

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
}
