package com.res.model;


public class Employee {
    private int id;
    private String name;
    private int age;
    private String email;
    private String role;
    private String status;
    private String profileImagePath;

    public Employee() {}

    public Employee(String name, int age, String email, String role, String status, String profileImagePath) {
        this.name = name;
        this.age = age;
        this.email = email;
        this.role = role;
        this.status = status;
        this.profileImagePath = profileImagePath;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getProfileImagePath() { return profileImagePath; }
    public void setProfileImagePath(String profileImagePath) { this.profileImagePath = profileImagePath; }
}