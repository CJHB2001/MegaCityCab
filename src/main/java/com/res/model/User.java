package com.res.model;

public class User {
    private int id;
    private String email;
    private String password;
    private UserRole role;  // Changed from String to UserRole enum
    private String profilePhoto;  
    private String name;
    private int age;
    private String experience;
    private String licenseId;
    private String gender;

    public User() {}
    
    public User(String email, String password, UserRole role, String name, 
                int age, String experience, String licenseId, String gender, String profilePhoto) {
        this.email = email;
        this.password = password;
        this.role = role;
        this.name = name;
        this.age = age;
        this.experience = experience;
        this.licenseId = licenseId;
        this.gender = gender;
        this.profilePhoto = profilePhoto;
    }

    // Existing getters and setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    
    public UserRole getRole() {
        return role;
    }
    public void setRole(UserRole role) {
        this.role = role;
    }
    // String-based role methods for backward compatibility
    public String getRoleValue() {
        return role != null ? role.getValue() : null;
    }
    public void setRoleFromString(String roleValue) {
        if (roleValue != null && !roleValue.isEmpty()) {
            this.role = UserRole.fromString(roleValue);
        }
    }
    
    // New profile photo getter and setter
    public String getProfilePhoto() {
        return profilePhoto;
    }
    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }
    
    // Existing driver field getters and setters
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public String getExperience() {
        return experience;
    }
    public void setExperience(String experience) {
        this.experience = experience;
    }
    public String getLicenseId() {
        return licenseId;
    }
    public void setLicenseId(String licenseId) {
        this.licenseId = licenseId;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
}
