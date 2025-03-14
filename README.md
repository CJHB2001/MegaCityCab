# Mega City Cab Service Web Application

This repository contains the Maven-based **MEGA CITY CAB SERVICE Web Application**, which handles user authentication, booking management, cabs and driver management, and more for cab service operations.

## Images

<div align="center">
  <table>
    <tr>
      <td><img src="/Documents/Images/HomePage1.png" width="300" alt="Home Page"></td>
      <td><img src="/Documents/Images/HomePage2.png" width="300" alt="Admin Driver Login"></td>
      <td><img src="/Documents/Images/BookingPage.png" width="300" alt="Admin Dashboard"></td>
    </tr>
    <tr>
      <td><img src="/Documents/Images/AdminDasboard.png" width="300" alt="Driver Dashboard"></td>
        <td><img src="/Documents/Images/AdminDashboard2.png" width="300" alt="Driver Dashboard"></td>
        <td><img src="/Documents/Images/BookingAdmin.png" width="300" alt="Driver Dashboard"></td>
    </tr>
      <tr>
      <td><img src="/Documents/Images/AdminDriverLoin.png" width="300" alt="Driver Dashboard"></td>
        <td><img src="/Documents/Images/d1.png" width="300" alt="Driver Dashboard"></td>
        <td><img src="/Documents/Images/d2.png" width="300" alt="Driver Dashboard"></td>
    </tr>
  </table>
</div>

## Technologies Used

- **Java 17**: Programming language used for backend development.
- **Eclipse IDE**: Integrated development environment for Java development.
- **Maven**: Project management and dependency management tool.
- **Tomcat 9**: Servlet container to run the web application.
- **MySQL**: Database for storing customer, orders, and reservation data.
- **Bootstrap 5**: Frontend framework for building responsive UIs.
- **Font Awesome & Boxicon**: Custom fonts and icons.
- **JUnit 5**: Unit testing framework.
- **Toastr**: For displaying non-blocking notifications.

## Installation and Setup

To set up the project locally using **Eclipse IDE**, follow these steps:

### 1. Clone the Repository

- Open Eclipse IDE.
- Go to **File > Import > Git > Projects from Git > Clone URI**.
- Enter the repository URL: `https://github.com/CJHB2001/MegaCityCab`.
- Click **Next** and complete the clone process.

### 2. Import the Maven Project

- After cloning, go to **File > Import > Maven > Existing Maven Projects**.
- Browse to the location where the project was cloned, select the root folder, and click **Finish**.

### 3. Set up MySQL Database

- Create a MySQL database, e.g., `megacitycab`.
- Open the file `src/main/java/com/util/DatabaseUtil.java` in Eclipse.
- Update the following properties with your MySQL credentials:

  ```java
  private static final String URL = "jdbc:mysql://localhost:3306/megacitycab";
  private static final String USER = "Your user name";
  private static final String PASSWORD = "Your password";
  ```

### 4. Configure Tomcat in Eclipse

- Go to **Window > Show View > Servers**.
- Right-click in the **Servers** tab and select **New > Server**.
- Choose **Apache Tomcat v9.0** and point to your Tomcat installation directory.
- Add the project to the server and click **Finish**.

### 5. Run the Application

- Right-click on the project, select **Run As > Run on Server**.
- The application should now be running at `http://localhost:8080`.

## Running Unit Tests

To run the unit tests using **JUnit 5** in Eclipse:

1. **Right-click on the project folder** or individual test class (e.g., `CustomerRegistrationServlet`, `CustomerDAO`).
2. Select **Run As > JUnit Test**.
3. Eclipse will display the test results in the **JUnit** view.

You can also run all tests via Maven:

```bash
mvn test
```

## Version Control and GitHub Integration

This project utilizes **Git** for version control and **GitHub** for repository management. Here's how version control practices are applied:

- **Multiple commits**: Frequent commits with detailed messages documenting the addition of features, bug fixes, and improvements.
- **Branching**: The project follows a structured branching strategy for development and releases.
- **Cherry-picking**: Selective commits from different branches are used when necessary.
- **Tags**: The project uses tags to mark key milestones, such as `v1.0` for the initial release and subsequent versions.
- **Releases**: New features and fixes are released incrementally.
- **Dependabot Alerts**: GitHub's Dependabot is integrated to detect security vulnerabilities and manage dependencies.

## Folder Structure

- **src/main/java/com/res**: Contains the Java source code
  - `controller`: Servlets for all users.
  - `service`: Business logic layer.
  - `dao`: Database interaction layer.
  - `enums`: Enums for application.
  - `model`: Entity classes representing database tables.
  - `util`: Database connection manager.
- **src/main/webapp/WEB-INF/view**: Contains views related to the project.
- **src/main/webapp/AdminArea**: Contains admin-related images, CSS, JavaScript, and JSP files.
- **src/main/webapp/DriverArea**: Contains driver-related images, CSS, JavaScript, and JSP files.
- **src/main/webapp/PublicArea**: Contains customer-related images, CSS, JavaScript, and JSP files.
- **src/test/java**: Contains unit tests written with **JUnit** (available in staging/test branch only).

## Running Tests

To run tests:
- In **Eclipse**, right-click on the project or individual test class and select **Run As > JUnit Test**.
- Or use Maven from the terminal:

  ```bash
  mvn test
  ```

Test classes include:
- `CustomerDAOTest`
- `BlogDAOTest`
- `BookingDAO`
- `UserDAO`
- `CustomerModel`
- `UserModel`
- `BlogModel`
- `BookingService`
- `BlogService`
- `CustomerLoginServlet`
- `CustomerRegistrationServlet`
- `BlogServlet`

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
