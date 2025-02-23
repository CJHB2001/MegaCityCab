<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Service" %>
<%@ page import="com.res.dao.ServiceDAO" %>
<%@ page import="com.res.model.Gallery" %>
<%@ page import="com.res.dao.GalleryDAO" %>
<%@ page import="com.res.model.Review" %>
<%@ page import="com.res.dao.ReviewDAO" %>
<%
    // Fetch the employee list from the database
    ServiceDAO serviceDAO = new ServiceDAO();
    List<Service> servicList = serviceDAO.getAllServices();
    request.setAttribute("serviceList", servicList);
    
    GalleryDAO galleryDAO = new GalleryDAO();
    List<Gallery> galleryList = galleryDAO.getAllGalleries();
    request.setAttribute("galleryList", galleryList);
    
    ReviewDAO reviewDAO = new ReviewDAO();
    List<Review> reviewList = reviewDAO.getAllReviews();
    request.setAttribute("reviewList", reviewList);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Sign Up - HTML5 Template</title>
    <style>
        /* Alert Styles */
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            position: relative;
            animation: fadeIn 0.5s;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        
        .alert-danger {
            background-color: #f8d7da;
            border-color: #f5c6cb;
           
        }
        
        .btn-close {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            background: transparent;
            border: none;
            font-size: 20px;
            color: inherit;
            padding: 0 5px;
        }
        
        .btn-close:hover {
            opacity: 0.7;
        }
        
      
    </style>
</head>

<body>
    <!-- Header Start -->
    <jsp:include page="./navBar.jsp" />
    <!-- Header End -->

    <!-- Promo Section Start -->
    <section class="promo-sec" style="background: url('images/promo-bg.jpg')no-repeat center center / cover;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="promo-wrap text-center">
                        <h2 class="fw-7 text-white text-uppercase">Create Account</h2>
                        <nav aria-label="breadcrumb w-75 mx-auto">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Sign Up</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Promo Section End -->

    <!-- Main Content Start -->
    <main class="main sec-padding my-account">
        <div class="container">
            <!-- Alert Messages -->
          
            <div class="row g-0 ct-bg">
                <div class="col-lg-6 bg-cover" style="background-image: url('images/account.jpg');">
                </div>
                <div class="col-lg-6">
                    <div class="signup-form">
                        <h2 class="sub-title border-bottom pb-4">Sign Up</h2>
                        <div class="tab-content pt-4" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-rider" role="tabpanel" aria-labelledby="pills-rider-tab">
                              <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert" id="errorAlert">
                    ${error}
                    <button type="button" class="btn-close" onclick="dismissAlert(this.parentElement)">&times;</button>
                    <div class="alert-progress">
                        <div class="alert-progress-bar"></div>
                    </div>
                </div>
            </c:if>
            
            <c:if test="${not empty success}">
                <div class="alert alert-success alert-dismissible fade show" role="alert" id="successAlert">
                    ${success}
                    <button type="button" class="btn-close" onclick="dismissAlert(this.parentElement)">&times;</button>
                    <div class="alert-progress">
                        <div class="alert-progress-bar"></div>
                    </div>
                </div>
            </c:if>
                            
                              <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation" novalidate>
                                    <div class="mb-3">
                                        <input class="form-control" type="text" name="firstName" placeholder="First Name *" required>
                                        <div class="invalid-feedback">
                                            Please enter your first name.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <input class="form-control" type="text" name="lastName" placeholder="Last Name *" required>
                                        <div class="invalid-feedback">
                                            Please enter your last name.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <input class="form-control" type="tel" name="phone" placeholder="Phone *" pattern="[0-9]{10}" required>
                                        <div class="invalid-feedback">
                                            Please enter a valid 10-digit phone number.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <input class="form-control" type="email" name="email" placeholder="Email *" required>
                                        <div class="invalid-feedback">
                                            Please enter a valid email address.
                                        </div>
                                    </div>
                                <div class="mb-3">
    <input class="form-control" type="password" name="password" 
           placeholder="Password *" 
           pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" 
           required>
    <div class="invalid-feedback">
        Password must be at least 8 characters long and contain at least one letter and one number.
    </div>
</div>
                                    <div class="mb-3">
                                        <input class="form-control" type="text" name="addressLine1" placeholder="Address Line 1 *" required>
                                        <div class="invalid-feedback">
                                            Please enter your address.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <input class="form-control" type="text" name="addressLine2" placeholder="Address Line 2">
                                    </div>
                                    <div class="mb-3">
                                        <input class="form-control" type="text" name="nicNumber" placeholder="NIC Number *" 
                                               pattern="^[0-9]{9}[vVxX]$|^[0-9]{12}$" required>
                                        <div class="invalid-feedback">
                                            Please enter a valid NIC number (old format: 9 digits + V/X, new format: 12 digits).
                                        </div>
                                    </div>
                                    <button class="btn btn-primary mt-3" type="submit">Sign Up</button>
                                    <p class="mt-3">Already have an account? <a href="./signIn.jsp">Sign In</a></p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- Main Content End -->

    <!-- Footer Start -->
    <jsp:include page="./footer.jsp" />
    <!-- Footer End -->

    <script>
        // Function to dismiss alert
        function dismissAlert(element) {
            element.style.animation = 'fadeOut 0.5s';
            setTimeout(() => {
                element.remove();
            }, 500);
        }

        // Auto-dismiss alerts after 40 seconds
        document.addEventListener('DOMContentLoaded', function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                setTimeout(() => {
                    if (alert && alert.parentElement) {
                        dismissAlert(alert);
                    }
                }, 10000); // 40 seconds
            });
        });
        
        // Clear session attributes after alert is shown
        <% 
            if (session.getAttribute("error") != null) {
                session.removeAttribute("error");
            }
            if (session.getAttribute("success") != null) {
                session.removeAttribute("success");
            }
        %>
    </script>
      <script>
        // Bootstrap validation
        (function () {
            'use strict';
            var forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>