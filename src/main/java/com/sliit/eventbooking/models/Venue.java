package com.sliit.eventbooking.models;

public class Venue {
    private String venueId;
    private String locationName;
    private int capacity;
    private double pricePerHour;

    public Venue() {
    }

    public Venue(String venueId, String locationName, int capacity, double pricePerHour) {
        this.venueId = venueId;
        this.locationName = locationName;
        this.capacity = capacity;
        this.pricePerHour = pricePerHour;
    }

    public String getVenueId() {
        return venueId;
    }

    public void setVenueId(String venueId) {
        this.venueId = venueId;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public double getPricePerHour() {
        return pricePerHour;
    }

    public void setPricePerHour(double pricePerHour) {
        this.pricePerHour = pricePerHour;
    }

    public String toFileString() {
        return venueId + "," + locationName + "," + capacity + "," + pricePerHour;
    }
}
