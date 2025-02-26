
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>





<!DOCTYPE html>
<html lang="zxx">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">


   <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

   <!-- Header Start -->
             <jsp:include page="./navBar.jsp" />
   <!-- Header End -->
	<!-- Promo Start -->
	<section class="promo-sec" style="background: url('images/promo-bg.jpg')no-repeat center center / cover;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="promo-wrap text-center">
						<h2 class="fw-bold text-white text-uppercase">Book your Ride</h2>
						<nav aria-label="breadcrumb w-75 mx-auto">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Book Ride</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Promo End -->
   <!-- Promo Start -->
   	<main class="main sec-padding">
		<div class="container">
			<div class="row pb-5 mb-5">
				<div class="col-lg-12">
					<div class="card bg-light booking-sec">
						<div class="text-center col-xl-7 col-md-10 mx-auto">
							<h2 class="sec-title">Book your Ride Today!</h2>
							<p>Booking your ride is a super easy process. Voluptatem fugiat nesciunt ab quis impedit esse
								dicta. Reiciendis officia,
								optio aut adipisci accusantium ullam perferendis deleniti. Obcaecati, placeat quas?</p>
						</div>
					<form action="#" class="booking-form mt-5 row">
    <div class="form-group col-lg-6">
        <input class="form-control" type="text" placeholder="Your Name">
        <span><i class="fa fa-user"></i></span>
    </div>
    <div class="form-group col-lg-6">
        <input class="form-control" type="text" placeholder="Phone Number">
        <span><i class="fa fa-phone"></i></span>
    </div>
    <div class="form-group col-lg-6">
        <input class="form-control" type="text" placeholder="Pick Up point">
        <span><i class="fa fa-location-dot"></i></span>
    </div>
    <div class="form-group col-lg-6">
        <input class="form-control" type="text" placeholder="Drop Off point">
        <span><i class="fa fa-location-dot"></i></span>
    </div>
    <div class="form-group col-lg-6">
        <select class="wide" name="#" id="passenger">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="5+">5+</option>
        </select>
    </div>
    <div class="form-group col-lg-6">
        <select class="wide" name="#" id="select-car">
            <option value="">Select Vehicle Type</option>
            <option value="car" data-rate="200">Car</option>
            <option value="van" data-rate="250">Van</option>
            <option value="jeep" data-rate="220">Jeep</option>
            <option value="tuk-tuk" data-rate="100">Tuk Tuk</option>
            <option value="bus" data-rate="275">Bus</option>
        </select>
    </div>
    <div class="form-group col-lg-6">
        <input type="number" id="kmInput" class="form-control" placeholder="Enter Distance in KM">
        <span><i class="fa fa-road"></i></span>
    </div>
    <div class="form-group col-lg-6">
        <input type="text" id="totalBill" class="form-control" placeholder="Total Bill (LKR)" readonly>
        <span><i class="fa fa-money"></i></span>
    </div>
    <div class="form-group col-lg-6">
        <input type="text" name="foo" placeholder="Select Date">
        <span><i class="fa fa-calendar"></i></span>
    </div>
    <div class="form-group col-lg-6">
        <input type="text" class="timepicker" placeholder="Select Time" />
        <span><i class="fa fa-clock"></i></span>
    </div>
    <div class="form-group col-lg-12">
        <textarea placeholder="Your Message..." name="" id="" cols="30" rows="6"></textarea>
        <span><i class="fa fa-pen"></i></span>
    </div>
    <div class="form-group text-center mt-5">
        <button class="btn btn-primary">Book Now <i class="fa fa-arrow-right"></i></button>
    </div>
</form>


					
					</div>
				</div>
			</div>

	
		</div>
	</main>
   
   <!-- Main Start -->
            <jsp:include page="./footer.jsp" />
            
            
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let vehicleSelect = document.getElementById("select-car");
        let kmInput = document.getElementById("kmInput");
        let totalBill = document.getElementById("totalBill");

        function calculateBill() {
            let selectedOption = vehicleSelect.options[vehicleSelect.selectedIndex];
            let rate = selectedOption.getAttribute("data-rate");
            let km = parseFloat(kmInput.value);
            
            if (rate && km && km > 0) {
                totalBill.value = " LKR " + (rate * km);
            } else {
                totalBill.value = "";
            }
        }

        vehicleSelect.addEventListener("change", calculateBill);
        kmInput.addEventListener("input", calculateBill);
    });
</script>
   <!-- Footer Start -->
 