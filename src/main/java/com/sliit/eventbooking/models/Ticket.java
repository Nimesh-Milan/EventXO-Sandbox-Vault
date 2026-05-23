package com.sliit.eventbooking.models;

public class Ticket {
    private String ticketId;
    private String customerName;
    private String eventName;
    private int quantity;
    private double price;

    public Ticket(String ticketId, String customerName, String eventName, int quantity, double price) {
        this.ticketId = ticketId;
        this.customerName = customerName;
        this.eventName = eventName;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters
    public String getTicketId() {
        return ticketId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public String getEventName() {
        return eventName;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }

    public String toFileString() {
        return ticketId + "," + customerName + "," + eventName + "," + quantity + "," + price;
    }
}