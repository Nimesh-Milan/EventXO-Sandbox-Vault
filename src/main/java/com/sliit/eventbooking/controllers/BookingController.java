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
        Ticket ticket = new Ticket(ticketId, customerName, eventName, quantity);
        
        // Add to queue and process it
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
            if (parts.length == 4) {
                try {
                    String ticketId = parts[0];
                    String customerName = parts[1];
                    String eventName = parts[2];
                    int quantity = Integer.parseInt(parts[3]);
                    tickets.add(new Ticket(ticketId, customerName, eventName, quantity));
                } catch (NumberFormatException e) {
                    System.err.println("Error parsing quantity for ticket: " + record);
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
                    // Update only the quantity
                    records.set(i, parts[0] + "," + parts[1] + "," + parts[2] + "," + quantity);
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
