package com.res.model;

public enum UserRole {
    ADMIN("admin"),
    DRIVER("driver"),
    CUSTOMER("customer");
    
    private final String value;
    
    UserRole(String value) {
        this.value = value;
    }
    
    public String getValue() {
        return value;
    }
    
    public static UserRole fromString(String value) {
        for (UserRole role : UserRole.values()) {
            if (role.getValue().equalsIgnoreCase(value)) {
                return role;
            }
        }
        throw new IllegalArgumentException("No enum constant with value: " + value);
    }
}
