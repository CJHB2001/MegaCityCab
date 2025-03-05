<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.User" %>
<%@ page import="com.res.dao.UserDAO" %>
<%@ page import="com.res.model.Vehicle" %>
<%@ page import="com.res.dao.VehicleDAO" %>
<%
UserDAO userDAO = new UserDAO();
List<User> driverList = userDAO.getAllDrivers();
request.setAttribute("driverList", driverList);

VehicleDAO vehicleDAO = new VehicleDAO();
List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();
request.setAttribute("vehicleList", vehicleList);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

   
       <title>Mega City Cab - Vehicle Management</title>

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
                        <table class="table ">
                        
                            <thead class="table-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Vehicle Type</th>
                                    <th>Engine Number</th>
                                    <th>Vehicle Number</th>
                                    <th>Brand</th>
                                    <th>Driver Name</th>
                                    <th>Fuel Type</th>
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
                                        <td>${vehicle.driverName}</td>
                                        <td>${vehicle.vehicleFuelType}</td>
                                        <td>${vehicle.doors}</td>
                                        <td>${vehicle.capacity}</td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editVehicleModal${vehicle.id}">
                                                <i class='bx bx-edit'></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteVehicleModal${vehicle.id}">
                                                <i class='bx bx-trash'></i>
                                            </button>
                                        </td>
                                    </tr>

                                    <!-- Edit Modal -->
                                    <div class="modal fade" id="editVehicleModal${vehicle.id}" tabindex="-1" aria-labelledby="editVehicleModalLabel${vehicle.id}" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editVehicleModalLabel${vehicle.id}">Edit Vehicle</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="${pageContext.request.contextPath}/vehicle" method="post" enctype="multipart/form-data">
                                                    <input type="hidden" name="action" value="update">
                                                    <input type="hidden" name="id" value="${vehicle.id}">
                                                    <div class="modal-body">
                                                        <div class="row mb-3">
                                                            <label for="vehicleType" class="col-sm-3 col-form-label">Vehicle Type:</label>
                                                            <div class="col-sm-9">
                                                                <select class="form-select" id="vehicleType" name="vehicleType" required>
                                                                    <option value="">Select Vehicle Type</option>
                                                                    <option value="Car" ${vehicle.vehicleType == 'Car' ? 'selected' : ''}>Car</option>
                                                                    <option value="Van" ${vehicle.vehicleType == 'Van' ? 'selected' : ''}>Van</option>
                                                                    <option value="Lorry" ${vehicle.vehicleType == 'Lorry' ? 'selected' : ''}>Lorry</option>
                                                                    <option value="Tuk Tuk" ${vehicle.vehicleType == 'Tuk Tuk' ? 'selected' : ''}>Tuk Tuk</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <label for="engineNumber" class="col-sm-3 col-form-label">Engine Number:</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="engineNumber" name="engineNumber" value="${vehicle.engineNumber}" required>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <label for="vehicleNumber" class="col-sm-3 col-form-label">Vehicle Number:</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="vehicleNumber" name="vehicleNumber" value="${vehicle.vehicleNumber}" required>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <label for="brand" class="col-sm-3 col-form-label">Brand:</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="brand" name="brand" value="${vehicle.brand}" required>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <label for="color" class="col-sm-3 col-form-label">Vehicle Color:</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control" id="color" name="color" value="${vehicle.color}" required>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <label for="vehicleFuelType" class="col-sm-3 col-form-label">Vehicle Fuel Type:</label>
                                                            <div class="col-sm-9">
                                                                <select class="form-select" id="vehicleFuelType" name="vehicleFuelType" required>
                                                                    <option value="">Select Fuel Type</option>
                                                                    <option value="Petrol" ${vehicle.vehicleFuelType == 'Petrol' ? 'selected' : ''}>Petrol</option>
                                                                    <option value="Diesel" ${vehicle.vehicleFuelType == 'Diesel' ? 'selected' : ''}>Diesel</option>
                                                                    <option value="Hybrid" ${vehicle.vehicleFuelType == 'Hybrid' ? 'selected' : ''}>Hybrid</option>
                                                                    <option value="Electric" ${vehicle.vehicleFuelType == 'Electric' ? 'selected' : ''}>Electric</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <label for="doors" class="col-sm-3 col-form-label">Doors:</label>
                                                            <div class="col-sm-9">
                                                                <input type="number" class="form-control" id="doors" name="doors" value="${vehicle.doors}" min="1" required>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <label for="capacity" class="col-sm-3 col-form-label">Passenger Capacity:</label>
                                                            <div class="col-sm-9">
                                                                <input type="number" class="form-control" id="capacity" name="capacity" value="${vehicle.capacity}" min="1" required>
                                                            </div>
                                                        </div>
                                                        <div class="row mb-3">
                                                            <label for="driverName" class="col-sm-3 col-form-label">Driver Name:</label>
                                                            <div class="col-sm-9">
                                                                <select class="form-select" id="driverName" name="driverName" required>
                                                                    <option value="">Select Driver</option>
                                                                    <c:forEach var="driver" items="${driverList}">
                                                                        <option value="${driver.id}" ${vehicle.driverId == driver.id ? 'selected' : ''}>${driver.name}</option>
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
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Update</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Delete Modal -->
                                    <div class="modal fade" id="deleteVehicleModal${vehicle.id}" tabindex="-1" aria-labelledby="deleteVehicleModalLabel${vehicle.id}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="deleteVehicleModalLabel${vehicle.id}">Delete Vehicle</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="d-flex justify-content-center mb-1">
                                                        <img src="./assets/images/bin.gif" alt="" class="" width="80">
                                                    </div>
                                                    <h6 class="text-center fw-bold">You are about to delete a vehicle</h6>
                                                    <p class="text-secondary text-center">This action will permanently delete the vehicle. <span class="text-dark">Are you sure?</span></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <a href="${pageContext.request.contextPath}/vehicle?action=delete&id=${vehicle.id}" class="btn btn-danger">Delete</a>
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
                    <form action="${pageContext.request.contextPath}/vehicle" method="POST" enctype="multipart/form-data">
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
                            <label for="color" class="col-sm-3 col-form-label">Vehicle Color:</label>
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