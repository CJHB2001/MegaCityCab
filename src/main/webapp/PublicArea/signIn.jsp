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
     <link rel="icon" type="image/x-icon" href="images/MegacabLogo.png">
     <title>Mega City Cab - Sign In</title>
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
    background-color: #f8d7da !important;
    border-color: #f5c6cb;


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
						<h2 class="fw-bold text-white text-uppercase">sign in your account</h2>
						<nav aria-label="breadcrumb w-75 mx-auto">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">sign In</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Promo End -->

	<!-- Main Start -->
	<main class="main sec-padding my-account">
		<div class="container">
			<div class="row g-0 ct-bg">
				<div class="col-lg-6 bg-cover" style="background-image: url('images/sign-in.png');">

				</div>
				<div class="col-lg-6">
					<div class="signup-form">
						<h2 class="sub-title border-bottom pb-4">sign In</h2>
						
						<div class="tab-content pt-4" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-rider" role="tabpanel"
								aria-labelledby="pills-rider-tab">
								<form action="${pageContext.request.contextPath}/customerLogin" method="post">
								  <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${error}
               
            </div>
        </c:if>
            <div class="mb-3">
                <input class="form-control" type="email" name="email" placeholder="Email *" required>
            </div>
            <div class="mb-3">
                <input class="form-control" type="password" name="password" placeholder="Password *" required>
            </div>
            <div class="d-flex justify-content-between">
         
            </div>
            <button class="btn btn-primary mt-3">Sign In</button>
            <p>Don't have an account? <a href="./signUp.jsp">Sign up</a></p>
        </form>
							</div>
							

						</div> <!-- Tab End -->
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