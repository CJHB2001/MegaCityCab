package service;

import java.sql.SQLException;
import java.util.List;

import com.res.dao.CustomerDAO;
import com.res.model.Customer;
import com.res.model.Employee;

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
    
    public Customer validateCustomer(String email, String password) throws SQLException {
        return customerDAO.getCustomerByEmailAndPassword(email, password);
    }
    
    public List<Customer> getAllCustomers() throws SQLException {
        return customerDAO.getAllCustomers();
    }
    
}