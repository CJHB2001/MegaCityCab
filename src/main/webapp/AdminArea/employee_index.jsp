<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Employee Management</title>
</head>
<body>
<jsp:include page="./sideBar.jsp" />
  <section id="content">
<jsp:include page="./navBar.jsp" />
<main class="p-4">
    <!-- Display Alert Messages -->
    <c:if test="${not empty alertMessage}">
        <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
            ${alertMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h3">Dashboard</h1>
        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDataModal">
            <i class='bx bx-plus'></i> Add Data
        </button>
    </div>
     <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                </ol>
            </nav>
          <div class="card">
    
         <div class="card-body">
                    <div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Status</th>
                <th>Image</th>
                <th>Actions</th>
                
                
                
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.role}</td>
                    <td>
                        <span class="badge ${user.status == 'Active' ? 'bg-success' : user.status == 'Inactive' ? 'bg-danger' : 'bg-warning'}">
                            ${user.status}
                        </span>
                    </td>
                    <td>
                        <img src="${pageContext.request.contextPath}/${user.profileImagePath}" alt="Profile Picture" width="50" height="50" class="rounded-circle">
                    </td>
                    <td>
                        <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editDataModal${user.id}">
                            <i class='bx bx-edit'></i>
                        </button>
                        <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteDataModal${user.id}">
                            <i class='bx bx-trash'></i>
                        </button>
                    </td>
                </tr>


<!-- Add Data Modal -->
<div class="modal fade" id="addDataModal" tabindex="-1" aria-labelledby="addDataModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addDataModalLabel">Add New Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="${pageContext.request.contextPath}/employee" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="age" class="form-label">Age</label>
                        <input type="number" class="form-control" id="age" name="age" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <select class="form-select" id="role" name="role" required>
                            <option value="Admin">Admin</option>
                            <option value="User">User</option>
                            <option value="Editor">Editor</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="status" class="form-label">Status</label>
                        <select class="form-select" id="status" name="status" required>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                            <option value="Pending">Pending</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="profileImage" class="form-label">Profile Picture</label>
                        <input type="file" class="form-control" id="profileImage" name="profileImage" accept="image/*" required>
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
                <!-- Edit Modal -->
                <div class="modal fade" id="editDataModal${user.id}" tabindex="-1" aria-labelledby="editDataModalLabel${user.id}" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editDataModalLabel${user.id}">Edit Employee</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="${pageContext.request.contextPath}/employee" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="id" value="${user.id}">
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label for="name" class="form-label">Name</label>
                                        <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="age" class="form-label">Age</label>
                                        <input type="number" class="form-control" id="age" name="age" value="${user.age}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="role" class="form-label">Role</label>
                                        <select class="form-select" id="role" name="role" required>
                                            <option value="Admin" ${user.role == 'Admin' ? 'selected' : ''}>Admin</option>
                                            <option value="User" ${user.role == 'User' ? 'selected' : ''}>User</option>
                                            <option value="Editor" ${user.role == 'Editor' ? 'selected' : ''}>Editor</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="status" class="form-label">Status</label>
                                        <select class="form-select" id="status" name="status" required>
                                            <option value="Active" ${user.status == 'Active' ? 'selected' : ''}>Active</option>
                                            <option value="Inactive" ${user.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                                            <option value="Pending" ${user.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="newProfileImage" class="form-label">Profile Picture</label>
                                        <input type="file" class="form-control" id="newProfileImage" name="newProfileImage">
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
                <div class="modal fade" id="deleteDataModal${user.id}" tabindex="-1" aria-labelledby="deleteDataModalLabel${user.id}" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deleteDataModalLabel${user.id}">Delete Employee</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body ">
                                                           <div class="d-flex justify-content-center mb-1">
                                    <img src="./assets/images/bin.gif" alt="" class="" width="80">
                                </div>
                            
                                  <h6 class="text-center fw-bold">You are about to delete a Reservation Type</h6>
                                <p class="text-secondary text-center">This action will permanently delete the Reservation Type. <span class="text-dark">Are you sure?</span></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <a href="${pageContext.request.contextPath}/employee?action=delete&id=${user.id}" class="btn btn-danger">Delete</a>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>