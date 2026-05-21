package com.sliit.eventbooking.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // When a user goes to "localhost:8080/", this method runs!
    @GetMapping("/")
    public String showHomePage() {
        return "index"; // This tells Spring Boot to load "index.jsp"
    }
}