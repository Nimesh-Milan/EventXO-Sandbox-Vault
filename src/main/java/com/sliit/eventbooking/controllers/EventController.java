package com.sliit.eventbooking.controllers;

import com.sliit.eventbooking.models.Event;
import com.sliit.eventbooking.services.EventMergeSort;
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
public class EventController {

    private final EventMergeSort eventMergeSort;

    @Autowired
    public EventController(EventMergeSort eventMergeSort) {
        this.eventMergeSort = eventMergeSort;
    }

    @GetMapping("/events")
    public String showEventsCatalog(Model model) {
        List<String> eventRecords = FileHandler.readAllRecords("events.txt");
        List<Event> events = new ArrayList<>();

        for (String record : eventRecords) {
            String[] parts = record.split(",");
            if (parts.length == 4) {
                try {
                    String eventId = parts[0];
                    String title = parts[1];
                    String date = parts[2];
                    int availableTickets = Integer.parseInt(parts[3]);
                    events.add(new Event(eventId, title, date, availableTickets));
                } catch (NumberFormatException e) {
                    System.err.println("Error parsing ticket count for event: " + record);
                }
            }
        }

        eventMergeSort.sort(events);
        model.addAttribute("events", events);

        return "events-catalog";
    }

    @GetMapping("/admin/manage-events")
    public String manageEvents(Model model) {
        List<String> eventRecords = FileHandler.readAllRecords("events.txt");
        List<Event> events = new ArrayList<>();

        for (String record : eventRecords) {
            String[] parts = record.split(",");
            if (parts.length == 4) {
                try {
                    String eventId = parts[0];
                    String title = parts[1];
                    String date = parts[2];
                    int availableTickets = Integer.parseInt(parts[3]);
                    events.add(new Event(eventId, title, date, availableTickets));
                } catch (NumberFormatException e) {
                    System.err.println("Error parsing event record: " + record);
                }
            }
        }

        model.addAttribute("events", events);
        return "admin-manage-events";
    }

    @PostMapping("/admin/add-event")
    public String addEvent(
            @RequestParam("title") String title,
            @RequestParam("date") String date,
            @RequestParam("availableTickets") int availableTickets) {
        
        String eventId = UUID.randomUUID().toString();
        Event event = new Event(eventId, title, date, availableTickets);
        FileHandler.saveRecord("events.txt", event.toFileString());
        return "redirect:/admin/manage-events";
    }

    @PostMapping("/admin/update-event")
    public String updateEvent(
            @RequestParam("eventId") String eventId,
            @RequestParam("title") String title,
            @RequestParam("date") String date,
            @RequestParam("availableTickets") int availableTickets) {
            
        List<String> records = FileHandler.readAllRecords("events.txt");
        for (int i = 0; i < records.size(); i++) {
            if (records.get(i).startsWith(eventId + ",")) {
                String[] parts = records.get(i).split(",");
                if (parts.length >= 4) {
                    records.set(i, parts[0] + "," + title + "," + date + "," + availableTickets);
                }
                break;
            }
        }
        FileHandler.rewriteFile("events.txt", records);
        return "redirect:/admin/manage-events";
    }

    @PostMapping("/admin/delete-event")
    public String deleteEvent(@RequestParam("eventId") String eventId) {
        List<String> records = FileHandler.readAllRecords("events.txt");
        records.removeIf(record -> record.startsWith(eventId + ","));
        FileHandler.rewriteFile("events.txt", records);
        return "redirect:/admin/manage-events";
    }
}
