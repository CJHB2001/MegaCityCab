package com.res.model;


public class Service {
    private int id;
    private String serviceName;
    private String description;
    private String imagePath;

    public Service() {}

    public Service(String serviceName, String description, String imagePath) {
        this.serviceName = serviceName;
        this.description = description;
        this.imagePath = imagePath;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getServiceName() { return serviceName; }
    public void setServiceName(String serviceName) { this.serviceName = serviceName; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
}
