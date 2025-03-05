package com.res.model;

public class Vehicle {
    private int id;
    private String vehicleType;
    private String engineNumber;
    private String vehicleNumber;
    private String brand;
    private String color;
    private String vehicleFuelType;
    private int doors;
    private int capacity;
    private int driverId; 
    private String driverName; 
    private String driverExperience; 
    private String driverProfilePhoto; 
    private String imagePath;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public String getEngineNumber() { return engineNumber; }
    public void setEngineNumber(String engineNumber) { this.engineNumber = engineNumber; }

    public String getVehicleNumber() { return vehicleNumber; }
    public void setVehicleNumber(String vehicleNumber) { this.vehicleNumber = vehicleNumber; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }

    public String getVehicleFuelType() { return vehicleFuelType; }
    public void setVehicleFuelType(String vehicleFuelType) { this.vehicleFuelType = vehicleFuelType; }

    public int getDoors() { return doors; }
    public void setDoors(int doors) { this.doors = doors; }

    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }

    public int getDriverId() { return driverId; }
    public void setDriverId(int driverId) { this.driverId = driverId; }

    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }

    public String getDriverExperience() { return driverExperience; }
    public void setDriverExperience(String driverExperience) { this.driverExperience = driverExperience; }

    public String getDriverProfilePhoto() { return driverProfilePhoto; }
    public void setDriverProfilePhoto(String driverProfilePhoto) { this.driverProfilePhoto = driverProfilePhoto; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
}