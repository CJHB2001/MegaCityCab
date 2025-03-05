package com.res.model;

public class Newsletter {
    private int id;
    private String email;
    private boolean agreement;

    public Newsletter() {}

    public Newsletter(String email, boolean agreement) {
        this.email = email;
        this.agreement = agreement;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public boolean isAgreement() { return agreement; }
    public void setAgreement(boolean agreement) { this.agreement = agreement; }
}