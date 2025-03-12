package com.res.model;

public class Contact {
    private int id;
    private String fullName;
    private String phone;
    private String email;
    private String message;
    private boolean replied;

    // Constructors
    public Contact() {}

    public Contact(String fullName, String phone, String email, String message) {
        this.fullName = fullName;
        this.phone = phone;
        this.email = email;
        this.message = message;
        this.replied = false;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    
    public boolean isReplied() { return replied; }
    public void setReplied(boolean replied) { this.replied = replied; }
}