package com.sliit.eventbooking.controllers;

import com.sliit.eventbooking.models.Customer;
import com.sliit.eventbooking.utils.FileHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

@Controller
public class CustomerController {

    @GetMapping("/register")
    public String showRegisterForm(HttpSession session) {
        if (session.getAttribute("loggedInUser") != null) {
            return "redirect:/profile";
        }
        return "register";
    }

    @PostMapping("/register")
    public String registerCustomer(
            @RequestParam("fullName") String fullName,
            @RequestParam("email") String email,
            @RequestParam("password") String password) {
        
        String customerId = UUID.randomUUID().toString();
        Customer customer = new Customer(customerId, fullName, email, password);
        
        // Append the current date as the registration date
        String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("MMMM yyyy"));
        String dataToSave = customer.toFileString() + "," + currentDate;
        
        FileHandler.saveRecord("customers.txt", dataToSave);
        
        return "redirect:/login?registered=true";
    }

    @GetMapping("/login")
    public String showLoginForm(
            @RequestParam(value = "registered", required = false) String registered, 
            @RequestParam(value = "error", required = false) String error, 
            @RequestParam(value = "logout", required = false) String logout, 
            HttpSession session,
            Model model) {
        
        if (session.getAttribute("loggedInUser") != null) {
            return "redirect:/profile";
        }
        
        if ("true".equals(registered)) {
            model.addAttribute("successMessage", "Account created successfully. Please sign in.");
        }
        if ("success".equals(logout)) {
            model.addAttribute("successMessage", "You have been successfully logged out.");
        }
        if ("invalid".equals(error)) {
            model.addAttribute("errorMessage", "Invalid email or password.");
        }
        return "login";
    }
    
    @PostMapping("/login")
    public String loginCustomer(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session) {
            
        List<String> customerRecords = FileHandler.readAllRecords("customers.txt");
        for (String record : customerRecords) {
            String[] parts = record.split(",");
            if (parts.length >= 4) {
                String savedEmail = parts[2];
                String savedPassword = parts[3];
                
                if (savedEmail.equals(email) && savedPassword.equals(password)) {
                    // Valid credentials, save to session
                    session.setAttribute("loggedInUser", parts[1]);
                    session.setAttribute("loggedInEmail", email);
                    session.setAttribute("isAdmin", false);
                    
                    // Capture member since date if it exists, otherwise default to Today
                    String memberSince = (parts.length >= 5) ? parts[4] : "Today";
                    session.setAttribute("memberSince", memberSince);
                    
                    return "redirect:/profile?login=success";
                }
            }
        }
        
        // Invalid credentials
        return "redirect:/login?error=invalid";
    }

    @GetMapping("/logout")
    public String logoutCustomer(HttpSession session) {
        session.invalidate();
        return "redirect:/login?logout=success";
    }

    @GetMapping("/profile")
    public String showProfile(
            @RequestParam(value = "login", required = false) String login, 
            @RequestParam(value = "edit", required = false) String edit,
            HttpSession session,
            Model model) {
        
        String loggedInUser = (String) session.getAttribute("loggedInUser");
        String loggedInEmail = (String) session.getAttribute("loggedInEmail");
        String memberSince = (String) session.getAttribute("memberSince");
        
        if (loggedInUser == null) {
            return "redirect:/login"; // Require login
        }
        
        if ("success".equals(login)) {
            model.addAttribute("successMessage", "Signed in successfully! Welcome back.");
        }

        if ("true".equals(edit)) {
            model.addAttribute("editMode", true);
        }
        
        model.addAttribute("userName", loggedInUser);
        model.addAttribute("userEmail", loggedInEmail);
        model.addAttribute("userInitial", loggedInUser.substring(0, 1).toUpperCase());
        model.addAttribute("memberSince", memberSince != null ? memberSince : "Today");

        return "profile";
    }

    @PostMapping("/update-profile")
    public String updateProfile(
            @RequestParam("fullName") String fullName,
            HttpSession session) {
            
        String loggedInEmail = (String) session.getAttribute("loggedInEmail");
        if (loggedInEmail == null) return "redirect:/login";

        List<String> records = FileHandler.readAllRecords("customers.txt");
        for (int i = 0; i < records.size(); i++) {
            String[] parts = records.get(i).split(",");
            if (parts.length >= 4 && parts[2].equals(loggedInEmail)) {
                // Keep the rest of the details the same, only update fullName
                parts[1] = fullName;
                records.set(i, String.join(",", parts));
                // Update session
                session.setAttribute("loggedInUser", fullName);
                break;
            }
        }
        FileHandler.rewriteFile("customers.txt", records);
        return "redirect:/profile";
    }

    @PostMapping("/delete-account")
    public String deleteAccount(HttpSession session) {
        String loggedInEmail = (String) session.getAttribute("loggedInEmail");
        if (loggedInEmail != null) {
            List<String> records = FileHandler.readAllRecords("customers.txt");
            records.removeIf(record -> {
                String[] parts = record.split(",");
                return parts.length >= 3 && parts[2].equals(loggedInEmail);
            });
            FileHandler.rewriteFile("customers.txt", records);
            session.invalidate();
        }
        return "redirect:/";
    }
}
