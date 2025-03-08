<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.res.model.Booking" %>
<%@ page import="com.res.dao.BookingDAO" %>
<%@ page import="com.res.model.Vehicle" %>
<%@ page import="com.res.dao.VehicleDAO" %>
<%@ page import="com.res.model.User" %>
<%@ page import="com.res.dao.UserDAO" %>
<%@ page import="com.res.model.Customer" %>
<%@ page import="com.res.dao.CustomerDAO" %>

<%
    // Fetch all bookings
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookingList = bookingDAO.getAllBookings();
    request.setAttribute("bookingList", bookingList);
    
    // Fetch all vehicles
    VehicleDAO vehicleDAO = new VehicleDAO();
    List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();
    request.setAttribute("vehicleList", vehicleList);
    
    // Fetch all drivers
    UserDAO userDAO = new UserDAO();
    List<User> userList = userDAO.getAllDrivers();
    request.setAttribute("userList", userList);
    
    // Fetch all customers
    CustomerDAO customerDAO = new CustomerDAO();
    List<Customer> customerList = customerDAO.getAllCustomers();
    request.setAttribute("customerList", customerList);
    
    // Initialize counters
    int totalOrders = bookingList.size();
    int completedOrders = 0;
    int confirmedOrders = 0;
    int pendingOrders = 0;
    float totalRevenue = 0;
    int totalDrivers = userList.size();
    
    // Vehicle category counters
    Map<String, Integer> vehicleCategories = new HashMap<>();
    vehicleCategories.put("Car", 0);
    vehicleCategories.put("Van", 0);
    vehicleCategories.put("Jeep", 0);
    vehicleCategories.put("Tuk Tuk", 0);
    
    // Count vehicles by category
    for (Vehicle vehicle : vehicleList) {
        String type = vehicle.getVehicleType();
        if (vehicleCategories.containsKey(type)) {
            vehicleCategories.put(type, vehicleCategories.get(type) + 1);
        }
    }
    
    // Calculate order statistics
    for (Booking booking : bookingList) {
        if (booking.getTripStatus() == 3) {
            // Completed orders
            completedOrders++;
            totalRevenue += booking.getTotalBill();
        } else if (booking.getBookingStatus() == 1) {
            // Confirmed orders
            confirmedOrders++;
        } else if (booking.getBookingStatus() == 0) {
            // Pending orders
            pendingOrders++;
        }
    }
    
    // Calculate percentages
    int completedPercentage = (totalOrders > 0) ? (completedOrders * 100 / totalOrders) : 0;
    int confirmedPercentage = (totalOrders > 0) ? (confirmedOrders * 100 / totalOrders) : 0;
    int pendingPercentage = (totalOrders > 0) ? (pendingOrders * 100 / totalOrders) : 0;
    
    // Set attributes for use in JSP
    request.setAttribute("totalOrders", totalOrders);
    request.setAttribute("completedOrders", completedOrders);
    request.setAttribute("confirmedOrders", confirmedOrders);
    request.setAttribute("pendingOrders", pendingOrders);
    request.setAttribute("totalRevenue", totalRevenue);
    request.setAttribute("totalDrivers", totalDrivers);
    request.setAttribute("totalVehicles", vehicleList.size());
    request.setAttribute("carCount", vehicleCategories.get("Car"));
    request.setAttribute("vanCount", vehicleCategories.get("Van"));
    request.setAttribute("jeepCount", vehicleCategories.get("Jeep"));
    request.setAttribute("tukTukCount", vehicleCategories.get("Tuk Tuk"));
    request.setAttribute("completedPercentage", completedPercentage);
    request.setAttribute("confirmedPercentage", confirmedPercentage);
    request.setAttribute("pendingPercentage", pendingPercentage);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <title>Admin Dashboard</title>
</head>
<body>
<c:if test="${empty sessionScope.user || sessionScope.user.role != 'ADMIN'}">
    <c:redirect url="/AdminArea/login.jsp" />
</c:if>
    <c:if test="${empty sessionScope.user}">
        <c:redirect url="/AdminArea/login.jsp" />
    </c:if>
    
    <!-- SIDEBAR -->
    <jsp:include page="./sideBar.jsp" />
    <!-- SIDEBAR -->

    <!-- NAVBAR -->
    <section id="content">
        <!-- NAVBAR -->
        <jsp:include page="./navBar.jsp" />
        <!-- NAVBAR -->

        <!-- MAIN -->
        <main>
