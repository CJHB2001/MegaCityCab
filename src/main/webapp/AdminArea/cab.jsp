<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.User" %>
<%@ page import="com.res.dao.UserDAO" %>

<%
UserDAO userDAO = new UserDAO();
List<User> driverList = userDAO.getAllDrivers();
request.setAttribute("driverList", driverList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
</head>
<body>

    <!-- Session Check -->
    <c:if test="${empty sessionScope.user}">
        <c:redirect url="/AdminArea/login.jsp" />
    </c:if>

    <jsp:include page="./toastr-config.jsp" />
    <jsp:include page="./sideBar.jsp" />

    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main class="p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h3">Vehicle Management</h1>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addVehicleModal">
                    <i class='bx bx-plus'></i> Add Vehicle
                </button>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="table-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Vehicle Type</th>
                                    <th>Engine Number</th>
                                    <th>Vehicle Number</th>
                                    <th>Brand</th>
                                    <th>Doors</th>
                                    <th>Capacity</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="vehicle" items="${vehicleList}" varStatus="loop">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${vehicle.vehicleType}</td>
                                        <td>${vehicle.engineNumber}</td>
                                        <td>${vehicle.vehicleNumber}</td>
                                        <td>${vehicle.brand}</td>
                                        <td>${vehicle.doors}</td>
                                        <td>${vehicle.capacity}</td>
                                        <td>
                                            <button class="btn btn-warning btn-sm">Edit</button>
                                            <button class="btn btn-danger btn-sm">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </section>

    <!-- Add Vehicle Modal -->
    <div class="modal fade" id="addVehicleModal" tabindex="-1" aria-labelledby="addVehicleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addVehicleModalLabel">Add New Vehicle</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="AddVehicleServlet" method="POST" enctype="multipart/form-data">
                        <div class="row mb-3">
                            <label for="vehicleType" class="col-sm-3 col-form-label">Vehicle Type:</label>
                            <div class="col-sm-9">
                                <select class="form-select" id="vehicleType" name="vehicleType" required>
                                    <option value="">Select Vehicle Type</option>
                                    <option value="Car">Car</option>
                                    <option value="Van">Van</option>
                                    <option value="Lorry">Lorry</option>
                                    <option value="Tuk Tuk">Tuk Tuk</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="engineNumber" class="col-sm-3 col-form-label">Engine Number:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="engineNumber" name="engineNumber" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="vehicleNumber" class="col-sm-3 col-form-label">Vehicle Number:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="vehicleNumber" name="vehicleNumber" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="brand" class="col-sm-3 col-form-label">Brand:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="brand" name="brand" required>
                            </div>
                        </div>
                         <div class="row mb-3">
                            <label for="brand" class="col-sm-3 col-form-label">Vehicle color</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="color" name="color" required>
                            </div>
                        </div>
                        
                           <div class="row mb-3">
    <label for="vehicleFuelType" class="col-sm-3 col-form-label">Vehicle Fuel Type:</label>
    <div class="col-sm-9">
        <select class="form-select" id="vehicleFuelType" name="vehicleFuelType" required>
            <option value="">Select Fuel Type</option>
            <option value="Petrol">Petrol</option>
            <option value="Diesel">Diesel</option>
            <option value="Hybrid">Hybrid</option>
            <option value="Electric">Electric</option>
        </select>
    </div>
</div>
                           
                        <div class="row mb-3">
                            <label for="doors" class="col-sm-3 col-form-label">Doors:</label>
                            <div class="col-sm-9">
                                <input type="number" class="form-control" id="doors" name="doors" min="1" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="capacity" class="col-sm-3 col-form-label">Passenger Capacity:</label>
                            <div class="col-sm-9">
                                <input type="number" class="form-control" id="capacity" name="capacity" min="1" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="driverName" class="col-sm-3 col-form-label">Driver Name:</label>
                            <div class="col-sm-9">
                                <select class="form-select" id="driverName" name="driverName" required>
                                    <option value="">Select Driver</option>
                                    <c:forEach var="driver" items="${driverList}">
                                        <option value="${driver.id}">${driver.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="profilePhoto" class="col-sm-3 col-form-label">Vehicle Image:</label>
                            <div class="col-sm-9">
                                <input type="file" class="form-control" id="profilePhoto" name="profilePhoto">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Add Vehicle</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript Dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</body>
</html>