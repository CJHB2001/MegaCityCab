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
    private String vehicleNumber; // Vehicle number
    private String vehicleImagePath; // Vehicle image
    private String vehicleBrand; // Vehicle brand
    private String vehicleColor; // Vehicle color
    private String vehicleFuelType; // Vehicle fuel type
    private int vehicleDoors; // Vehicle doors
    private int vehicleCapacity; // Vehicle capacity
    private int driverId; // Driver ID
    private String driverName; // Driver name
    private String driverImagePath; // Driver image
    private int driverAge; // Driver age
    private String driverExperience; // Driver experience
    private String driverLicenseId; // Driver license ID
    private String driverGender; // Driver gender
    private int tripStatus; // New field for trip status

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

    public String getVehicleNumber() { return vehicleNumber; }
    public void setVehicleNumber(String vehicleNumber) { this.vehicleNumber = vehicleNumber; }
    
    public String getVehicleImagePath() { return vehicleImagePath; }
    public void setVehicleImagePath(String vehicleImagePath) { this.vehicleImagePath = vehicleImagePath; }

    public String getVehicleBrand() { return vehicleBrand; }
    public void setVehicleBrand(String vehicleBrand) { this.vehicleBrand = vehicleBrand; }

    public String getVehicleColor() { return vehicleColor; }
    public void setVehicleColor(String vehicleColor) { this.vehicleColor = vehicleColor; }

    public String getVehicleFuelType() { return vehicleFuelType; }
    public void setVehicleFuelType(String vehicleFuelType) { this.vehicleFuelType = vehicleFuelType; }

    public int getVehicleDoors() { return vehicleDoors; }
    public void setVehicleDoors(int vehicleDoors) { this.vehicleDoors = vehicleDoors; }

    public int getVehicleCapacity() { return vehicleCapacity; }
    public void setVehicleCapacity(int vehicleCapacity) { this.vehicleCapacity = vehicleCapacity; }


    
    
    public int getDriverId() { return driverId; }
    public void setDriverId(int driverId) { this.driverId = driverId; }

    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }

    public String getDriverImagePath() { return driverImagePath; }
    public void setDriverImagePath(String driverImagePath) { this.driverImagePath = driverImagePath; }

    public int getDriverAge() { return driverAge; }
    public void setDriverAge(int driverAge) { this.driverAge = driverAge; }

    public String getDriverExperience() { return driverExperience; }
    public void setDriverExperience(String driverExperience) { this.driverExperience = driverExperience; }

    public String getDriverLicenseId() { return driverLicenseId; }
    public void setDriverLicenseId(String driverLicenseId) { this.driverLicenseId = driverLicenseId; }

    public String getDriverGender() { return driverGender; }
    public void setDriverGender(String driverGender) { this.driverGender = driverGender; }

    public int getTripStatus() { return tripStatus; }
    public void setTripStatus(int tripStatus) { this.tripStatus = tripStatus; }
}