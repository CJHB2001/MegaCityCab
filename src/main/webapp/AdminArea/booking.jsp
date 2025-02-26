<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Booking" %>
<%@ page import="com.res.dao.BookingDAO" %>

<%
BookingDAO bookingDAO = new BookingDAO();
List<Booking> bookingList = bookingDAO.getAllBookings();
request.setAttribute("bookingList", bookingList);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Management</title>
</head>
<body>
 <c:if test="${not empty alertMessage}">
        <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
            ${alertMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <jsp:include page="./toastr-config.jsp" />


    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main class="p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h3">Booking Management</h1>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBookingModal">
                    <i class='bx bx-plus'></i> Add Booking
                </button>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Customer ID</th>
                                    <th>Name</th>
                                    <th>Phone Number</th>
                                    <th>Pick Up Point</th>
                                    <th>Drop Off Point</th>
                                    <th>Passengers</th>
                                    <th>Vehicle Type</th>
                                    <th>Distance (KM)</th>
                                    <th>Total Bill</th>
                                    <th>Ride Date</th>
                                    <th>Ride Time</th>
                                    <th>Booking Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="booking" items="${bookingList}">
                                    <tr>
                                        <td>${booking.id}</td>
                                        <td>${booking.customerId}</td>
                                        <td>${booking.name}</td>
                                        <td>${booking.phoneNumber}</td>
                                        <td>${booking.pickUpPoint}</td>
                                        <td>${booking.dropOffPoint}</td>
                                        <td>${booking.passengers}</td>
                                        <td>${booking.vehicleType}</td>
                                        <td>${booking.distanceKm}</td>
                                        <td>${booking.totalBill}</td>
                                        <td>${booking.rideDate}</td>
                                        <td>${booking.rideTime}</td>
                                        <td>${booking.bookingStatus}</td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editBookingModal${booking.id}">
                                                <i class='bx bx-edit'></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteBookingModal${booking.id}">
                                                <i class='bx bx-trash'></i>
                                            </button>
                                        </td>
                                    </tr>

                                    <!-- Edit Modal -->
                                    <div class="modal fade" id="editBookingModal${booking.id}" tabindex="-1" aria-labelledby="editBookingModalLabel${booking.id}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editBookingModalLabel${booking.id}">Edit Booking</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="${pageContext.request.contextPath}/booking" method="post" enctype="multipart/form-data">
                                                    <input type="hidden" name="action" value="update">
                                                    <input type="hidden" name="id" value="${booking.id}">
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label for="customer_id" class="form-label">Customer ID</label>
                                                            <input type="text" class="form-control" id="customer_id" name="customer_id" value="${booking.customerId}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="name" class="form-label">Name</label>
                                                            <input type="text" class="form-control" id="name" name="name" value="${booking.name}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="phone_number" class="form-label">Phone Number</label>
                                                            <input type="text" class="form-control" id="phone_number" name="phone_number" value="${booking.phoneNumber}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="pick_up_point" class="form-label">Pick Up Point</label>
                                                            <input type="text" class="form-control" id="pick_up_point" name="pick_up_point" value="${booking.pickUpPoint}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="drop_off_point" class="form-label">Drop Off Point</label>
                                                            <input type="text" class="form-control" id="drop_off_point" name="drop_off_point" value="${booking.dropOffPoint}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="passengers" class="form-label">Passengers</label>
                                                            <input type="number" class="form-control" id="passengers" name="passengers" value="${booking.passengers}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="vehicle_type" class="form-label">Vehicle Type</label>
                                                            <input type="text" class="form-control" id="vehicle_type" name="vehicle_type" value="${booking.vehicleType}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="distance_km" class="form-label">Distance (KM)</label>
                                                            <input type="number" class="form-control" id="distance_km" name="distance_km" value="${booking.distanceKm}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="total_bill" class="form-label">Total Bill</label>
                                                            <input type="number" class="form-control" id="total_bill" name="total_bill" value="${booking.totalBill}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="ride_date" class="form-label">Ride Date</label>
                                                            <input type="date" class="form-control" id="ride_date" name="ride_date" value="${booking.rideDate}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="ride_time" class="form-label">Ride Time</label>
                                                            <input type="time" class="form-control" id="ride_time" name="ride_time" value="${booking.rideTime}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="message" class="form-label">Message</label>
                                                            <textarea class="form-control" id="message" name="message">${booking.message}</textarea>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="booking_status" class="form-label">Booking Status</label>
                                                            <input type="number" class="form-control" id="booking_status" name="booking_status" value="${booking.bookingStatus}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="car_id" class="form-label">Car ID</label>
                                                            <input type="number" class="form-control" id="car_id" name="car_id" value="${booking.carId}" required>
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
    <div class="modal fade" id="addBookingModal" tabindex="-1" aria-labelledby="addBookingModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addBookingModalLabel">Add New Booking</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="${pageContext.request.contextPath}/booking" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="customer_id" class="form-label">Customer ID</label>
                            <input type="text" class="form-control" id="customer_id" name="customer_id" required>
                        </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone_number" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" id="phone_number" name="phone_number" required>
                        </div>
                        <div class="mb-3">
                            <label for="pick_up_point" class="form-label">Pick Up Point</label>
                            <input type="text" class="form-control" id="pick_up_point" name="pick_up_point" required>
                        </div>
                        <div class="mb-3">
                            <label for="drop_off_point" class="form-label">Drop Off Point</label>
                            <input type="text" class="form-control" id="drop_off_point" name="drop_off_point" required>
                        </div>
                        <div class="mb-3">
                            <label for="passengers" class="form-label">Passengers</label>
                            <input type="number" class="form-control" id="passengers" name="passengers" required>
                        </div>
                        <div class="mb-3">
                            <label for="vehicle_type" class="form-label">Vehicle Type</label>
                            <input type="text" class="form-control" id="vehicle_type" name="vehicle_type" required>
                        </div>
                        <div class="mb-3">
                            <label for="distance_km" class="form-label">Distance (KM)</label>
                            <input type="number" class="form-control" id="distance_km" name="distance_km" required>
                        </div>
                        <div class="mb-3">
                            <label for="total_bill" class="form-label">Total Bill</label>
                            <input type="number" class="form-control" id="total_bill" name="total_bill" required>
                        </div>
                        <div class="mb-3">
                            <label for="ride_date" class="form-label">Ride Date</label>
                            <input type="date" class="form-control" id="ride_date" name="ride_date" required>
                        </div>
                        <div class="mb-3">
                            <label for="ride_time" class="form-label">Ride Time</label>
                            <input type="time" class="form-control" id="ride_time" name="ride_time" required>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Message</label>
                            <textarea class="form-control" id="message" name="message"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="booking_status" class="form-label">Booking Status</label>
                            <input type="number" class="form-control" id="booking_status" name="booking_status" value="0" required>
                        </div>
                        <div class="mb-3">
                            <label for="car_id" class="form-label">Car ID</label>
                            <input type="number" class="form-control" id="car_id" name="car_id" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</body>
</html>