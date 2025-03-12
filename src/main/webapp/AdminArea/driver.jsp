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
    <link rel="icon" type="image/x-icon" href="./assets/images/LogoAdmin.png">
            <title>Mega City Cab - Admin Driver Management</title>
</head>
<body>
<c:if test="${empty sessionScope.user || sessionScope.user.role != 'ADMIN'}">
    <c:redirect url="/AdminArea/login.jsp" />
</c:if>
	
    <jsp:include page="./toastr-config.jsp" />


    <jsp:include page="./sideBar.jsp" />

    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main class="p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h3">Driver Management</h1>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDriverModal">
                    <i class='bx bx-plus'></i> Add Driver
                </button>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Age</th>
                                    <th>Experience (Years)</th>
                                    <th>License ID</th>
                                  
                                    <th>Photo</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="driver" items="${driverList}">
                                    <tr>
                                        <td>${driver.id}</td>
                                        <td>${driver.name}</td>
                                        <td>${driver.email}</td>
                                        <td>${driver.age}</td>
                                        <td>${driver.experience}</td>
                                        <td>${driver.licenseId}</td>
                             
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty driver.profilePhoto}">
                                                    <img src="${pageContext.request.contextPath}/${driver.profilePhoto}" alt="Driver Photo" width="50" height="50" class="rounded-circle">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}/assets/images/default_avatar.png" alt="Default Photo" width="50" height="50" class="rounded-circle">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editDriverModal${driver.id}">
                                                <i class='bx bx-edit'></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteDriverModal${driver.id}">
                                                <i class='bx bx-trash'></i>
                                            </button>
                                        </td>
                                    </tr>
                                         <div class="modal fade" id="editDriverModal${driver.id}" tabindex="-1" aria-labelledby="editDriverModalLabel${driver.id}" aria-hidden="true">
                                                             <div class="modal-dialog modal-lg"> 
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editDriverModalLabel${driver.id}">Edit Driver</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="${pageContext.request.contextPath}/driver" method="post" enctype="multipart/form-data">
                                                    <input type="hidden" name="action" value="update">
                                                    <input type="hidden" name="id" value="${driver.id}">
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label for="name" class="form-label">Name</label>
                                                            <input type="text" class="form-control" id="name" name="name" value="${driver.name}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="email" class="form-label">Email</label>
                                                            <input type="email" class="form-control" id="email" name="email" value="${driver.email}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="password" class="form-label">Password (Leave blank to keep current)</label>
                                                            <input type="password" class="form-control" id="password" name="password">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="age" class="form-label">Age</label>
                                                            <input type="number" class="form-control" id="age" name="age" value="${driver.age}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="experience" class="form-label">Experience (Years)</label>
                                                            <input type="number" class="form-control" id="experience" name="experience" value="${driver.experience}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="licenseId" class="form-label">License ID</label>
                                                            <input type="text" class="form-control" id="licenseId" name="licenseId" value="${driver.licenseId}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Gender</label>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio" name="gender" id="maleGender${driver.id}" value="male" ${driver.gender == 'male' ? 'checked' : ''}>
                                                                <label class="form-check-label" for="maleGender${driver.id}">Male</label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio" name="gender" id="femaleGender${driver.id}" value="female" ${driver.gender == 'female' ? 'checked' : ''}>
                                                                <label class="form-check-label" for="femaleGender${driver.id}">Female</label>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="newProfilePhoto" class="form-label">Profile Photo</label>
                                                            <input type="file" class="form-control" id="newProfilePhoto" name="newProfilePhoto">
                                                           
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
                                    <div class="modal fade" id="deleteDriverModal${driver.id}" tabindex="-1" aria-labelledby="deleteDriverModalLabel${driver.id}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="deleteDriverModalLabel${driver.id}">Delete Driver</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="d-flex justify-content-center mb-1">
                                                        <img src="./assets/images/bin.gif" alt="" class="" width="80">
                                                    </div>
                                                    <h6 class="text-center fw-bold">You are about to delete a driver</h6>
                                                    <p class="text-secondary text-center">This action will permanently delete the driver account. <span class="text-dark">Are you sure?</span></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <a href="${pageContext.request.contextPath}/driver?action=delete&id=${driver.id}" class="btn btn-danger">Delete</a>
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

    <div class="modal fade" id="addDriverModal" tabindex="-1" aria-labelledby="addDriverModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg"> 
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addDriverModalLabel">Add New Driver</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="${pageContext.request.contextPath}/driver" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="add">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="addName" class="form-label">Name</label>
                            <input type="text" class="form-control" id="addName" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="addEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="addEmail" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="addPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="addPassword" name="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="addAge" class="form-label">Age</label>
                            <input type="number" class="form-control" id="addAge" name="age" required>
                        </div>
                        <div class="mb-3">
                            <label for="addExperience" class="form-label">Experience (Years)</label>
                            <input type="number" class="form-control" id="addExperience" name="experience" required>
                        </div>
                        <div class="mb-3">
                            <label for="addLicenseId" class="form-label">License ID</label>
                            <input type="text" class="form-control" id="addLicenseId" name="licenseId" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Gender</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="addMale" value="male" checked>
                                <label class="form-check-label" for="addMale">Male</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="addFemale" value="female">
                                <label class="form-check-label" for="addFemale">Female</label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="addProfilePhoto" class="form-label">Profile Photo</label>
                            <input type="file" class="form-control" id="addProfilePhoto" name="profilePhoto">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Add Driver</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- JavaScript Dependencies -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</body>
</html>
