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
                    
 <table class="table ">
    <thead class="table-dark">
        <tr>
   
            <th>Customer ID</th>
            <th>Name</th>
            <th>Phone Number</th>
            <th>Vehicle Type</th>
            <th>Total Bill</th>
            <th>Booking Status</th>
                   <th>Change Status</th>
                   
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="booking" items="${bookingList}">
            <tr>
       
                <td>${booking.customerId}</td>
                <td>${booking.name}</td>
                <td>${booking.phoneNumber}</td>
                <td>${booking.vehicleType}</td>
                <td>Rs. ${booking.totalBill}</td>
                <td>
                    <c:choose>
                        <c:when test="${booking.bookingStatus == 0}">
                            <span class="badge bg-warning ">Pending</span>
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
                    <form action="${pageContext.request.contextPath}/booking" method="post" class="d-flex justify-content-center">
                        <input type="hidden" name="action" value="updateStatus">
                        <input type="hidden" name="id" value="${booking.id}">
                        <select name="bookingStatus" class="form-select form-select-sm me-2" id="bookingStatus${booking.id}">
                            <option value="0" ${booking.bookingStatus == 0 ? 'selected' : ''}>Pending</option>
                            <option value="1" ${booking.bookingStatus == 1 ? 'selected' : ''}>Confirmed</option>
                            <option value="3" ${booking.bookingStatus == 3 ? 'selected' : ''}>Cancelled</option>
                        </select>
                        <button type="submit" class="btn btn-sm btn-primary">
                            <i class="bx bx-refresh"></i> 
                        </button>
                    </form>
                </td>
                             <td>
                                            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editBookingModal${booking.id}">
                                         <i class='bx bx-detail'></i>  <!-- Represents more details -->
                                         
                                          
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
                        <label class="form-label">Car ID</label>
                        <input type="number" class="form-control" value="${booking.carId}" readonly>
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
    <script>
    function updateBookingStatus(bookingId, status) {
        fetch(`${pageContext.request.contextPath}/booking?action=updateStatus&id=${bookingId}&status=${status}`, {
            method: 'POST'
        })
        .then(response => {
            if (response.ok) {
                location.reload(); // Reload the page to reflect the updated status
            } else {
                alert('Failed to update booking status.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
</script>
</body>
</html>