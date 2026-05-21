package com.sliit.eventbooking.models;

public class Ticket {
    private String ticketId;
    private String customerName;
    private String eventName;
    private int quantity;

    public Ticket() {
    }

    public Ticket(String ticketId, String customerName, String eventName, int quantity) {
        this.ticketId = ticketId;
        this.customerName = customerName;
        this.eventName = eventName;
        this.quantity = quantity;
    }

    public String getTicketId() {
        return ticketId;
    }

    public void setTicketId(String ticketId) {
        this.ticketId = ticketId;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String toFileString() {
        return ticketId + "," + customerName + "," + eventName + "," + quantity;
    }
}
