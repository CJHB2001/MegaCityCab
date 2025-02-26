package com.res.model;

import java.sql.Date;
import java.sql.Time;

public class Booking {
    private int id;
    private int customerId;
    private String registrationNumber;
    private String email;
    private String name;
    private String phoneNumber;
    private String pickUpPoint;
    private String dropOffPoint;
    private int passengers;
    private String vehicleType;
    private float distanceKm;
    private float totalBill;
    private Date rideDate;
    private Time rideTime;
    private String message;
    private int bookingStatus;
    private int carId;
    private String vehicleNumber; 

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public String getRegistrationNumber() { return registrationNumber; }
    public void setRegistrationNumber(String registrationNumber) { this.registrationNumber = registrationNumber; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getPickUpPoint() { return pickUpPoint; }
    public void setPickUpPoint(String pickUpPoint) { this.pickUpPoint = pickUpPoint; }

    public String getDropOffPoint() { return dropOffPoint; }
    public void setDropOffPoint(String dropOffPoint) { this.dropOffPoint = dropOffPoint; }

    public int getPassengers() { return passengers; }
    public void setPassengers(int passengers) { this.passengers = passengers; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public float getDistanceKm() { return distanceKm; }
    public void setDistanceKm(float distanceKm) { this.distanceKm = distanceKm; }

    public float getTotalBill() { return totalBill; }
    public void setTotalBill(float totalBill) { this.totalBill = totalBill; }

    public Date getRideDate() { return rideDate; }
    public void setRideDate(Date rideDate) { this.rideDate = rideDate; }

    public Time getRideTime() { return rideTime; }
    public void setRideTime(Time rideTime) { this.rideTime = rideTime; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public int getBookingStatus() { return bookingStatus; }
    public void setBookingStatus(int bookingStatus) { this.bookingStatus = bookingStatus; }
    
    public int getCarId() { return carId; }
    public void setCarId(int carId) { this.carId = carId; }
    
}