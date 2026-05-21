package com.sliit.eventbooking.models;

public class Event {
    private String eventId;
    private String title;
    private String date; // Format: YYYY-MM-DD
    private int availableTickets;

    public Event() {
    }

    public Event(String eventId, String title, String date, int availableTickets) {
        this.eventId = eventId;
        this.title = title;
        this.date = date;
        this.availableTickets = availableTickets;
    }

    public String getEventId() {
        return eventId;
    }

    public void setEventId(String eventId) {
        this.eventId = eventId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getAvailableTickets() {
        return availableTickets;
    }

    public void setAvailableTickets(int availableTickets) {
        this.availableTickets = availableTickets;
    }

    public String toFileString() {
        return eventId + "," + title + "," + date + "," + availableTickets;
    }
}
