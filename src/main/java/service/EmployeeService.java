package service;


import java.sql.SQLException;
import java.util.List;
import com.res.dao.EmployeeDAO;
import com.res.model.Employee;

public class EmployeeService {
    private EmployeeDAO employeeDAO = new EmployeeDAO();

    public void addEmployee(Employee employee) throws SQLException {
        employeeDAO.addEmployee(employee);
    }

    public List<Employee> getAllEmployees() throws SQLException {
        return employeeDAO.getAllEmployees();
    }

    public void deleteEmployee(int employeeId) throws SQLException {
        employeeDAO.deleteEmployee(employeeId);
    }

    public Employee getEmployeeById(int id) throws SQLException {
        return employeeDAO.getEmployeeById(id);
    }

    public void updateEmployee(Employee employee) throws SQLException {
        employeeDAO.updateEmployee(employee);
    }
}
