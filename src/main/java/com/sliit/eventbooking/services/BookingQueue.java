package com.sliit.eventbooking.services;

import com.sliit.eventbooking.models.Ticket;
import com.sliit.eventbooking.utils.FileHandler;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.Queue;

@Service
public class BookingQueue {
    
    // Thread-safe FIFO queue
    private final Queue<Ticket> queue = new LinkedList<>();

    public synchronized void enqueueBooking(Ticket ticket) {
        queue.add(ticket);
    }

    public synchronized void processQueue() {
        while (!queue.isEmpty()) {
            Ticket ticket = queue.poll();
            FileHandler.saveRecord("bookings.txt", ticket.toFileString());
        }
    }
}
