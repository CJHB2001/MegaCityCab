
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.res.model.Service " %>
<%@ page import="com.res.dao.ServiceDAO" %>
<%@ page import="com.res.model.Gallery" %>
<%@ page import="com.res.dao.GalleryDAO" %>
<%@ page import="com.res.model.Review " %>
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
   <title>HTML5 Template</title>

</head>

<body>

   <!-- Header Start -->
           <jsp:include page="./navBar.jsp" />
   <!-- Header End -->

   <!-- Slider Section End -->
	<section class="promo-sec" style="background: url('images/promo-bg.jpg')no-repeat center center / cover;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap text-center">
						<h2 class="fw-7 text-white text-uppercase">create account</h2>
						<nav aria-label="breadcrumb w-75 mx-auto">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">sign up</li>
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
				<div class="col-lg-6 bg-cover" style="background-image: url('images/account.jpg');">
				</div>
				<div class="col-lg-6">
					<div class="signup-form">
						<h2 class="sub-title border-bottom pb-4">sign up</h2>
					
						<div class="tab-content pt-4" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-rider" role="tabpanel"
								aria-labelledby="pills-rider-tab">
								<form action="#">
    <div class="mb-3">
        <input class="form-control" type="text" placeholder="Full Name *">
    </div>
    <div class="mb-3">
        <input class="form-control" type="number" placeholder="Phone *">
    </div>
    <div class="mb-3">
        <input class="form-control" type="email" placeholder="Email *">
    </div>
    <div class="mb-3">
        <input class="form-control" type="password" placeholder="Password *">
    </div>
    <div class="mb-3">
        <input class="form-control" type="text" placeholder="Address Line 1 *">
    </div>
    <div class="mb-3">
        <input class="form-control" type="text" placeholder="Address Line 2">
    </div>
    <div class="mb-3">
        <input class="form-control" type="text" placeholder="NIC Number *">
    </div>
    <button class="btn btn-primary mt-3">Sign Up </button>
    <p>Already have an account? <a href="#">Sign In</a></p>
</form>
								
							</div>
							

						</div> <!-- Tab End -->
					</div>
				</div>

			</div>
		</div>
	</main>  
   <!-- Blog Section End -->
              <jsp:include page="./footer.jsp" />
<!-- Footer Start -->
