<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Booking" %>
<%@ page import="com.res.dao.BookingDAO" %>
<%@ page import="com.res.model.Vehicle" %>
<%@ page import="com.res.dao.VehicleDAO" %>

<%
BookingDAO bookingDAO = new BookingDAO();
List<Booking> bookingList = bookingDAO.getAllBookings();
request.setAttribute("bookingList", bookingList);

VehicleDAO vehicleDAO = new VehicleDAO();
List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();
request.setAttribute("vehicleList", vehicleList);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Management</title>

</head>
<body>
    <jsp:include page="./toastr-config.jsp" />
    <jsp:include page="./sideBar.jsp" />

    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main class="p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h3">Booking Management</h1>
            
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
<table class="table">
    <thead class="table-dark">
    <tr>
        <th>Customer ID</th>
        <th>Customer Name</th>
        <th>Vehicle Type</th>
        <th>Vehicle Number</th>
        <th>Total Bill</th>
        <th>Booking Status</th>
                 <th>Payment Status</th>
        <th>Change Status</th>
        <th>Assign Car</th>
        <th>Actions</th>
    </tr>
</thead>
<tbody>
    <c:forEach var="booking" items="${bookingList}">
        <tr>
            <td>${booking.customerId}</td>
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
            <td>Rs. ${booking.totalBill}</td>
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
            <td>
			    <form action="${pageContext.request.contextPath}/booking" method="post" class="d-flex justify-content-center">
			        <input type="hidden" name="action" value="updateStatus">
			        <input type="hidden" name="id" value="${booking.id}">
			        <select name="bookingStatus" class="form-select form-select-sm me-2" id="bookingStatus${booking.id}"
			            <c:if test="${booking.tripStatus == 3}">disabled</c:if> >
			            <option value="0" ${booking.bookingStatus == 0 ? 'selected' : ''}>Pending</option>
			            <option value="1" ${booking.bookingStatus == 1 ? 'selected' : ''} 
			                <c:if test="${booking.carId == 0}">disabled</c:if>>Confirmed</option>
			            <option value="3" ${booking.bookingStatus == 3 ? 'selected' : ''}>Cancelled</option>
			        </select>
			        <button type="submit" class="btn btn-sm btn-primary"
			            <c:if test="${booking.tripStatus == 3}">disabled</c:if> >
			            <i class="bx bx-refresh"></i>
			        </button>
			    </form>
			</td>
                        <td>
                <c:choose>
                    <c:when test="${booking.carId == 0}">
                        <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#assignCarModal${booking.id}" 
                                <c:if test="${booking.bookingStatus == 3}">disabled</c:if>>
                            <i class='bx bx-car'></i> Assign Car
                        </button>
                    </c:when>
                    <c:otherwise>
                        <span class="text-success">Car Assigned</span>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editBookingModal${booking.id}">
                    <i class='bx bx-detail'></i> 
                </button>
                <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteBookingModal${booking.id}">
                    <i class='bx bx-trash'></i> 
                </button>
            </td>
        </tr>
                                    <!-- Edit Modal -->
                      <div class="modal fade" id="editBookingModal${booking.id}" tabindex="-1" aria-labelledby="editBookingModalLabel${booking.id}" aria-hidden="true">
                        <div class="modal-dialog modal-lg"> 
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editBookingModalLabel${booking.id}">Booking Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Customer ID</label>
                        <input type="text" class="form-control" value="${booking.customerId}" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" value="${booking.name}" readonly>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <label class="form-label">Phone Number</label>
                        <input type="text" class="form-control" value="${booking.phoneNumber}" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Pick Up Point</label>
                        <input type="text" class="form-control" value="${booking.pickUpPoint}" readonly>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <label class="form-label">Drop Off Point</label>
                        <input type="text" class="form-control" value="${booking.dropOffPoint}" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Passengers</label>
                        <input type="number" class="form-control" value="${booking.passengers}" readonly>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <label class="form-label">Vehicle Type</label>
                        <input type="text" class="form-control" value="${booking.vehicleType}" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Distance (KM)</label>
                        <input type="number" class="form-control" value="${booking.distanceKm}" readonly>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <label class="form-label">Total Bill</label>
                        <input type="number" class="form-control" value="${booking.totalBill}" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Ride Date</label>
                        <input type="date" class="form-control" value="${booking.rideDate}" readonly>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-md-6">
                        <label class="form-label">Ride Time</label>
                        <input type="time" class="form-control" value="${booking.rideTime}" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Booking Status</label>
                        <input type="number" class="form-control" value="${booking.bookingStatus}" readonly>
                    </div>
                </div>

                  <div class="row mt-3">
                    <div class="col-md-6">
                        <label class="form-label">Car Number</label>
                        <input type="text" class="form-control" value="${booking.vehicleNumber}" readonly>
                    </div>
                </div>

                <div class="mt-3">
                    <label class="form-label">Message</label>
                    <textarea class="form-control" readonly>${booking.message}</textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

                      <div class="modal fade" id="assignCarModal${booking.id}" tabindex="-1" aria-labelledby="assignCarModalLabel${booking.id}" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="assignCarModalLabel${booking.id}">Assign Car to Booking #${booking.id}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="${pageContext.request.contextPath}/booking" method="post">
                    <input type="hidden" name="action" value="assignCar">
                    <input type="hidden" name="id" value="${booking.id}">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="carId" class="form-label">Select Car</label>
                            <select class="form-select" id="carId" name="carId" required>
                                <option value="">Select a Car</option>
                                <c:forEach var="vehicle" items="${vehicleList}">
                                    <option value="${vehicle.id}">${vehicle.vehicleNumber} (${vehicle.vehicleType})</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Assign Car</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

       
                      
                               

                                    <!-- Delete Modal -->
                                    <div class="modal fade" id="deleteBookingModal${booking.id}" tabindex="-1" aria-labelledby="deleteBookingModalLabel${booking.id}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="deleteBookingModalLabel${booking.id}">Delete Booking</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="d-flex justify-content-center mb-1">
                                                        <img src="./assets/images/bin.gif" alt="" class="" width="80">
                                                    </div>
                                                    <h6 class="text-center fw-bold">You are about to delete a booking</h6>
                                                    <p class="text-secondary text-center">This action will permanently delete the booking. <span class="text-dark">Are you sure?</span></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <a href="${pageContext.request.contextPath}/booking?action=delete&id=${booking.id}" class="btn btn-danger">Delete</a>
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

    <!-- Add Booking Modal -->
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</body>
</html>