package com.sliit.eventbooking.models;

public class Customer {
    private String customerId;
    private String fullName;
    private String email;
    private String password;

    public Customer() {
    }

    public Customer(String customerId, String fullName, String email, String password) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    public String toFileString() {
        return customerId + "," + fullName + "," + email + "," + password;
    }
}
