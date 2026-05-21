package com.sliit.eventbooking.models;

public class Review {
    private String reviewId;
    private String customerName;
    private String eventName;
    private int rating; // 1 to 5
    private String comment;

    public Review() {
    }

    public Review(String reviewId, String customerName, String eventName, int rating, String comment) {
        this.reviewId = reviewId;
        this.customerName = customerName;
        this.eventName = eventName;
        this.rating = rating;
        this.comment = comment;
    }

    public String getReviewId() {
        return reviewId;
    }

    public void setReviewId(String reviewId) {
        this.reviewId = reviewId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String toFileString() {
        return reviewId + "," + customerName + "," + eventName + "," + rating + "," + comment;
    }
}
