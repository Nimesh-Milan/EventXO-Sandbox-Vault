package com.sliit.eventbooking.controllers;

import com.sliit.eventbooking.models.Inquiry;
import com.sliit.eventbooking.models.Review;
import com.sliit.eventbooking.utils.FileHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class SupportController {

    @GetMapping("/support")
    public String showSupportPage(@RequestParam(value = "success", required = false) String success, Model model) {
        if ("true".equals(success)) {
            model.addAttribute("successMessage", "Your inquiry has been submitted successfully!");
        }
        return "support";
    }

    @PostMapping("/submit-inquiry")
    public String submitInquiry(
            @RequestParam("studentEmail") String studentEmail,
            @RequestParam("subject") String subject,
            @RequestParam("message") String message) {

        String inquiryId = UUID.randomUUID().toString();
        // Replace commas in message and subject to prevent breaking the CSV format
        String safeSubject = subject.replace(",", " ");
        String safeMessage = message.replace(",", " ").replace("\n", " ");
        
        Inquiry inquiry = new Inquiry(inquiryId, studentEmail, safeSubject, safeMessage);

        FileHandler.saveRecord("inquiries.txt", inquiry.toFileString());

        return "redirect:/support?success=true";
    }

    @GetMapping("/admin/support-desk")
    public String showAdminSupportDesk(Model model) {
        List<String> inquiryRecords = FileHandler.readAllRecords("inquiries.txt");
        List<Inquiry> inquiries = new ArrayList<>();

        for (String record : inquiryRecords) {
            String[] parts = record.split(",");
            // Support both old 4-part format and new 5-part format with status
            if (parts.length >= 4) {
                String inquiryId = parts[0];
                String studentEmail = parts[1];
                String subject = parts[2];
                String message = parts[3];
                String status = (parts.length >= 5) ? parts[4] : "Pending";
                
                inquiries.add(new Inquiry(inquiryId, studentEmail, subject, message, status));
            }
        }

        model.addAttribute("inquiries", inquiries);
        return "admin-support-desk";
    }

    @PostMapping("/admin/resolve-inquiry")
    public String resolveInquiry(@RequestParam("inquiryId") String inquiryId) {
        List<String> records = FileHandler.readAllRecords("inquiries.txt");
        for (int i = 0; i < records.size(); i++) {
            if (records.get(i).startsWith(inquiryId + ",")) {
                String[] parts = records.get(i).split(",");
                if(parts.length >= 4) {
                    records.set(i, parts[0] + "," + parts[1] + "," + parts[2] + "," + parts[3] + ",Resolved");
                }
                break;
            }
        }
        FileHandler.rewriteFile("inquiries.txt", records);
        return "redirect:/admin/support-desk";
    }

    @PostMapping("/admin/delete-inquiry")
    public String deleteInquiry(@RequestParam("inquiryId") String inquiryId) {
        List<String> records = FileHandler.readAllRecords("inquiries.txt");
        records.removeIf(record -> record.startsWith(inquiryId + ","));
        FileHandler.rewriteFile("inquiries.txt", records);
        return "redirect:/admin/support-desk";
    }

    @GetMapping("/reviews")
    public String showReviews(Model model) {
        List<String> reviewRecords = FileHandler.readAllRecords("reviews.txt");
        List<Review> reviews = new ArrayList<>();

        for (String record : reviewRecords) {
            String[] parts = record.split(",");
            if (parts.length == 5) {
                try {
                    String reviewId = parts[0];
                    String customerName = parts[1];
                    String eventName = parts[2];
                    int rating = Integer.parseInt(parts[3]);
                    String comment = parts[4];
                    reviews.add(new Review(reviewId, customerName, eventName, rating, comment));
                } catch (NumberFormatException e) {
                    System.err.println("Error parsing rating for review: " + record);
                }
            }
        }

        model.addAttribute("reviews", reviews);
        return "event-reviews";
    }

    @PostMapping("/submit-review")
    public String submitReview(
            @RequestParam("customerName") String customerName,
            @RequestParam("eventName") String eventName,
            @RequestParam("rating") int rating,
            @RequestParam("comment") String comment) {

        String reviewId = UUID.randomUUID().toString();
        // Clean comment of commas to avoid breaking file reading
        String safeComment = comment.replace(",", " ").replace("\n", " ");
        
        Review review = new Review(reviewId, customerName, eventName, rating, safeComment);
        FileHandler.saveRecord("reviews.txt", review.toFileString());

        return "redirect:/reviews";
    }

    @PostMapping("/update-review")
    public String updateReview(
            @RequestParam("reviewId") String reviewId,
            @RequestParam("rating") int rating,
            @RequestParam("comment") String comment) {
        
        List<String> records = FileHandler.readAllRecords("reviews.txt");
        String safeComment = comment.replace(",", " ").replace("\n", " ");
        
        for (int i = 0; i < records.size(); i++) {
            if (records.get(i).startsWith(reviewId + ",")) {
                String[] parts = records.get(i).split(",");
                if (parts.length >= 5) {
                    records.set(i, parts[0] + "," + parts[1] + "," + parts[2] + "," + rating + "," + safeComment);
                }
                break;
            }
        }
        FileHandler.rewriteFile("reviews.txt", records);
        return "redirect:/reviews";
    }

    @PostMapping("/delete-review")
    public String deleteReview(@RequestParam("reviewId") String reviewId) {
        List<String> records = FileHandler.readAllRecords("reviews.txt");
        records.removeIf(record -> record.startsWith(reviewId + ","));
        FileHandler.rewriteFile("reviews.txt", records);
        return "redirect:/reviews";
    }
}
