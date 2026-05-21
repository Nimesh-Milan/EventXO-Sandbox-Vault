package com.sliit.eventbooking.models;

public class Admin {
    private String adminId;
    private String username;
    private String roleLevel;

    public Admin() {
    }

    public Admin(String adminId, String username, String roleLevel) {
        this.adminId = adminId;
        this.username = username;
        this.roleLevel = roleLevel;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRoleLevel() {
        return roleLevel;
    }

    public void setRoleLevel(String roleLevel) {
        this.roleLevel = roleLevel;
    }

    public String toFileString() {
        return adminId + "," + username + "," + roleLevel;
    }
}
