package com.sliit.eventbooking.models;

public class Inquiry {
    private String inquiryId;
    private String studentEmail;
    private String subject;
    private String message;
    private String status;

    public Inquiry() {
        this.status = "Pending";
    }

    public Inquiry(String inquiryId, String studentEmail, String subject, String message) {
        this.inquiryId = inquiryId;
        this.studentEmail = studentEmail;
        this.subject = subject;
        this.message = message;
        this.status = "Pending";
    }

    public Inquiry(String inquiryId, String studentEmail, String subject, String message, String status) {
        this.inquiryId = inquiryId;
        this.studentEmail = studentEmail;
        this.subject = subject;
        this.message = message;
        this.status = status;
    }

    public String getInquiryId() {
        return inquiryId;
    }

    public void setInquiryId(String inquiryId) {
        this.inquiryId = inquiryId;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String toFileString() {
        return inquiryId + "," + studentEmail + "," + subject + "," + message + "," + status;
    }
}
