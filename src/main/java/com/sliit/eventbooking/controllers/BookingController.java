package com.sliit.eventbooking.controllers;

import com.sliit.eventbooking.models.Ticket;
import com.sliit.eventbooking.services.BookingQueue;
import com.sliit.eventbooking.utils.FileHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class BookingController {

    private final BookingQueue bookingQueue;

    @Autowired
    public BookingController(BookingQueue bookingQueue) {
        this.bookingQueue = bookingQueue;
    }

    @GetMapping("/book-ticket")
    public String showBookTicketForm() {
        return "book-ticket";
    }

    @PostMapping("/book-ticket")
    public String bookTicket(
            @RequestParam("customerName") String customerName,
            @RequestParam("eventName") String eventName,
            @RequestParam("quantity") int quantity) {
        
        String ticketId = UUID.randomUUID().toString();
        
        // Find event price
        double eventPrice = 4500.00; // Default fallback
        List<String> events = FileHandler.readAllRecords("events.txt");
        for (String e : events) {
            String[] parts = e.split("\\|");
            if (parts.length >= 5 && parts[1].equals(eventName)) {
                try {
                    eventPrice = Double.parseDouble(parts[4]);
                } catch (Exception ex) {}
                break;
            }
        }
        
        double price = quantity * eventPrice;
        Ticket ticket = new Ticket(ticketId, customerName, eventName, quantity, price);
        
        // Add to queue and process it
        bookingQueue.enqueueBooking(ticket);
        bookingQueue.processQueue();
        
        return "redirect:/my-tickets";
    }

    @GetMapping("/book-venue")
    public String showBookVenueForm() {
        return "book-venue";
    }

    @PostMapping("/book-venue")
    public String bookVenue(
            @RequestParam("customerName") String customerName,
            @RequestParam("venueName") String venueName,
            @RequestParam("bookingDate") String bookingDate,
            @RequestParam("hours") int hours) {
        
        String bookingId = UUID.randomUUID().toString();
        
        // Find venue price
        double hourlyRate = 15000.0; // Default fallback in LKR
        List<String> venues = FileHandler.readAllRecords("venues.txt");
        for (String v : venues) {
            String[] parts = v.split(",");
            if (parts.length >= 4 && parts[1].equals(venueName)) {
                try {
                    hourlyRate = Double.parseDouble(parts[3]);
                } catch (Exception e) {}
                break;
            }
        }
        
        double price = hours * hourlyRate;
        
        // For now, we'll store venue bookings in the same file as tickets
        // but prefix the eventName with "Venue: " to distinguish them
        Ticket ticket = new Ticket(bookingId, customerName, "Venue: " + venueName + " (" + bookingDate + ")", hours, price);
        
        bookingQueue.enqueueBooking(ticket);
        bookingQueue.processQueue();
        
        return "redirect:/my-tickets";
    }

    @GetMapping("/my-tickets")
    public String showMyTickets(Model model) {
        List<String> bookingRecords = FileHandler.readAllRecords("bookings.txt");
        List<Ticket> tickets = new ArrayList<>();

        for (String record : bookingRecords) {
            String[] parts = record.split(",");
            if (parts.length >= 4) {
                try {
                    String ticketId = parts[0];
                    String customerName = parts[1];
                    String eventName = parts[2];
                    int quantity = Integer.parseInt(parts[3]);
                    double price = 0.0;
                    if (parts.length >= 5) {
                        price = Double.parseDouble(parts[4]);
                    }
                    tickets.add(new Ticket(ticketId, customerName, eventName, quantity, price));
                } catch (NumberFormatException e) {
                    System.err.println("Error parsing data for ticket: " + record);
                }
            }
        }
        
        model.addAttribute("tickets", tickets);
        return "my-tickets";
    }

    @PostMapping("/update-ticket")
    public String updateTicket(
            @RequestParam("ticketId") String ticketId,
            @RequestParam("quantity") int quantity) {
            
        List<String> records = FileHandler.readAllRecords("bookings.txt");
        for (int i = 0; i < records.size(); i++) {
            if (records.get(i).startsWith(ticketId + ",")) {
                String[] parts = records.get(i).split(",");
                if (parts.length >= 4) {
                    double unitPrice = 4500.0; // Default ticket price in LKR
                    if(parts[2].startsWith("Venue:")) {
                        // It's a venue booking, quantity is hours.
                        // We need to recalculate based on the old price and old hours to find the hourly rate
                        try {
                            int oldHours = Integer.parseInt(parts[3]);
                            double oldPrice = Double.parseDouble(parts[4]);
                            unitPrice = oldPrice / oldHours;
                        } catch (Exception e) {}
                    } else if (parts.length >= 5) {
                        try {
                           int oldQty = Integer.parseInt(parts[3]);
                           double oldPrice = Double.parseDouble(parts[4]);
                           unitPrice = oldPrice / oldQty;
                        } catch (Exception e) {}
                    }
                    
                    double newPrice = quantity * unitPrice;
                    records.set(i, parts[0] + "," + parts[1] + "," + parts[2] + "," + quantity + "," + newPrice);
                }
                break;
            }
        }
        FileHandler.rewriteFile("bookings.txt", records);
        return "redirect:/my-tickets";
    }

    @PostMapping("/cancel-ticket")
    public String cancelTicket(@RequestParam("ticketId") String ticketId) {
        List<String> records = FileHandler.readAllRecords("bookings.txt");
        records.removeIf(record -> record.startsWith(ticketId + ","));
        FileHandler.rewriteFile("bookings.txt", records);
        return "redirect:/my-tickets";
    }
}