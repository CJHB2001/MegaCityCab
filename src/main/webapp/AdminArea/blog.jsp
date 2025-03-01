<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Blog " %>
<%@ page import="com.res.dao.BlogDAO" %>
<%
    // Fetch the employee list from the database
    BlogDAO blogeDAO = new BlogDAO();
    List<Blog> blogList = blogeDAO.getAllBlogs();
    request.setAttribute("blogList", blogList);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tiny.cloud/1/2k4jaruxjz8btnyxbloucip4rsqxpuuxs3y5ra1qyb7hv6cb/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    <title>Mega City Cab - Blog Management</title>
</head>
<body>
    <jsp:include page="./sideBar.jsp" />
    <section id="content">
        <jsp:include page="./navBar.jsp" />
        <main class="p-4">
            <!-- Display Alert Messages -->
  

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h3">Blog Management</h1>
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBlogModal">
                    <i class='bx bx-plus'></i> Add Blog
                </button>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Date</th>
                                    <th>Summary</th>
                                    <th>Image</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="blog" items="${blogList}">
                                    <tr>
                                        <td>${blog.id}</td>
                                        <td>${blog.title}</td>
                                        <td>${blog.date}</td>
                                        <td>${blog.summary}</td>
                                        <td>
                                            <img src="${pageContext.request.contextPath}/${blog.imagePath}" alt="Blog Image" width="50" height="50" class="rounded-circle">
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editBlogModal${blog.id}">
                                                <i class='bx bx-edit'></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteBlogModal${blog.id}">
                                                <i class='bx bx-trash'></i>
                                            </button>
                                        </td>
                                    </tr>

                                    <!-- Edit Modal -->
                                    <div class="modal fade" id="editBlogModal${blog.id}" tabindex="-1" aria-labelledby="editBlogModalLabel${blog.id}" aria-hidden="true">
                               <div class="modal-dialog modal-lg"> 
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editBlogModalLabel${blog.id}">Edit Blog</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="${pageContext.request.contextPath}/blog" method="post" enctype="multipart/form-data">
                                                    <input type="hidden" name="action" value="update">
                                                    <input type="hidden" name="id" value="${blog.id}">
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label for="title" class="form-label">Title</label>
                                                            <input type="text" class="form-control" id="title" name="title" value="${blog.title}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="date" class="form-label">Date</label>
                                                            <input type="date" class="form-control" id="date" name="date" value="${blog.date}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="summary" class="form-label">Summary</label>
                                                            <textarea class="form-control" id="summary" name="summary">${blog.summary}</textarea>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="newImage" class="form-label">Blog Image</label>
                                                            <input type="file" class="form-control" id="newImage" name="newImage">
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
              
                                       <!-- Delete Modal -->
                                    <div class="modal fade" id="deleteBlogModal${blog.id}" tabindex="-1" aria-labelledby="deleteServiceModalLabel${blog.id}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="deleteServiceModalLabel${blog.id}">Delete Blog</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="d-flex justify-content-center mb-1">
                                                        <img src="./assets/images/bin.gif" alt="" class="" width="80">
                                                    </div>
                                                    <h6 class="text-center fw-bold">You are about to delete a blog</h6>
                                                    <p class="text-secondary text-center">This action will permanently delete the blog. <span class="text-dark">Are you sure?</span></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <a href="${pageContext.request.contextPath}/blog?action=delete&id=${blog.id}" class="btn btn-danger">Delete</a>
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

            <!-- Add Blog Modal -->
            <div class="modal fade" id="addBlogModal" tabindex="-1" aria-labelledby="addBlogModalLabel" aria-hidden="true">
                 <div class="modal-dialog modal-lg"> 
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addBlogModalLabel">Add New Blog</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="${pageContext.request.contextPath}/blog" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="action" value="create">
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="newTitle" class="form-label">Title</label>
                                    <input type="text" class="form-control" id="newTitle" name="title" required>
                                </div>
                                <div class="mb-3">
                                    <label for="newDate" class="form-label">Date</label>
                                    <input type="date" class="form-control" id="newDate" name="date" required>
                                </div>
                                <div class="mb-3">
                                    <label for="newSummary" class="form-label">Summary</label>
                                    <textarea class="form-control" id="newSummary" name="summary"></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="image" class="form-label">Blog Image</label>
                                    <input type="file" class="form-control" id="image" name="image" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Create</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </section>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script>
        // Initialize TinyMCE for all textareas
        tinymce.init({
            selector: 'textarea',
            plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
            toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
        });
    </script>
</body>
</html>