<div class="d-flex justify-content-between align-items-center mb-4">
    <h1 class="title">Admin Dashboard</h1>
    <a href="dashboardReport.jsp" class="btn btn-primary">
         <i class='bx bx-file'></i>  Report
    </a>
</div>
            <div class="info-data">
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>${totalOrders}</h2>
                            <p>Total Orders</p>
                        </div>
                        <i class='bx bx-receipt icon'></i>
                    </div>
                    <span class="progress" data-value="100%"></span>
                    <span class="label">All Bookings</span>
                </div>
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>${completedOrders}</h2>
                            <p>Completed Orders</p>
                        </div>
                        <i class='bx bx-check-circle icon'></i>
                    </div>
                    <span class="progress" data-value="${completedPercentage}%"></span>
                    <span class="label">${completedPercentage}%</span>
                </div>
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>${confirmedOrders}</h2>
                            <p>Confirmed Orders</p>
                        </div>
                        <i class='bx bx-calendar-check icon'></i>
                    </div>
                    <span class="progress" data-value="${confirmedPercentage}%"></span>
                    <span class="label">${confirmedPercentage}%</span>
                </div>
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>${pendingOrders}</h2>
                            <p>Pending Orders</p>
                        </div>
                        <i class='bx bx-time icon'></i>
                    </div>
                    <span class="progress" data-value="${pendingPercentage}%"></span>
                    <span class="label">${pendingPercentage}%</span>
                </div>
            </div>
            
            <div class="info-data">
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>Rs. ${totalRevenue}0</h2>
                            <p>Total Revenue</p>
                        </div>
                        <i class='bx bx-money icon'></i>
                    </div>
                    <span class="progress" data-value="100%"></span>
                    <span class="label">Income</span>
                </div>
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>${totalDrivers}</h2>
                            <p>Total Drivers</p>
                        </div>
                        <i class='bx bx-user icon'></i>
                    </div>
                    <span class="progress" data-value="100%"></span>
                    <span class="label">Active Drivers</span>
                </div>
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>${totalVehicles}</h2>
                            <p>Total Vehicles</p>
                        </div>
                        <i class='bx bx-car icon'></i>
                    </div>
                    <span class="progress" data-value="100%"></span>
                    <span class="label">Fleet Size</span>
                </div>
                <div class="card">
                    <div class="head">
                        <div>
                            <h2>${customerList.size()}</h2>
                            <p>Total Customers</p>
                        </div>
                        <i class='bx bx-group icon'></i>
                    </div>
                    <span class="progress" data-value="100%"></span>
                    <span class="label">Registered Users</span>
                </div>
            </div>
            
            <div class="data">
                <div class="content-data">
                    <div class="head">
                        <h3>Vehicle Fleet Summary</h3>
                        <div class="menu">
                            <i class='bx bx-dots-horizontal-rounded icon'></i>
                            <ul class="menu-link">
                                <li><a href="#">View All</a></li>
                                <li><a href="#">Refresh</a></li>
                            </ul>
                        </div>
                    </div>
                    <div id="vehicle-chart"></div>
                    <div class="stats-summary">
                        <p><strong>Cars:</strong> ${carCount}</p>
                        <p><strong>Vans:</strong> ${vanCount}</p>
                        <p><strong>Jeeps:</strong> ${jeepCount}</p>
                        <p><strong>Tuk Tuks:</strong> ${tukTukCount}</p>
                    </div>
                </div>
                
                <div class="content-data">
                    <div class="head">
                        <h3>Booking Performance</h3>
                        <div class="menu">
                            <i class='bx bx-dots-horizontal-rounded icon'></i>
                            <ul class="menu-link">
                                <li><a href="#">View Details</a></li>
                                <li><a href="#">Print Report</a></li>
                            </ul>
                        </div>
                    </div>
                    <div id="booking-chart"></div>
                    <div class="stats-summary">
                        <p><strong>Completion Rate:</strong> ${completedPercentage}%</p>
                        <p><strong>Average Fare:</strong> Rs. ${completedOrders > 0 ? totalRevenue / completedOrders : 0}0</p>
                        <p><strong>Pending Tasks:</strong> ${pendingOrders} bookings</p>
                    </div>
                </div>
            </div>
            
            <!-- BOOKINGS TABLE -->
            <div class="data">
                <div class="content-data">
                    <div class="head">
                        <h3>Booking Management</h3>
                        <div class="menu">
                            <i class='bx bx-dots-horizontal-rounded icon'></i>
                            <ul class="menu-link">
                                <li><a href="#">View All</a></li>
                                <li><a href="#">Export</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th>Customer ID</th>
                                    <th>Booking ID</th>
                                    <th>Customer Name</th>
                                    <th>Vehicle Type</th>
                                    <th>Vehicle Number</th>
                                    <th>Total Bill</th>
                                    <th>Booking Status</th>
                                    <th>Payment Status</th>
                              
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="booking" items="${bookingList}">
                                    <tr>
                                        <td>${booking.customerId}</td>
                                        <td>${booking.id}</td>
                                        <td>${booking.name}</td>
                                        <td>${booking.vehicleType}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${booking.carId != 0}">
                                                    ${booking.vehicleNumber}
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">Not Assigned</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>Rs. ${booking.totalBill}0</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${booking.tripStatus == 3}">
                                                    <span class="badge bg-primary">Complete</span>
                                                </c:when>
                                                <c:when test="${booking.bookingStatus == 0}">
                                                    <span class="badge bg-warning">Pending</span>
                                                </c:when>
                                                <c:when test="${booking.bookingStatus == 1}">
                                                    <span class="badge bg-success">Confirmed</span>
                                                </c:when>
                                                <c:when test="${booking.bookingStatus == 3}">
                                                    <span class="badge bg-danger">Cancelled</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-secondary">${booking.bookingStatus}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${booking.paymentStatus == 0}">
                                                    <span class="badge bg-warning">Pending</span>
                                                </c:when>
                                                <c:when test="${booking.paymentStatus == 1}">
                                                    <span class="badge bg-success">Paid</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        
                                    </tr>
                                    
                                    <!-- Assign Car Modal -->
                                    <div class="modal fade" id="assignCarModal${booking.id}" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Assign Vehicle to Booking #${booking.id}</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="${pageContext.request.contextPath}/booking" method="post">
                                                        <input type="hidden" name="action" value="assignCar">
                                                        <input type="hidden" name="bookingId" value="${booking.id}">
                                                        
                                                        <div class="mb-3">
                                                            <label class="form-label">Vehicle Type: ${booking.vehicleType}</label>
                                                        </div>
                                                        
                                                        <div class="mb-3">
                                                            <label for="carId" class="form-label">Select Vehicle</label>
                                                            <select class="form-select" name="carId" required>
                                                                <option value="">-- Select Vehicle --</option>
                                                                <c:forEach var="vehicle" items="${vehicleList}">
                                                                    <c:if test="${vehicle.vehicleType eq booking.vehicleType}">
                                                                        <option value="${vehicle.id}">${vehicle.vehicleNumber} - ${vehicle.brand}</option>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        
                                                        <div class="text-end">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                            <button type="submit" class="btn btn-primary">Assign Vehicle</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        
        </main>
        <!-- MAIN -->
    </section>
    <!-- NAVBAR -->
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script>
        // Initialize charts
        document.addEventListener("DOMContentLoaded", function() {
            // Set progress bars
            const allProgress = document.querySelectorAll('.progress');
            allProgress.forEach(item => {
                item.style.setProperty('--value', item.dataset.value)
            });
            
            // Vehicle fleet chart
            var vehicleOptions = {
                series: [${carCount}, ${vanCount}, ${jeepCount}, ${tukTukCount}],
                chart: {
                    type: 'donut',
                    height: 250
                },
                labels: ['Cars', 'Vans', 'Jeeps', 'Tuk Tuks'],
                colors: ['#4CAF50', '#2196F3', '#FF9800', '#9C27B0'],
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                            width: 200
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            };
            
            var vehicleChart = new ApexCharts(document.querySelector("#vehicle-chart"), vehicleOptions);
            vehicleChart.render();
            
            // Booking status chart
            var bookingOptions = {
                series: [{
                    name: 'Bookings',
                    data: [${completedOrders}, ${confirmedOrders}, ${pendingOrders}]
                }],
                chart: {
                    type: 'bar',
                    height: 250,
                    toolbar: {
                        show: false
                    }
                },
                plotOptions: {
                    bar: {
                        borderRadius: 4,
                        horizontal: true,
                    }
                },
                dataLabels: {
                    enabled: true
                },
                xaxis: {
                    categories: ['Completed', 'Confirmed', 'Pending'],
                },
                colors: ['#4CAF50', '#2196F3', '#FF9800']
            };
            
            var bookingChart = new ApexCharts(document.querySelector("#booking-chart"), bookingOptions);
            bookingChart.render();
        });
    </script>
    <script src="script.js"></script>
</body>

</html>