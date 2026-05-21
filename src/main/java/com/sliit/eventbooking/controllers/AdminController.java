package com.sliit.eventbooking.controllers;

import com.sliit.eventbooking.models.Ticket;
import com.sliit.eventbooking.models.Admin;
import com.sliit.eventbooking.utils.FileHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class AdminController {

    @GetMapping("/admin")
    public String showAdminLogin() {
        return "admin-login";
    }

    @PostMapping("/admin/login")
    public String processAdminLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session) {
        
        // For demonstration, a simple hardcoded check. 
        // In a real app, you'd check against a database or admins.txt
        if ("admin".equals(username) && "admin".equals(password)) {
            session.setAttribute("loggedInAdmin", username);
            return "redirect:/admin/dashboard";
        }
        
        // Otherwise, read from admins.txt
        List<String> staffRecords = FileHandler.readAllRecords("admins.txt");
        for (String record : staffRecords) {
            String[] parts = record.split(",");
            if (parts.length >= 2) {
                if (parts[1].equals(username) && "password".equals(password)) { // Defaulting all staff passwords to 'password'
                    session.setAttribute("loggedInAdmin", username);
                    return "redirect:/admin/dashboard";
                }
            }
        }
        
        return "redirect:/admin?error=invalid";
    }

    @GetMapping("/admin/dashboard")
    public String showAdminDashboard(Model model) {
        List<String> bookings = FileHandler.readAllRecords("bookings.txt");
        List<String> inquiries = FileHandler.readAllRecords("inquiries.txt");
        
        model.addAttribute("totalBookings", bookings.size());
        model.addAttribute("totalInquiries", inquiries.size());
        
        return "admin-dashboard";
    }

    @GetMapping("/admin/bookings")
    public String viewAllBookings(Model model) {
        List<String> bookingRecords = FileHandler.readAllRecords("bookings.txt");
        List<Ticket> bookings = new ArrayList<>();

        for (String record : bookingRecords) {
            String[] parts = record.split(",");
            if (parts.length == 4) {
                try {
                    String ticketId = parts[0];
                    String customerName = parts[1];
                    String eventName = parts[2];
                    int quantity = Integer.parseInt(parts[3]);
                    bookings.add(new Ticket(ticketId, customerName, eventName, quantity));
                } catch (NumberFormatException e) {
                    System.err.println("Error parsing quantity for ticket: " + record);
                }
            }
        }
        
        model.addAttribute("bookings", bookings);
        return "admin-view-bookings";
    }

    @GetMapping("/admin/manage-staff")
    public String manageStaff(Model model) {
        List<String> staffRecords = FileHandler.readAllRecords("admins.txt");
        List<Admin> staffList = new ArrayList<>();

        for (String record : staffRecords) {
            String[] parts = record.split(",");
            if (parts.length == 3) {
                String adminId = parts[0];
                String username = parts[1];
                String roleLevel = parts[2];
                staffList.add(new Admin(adminId, username, roleLevel));
            }
        }

        model.addAttribute("staffList", staffList);
        return "admin-manage-staff";
    }

    @PostMapping("/admin/add-staff")
    public String addStaff(@RequestParam("username") String username, @RequestParam("roleLevel") String roleLevel) {
        String adminId = UUID.randomUUID().toString();
        Admin admin = new Admin(adminId, username, roleLevel);
        FileHandler.saveRecord("admins.txt", admin.toFileString());
        return "redirect:/admin/manage-staff";
    }
    
    @PostMapping("/admin/update-staff")
    public String updateStaff(@RequestParam("adminId") String adminId, @RequestParam("roleLevel") String roleLevel) {
        List<String> records = FileHandler.readAllRecords("admins.txt");
        for (int i = 0; i < records.size(); i++) {
            if (records.get(i).startsWith(adminId + ",")) {
                String[] parts = records.get(i).split(",");
                if (parts.length >= 3) {
                    records.set(i, parts[0] + "," + parts[1] + "," + roleLevel);
                }
                break;
            }
        }
        FileHandler.rewriteFile("admins.txt", records);
        return "redirect:/admin/manage-staff";
    }

    @PostMapping("/admin/delete-staff")
    public String deleteStaff(@RequestParam("adminId") String adminId) {
        List<String> records = FileHandler.readAllRecords("admins.txt");
        records.removeIf(record -> record.startsWith(adminId + ","));
        FileHandler.rewriteFile("admins.txt", records);
        return "redirect:/admin/manage-staff";
    }
}
