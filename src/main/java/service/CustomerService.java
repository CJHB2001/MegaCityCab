package service;

import java.sql.SQLException;
import com.res.dao.CustomerDAO;
import com.res.model.Customer;

public class CustomerService {
    private CustomerDAO customerDAO = new CustomerDAO();

    public boolean addCustomer(Customer customer) throws SQLException {
        return customerDAO.addCustomer(customer);
    }

    public boolean isEmailExists(String email) throws SQLException {
        return customerDAO.isEmailExists(email);
    }

    public boolean isPhoneExists(String phone) throws SQLException {
        return customerDAO.isPhoneExists(phone);
    }
    
    public boolean isNicNumberExists(String nicNumber) throws SQLException {
        return customerDAO.isPhoneExists(nicNumber);
    }


    public String generateRegistrationNumber() throws SQLException {
        return customerDAO.generateRegistrationNumber();
    }
}