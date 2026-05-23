# Final Project Structure: EventFlow

This document outlines the complete, final file structure for the EventFlow Spring Boot MVC application, including all Java classes, JSP views, and data files. The architecture is categorized by the 5 core team member responsibilities, reflecting the removal of the Feedback & Support module.

## 🌐 Shared / Core Components (Team Effort)
**Focus:** Global utilities, layouts, and the homepage, used by all modules.

*   `pom.xml` - Maven project dependencies and build configuration.
*   `src/main/resources/application.properties` - Spring Boot configuration (view resolver).
*   **Core Utility:**
    *   `src/main/java/com/sliit/eventbooking/utils/FileHandler.java`
*   **Home Controller:**
    *   `src/main/java/com/sliit/eventbooking/controllers/HomeController.java`
*   **Shared Views (JSP):**
    *   `src/main/webapp/WEB-INF/jsp/index.jsp` (Homepage)
    *   `src/main/webapp/WEB-INF/jsp/shared/header.jsp` (Global Navigation & Theme)
    *   `src/main/webapp/WEB-INF/jsp/shared/footer.jsp` (Global Footer)

---

## 👤 Member 1: Customer Management & Profile
**Focus:** User authentication (registration, login/logout), session management, and profile CRUD.

*   **Model:**
    *   `src/main/java/com/sliit/eventbooking/models/Customer.java`
*   **Controller:**
    *   `src/main/java/com/sliit/eventbooking/controllers/CustomerController.java`
*   **Views (JSP):**
    *   `src/main/webapp/WEB-INF/jsp/register.jsp`
    *   `src/main/webapp/WEB-INF/jsp/login.jsp`
    *   `src/main/webapp/WEB-INF/jsp/profile.jsp`
*   **Data Storage:**
    *   `DataFiles/customers.txt`

---

## 👤 Member 2: Admin & Staff Management
**Focus:** Admin portal access, dashboard analytics, and staff CRUD operations.

*   **Model:**
    *   `src/main/java/com/sliit/eventbooking/models/Admin.java`
*   **Controller:**
    *   `src/main/java/com/sliit/eventbooking/controllers/AdminController.java`
*   **Views (JSP):**
    *   `src/main/webapp/WEB-INF/jsp/admin-login.jsp`
    *   `src/main/webapp/WEB-INF/jsp/admin-dashboard.jsp`
    *   `src/main/webapp/WEB-INF/jsp/admin-manage-staff.jsp`
*   **Data Storage:**
    *   `DataFiles/admins.txt`

---

## 👤 Member 3: Event Management
**Focus:** Event CRUD, public catalog display, and algorithmic sorting.

*   **Model:**
    *   `src/main/java/com/sliit/eventbooking/models/Event.java`
*   **Service (Algorithm):**
    *   `src/main/java/com/sliit/eventbooking/services/EventMergeSort.java`
*   **Controller:**
    *   `src/main/java/com/sliit/eventbooking/controllers/EventController.java`
*   **Views (JSP):**
    *   `src/main/webapp/WEB-INF/jsp/events-catalog.jsp`
    *   `src/main/webapp/WEB-INF/jsp/admin-manage-events.jsp`
*   **Data Storage:**
    *   `DataFiles/events.txt`

---

## 👤 Member 4: Ticket Booking
**Focus:** Ticket reservation CRUD and thread-safe booking queue.

*   **Model:**
    *   `src/main/java/com/sliit/eventbooking/models/Ticket.java`
*   **Service (Data Structure):**
    *   `src/main/java/com/sliit/eventbooking/services/BookingQueue.java`
*   **Controller:**
    *   `src/main/java/com/sliit/eventbooking/controllers/BookingController.java`
*   **Views (JSP):**
    *   `src/main/webapp/WEB-INF/jsp/book-ticket.jsp`
    *   `src/main/webapp/WEB-INF/jsp/my-tickets.jsp`
    *   `src/main/webapp/WEB-INF/jsp/admin-view-bookings.jsp`
*   **Data Storage:**
    *   `DataFiles/bookings.txt`

---

## 👤 Member 5: Venue Logistics & Reservation
**Focus:** Managing university halls, capacities, pricing via CRUD operations, and handling venue reservations.

*   **Model:**
    *   `src/main/java/com/sliit/eventbooking/models/Venue.java`
*   **Controller:**
    *   `src/main/java/com/sliit/eventbooking/controllers/VenueController.java`
    *   *(Collaborates with `BookingController.java` for venue reservations)*
*   **Views (JSP):**
    *   `src/main/webapp/WEB-INF/jsp/venues.jsp`
    *   `src/main/webapp/WEB-INF/jsp/admin-add-venue.jsp`
    *   `src/main/webapp/WEB-INF/jsp/admin-manage-venues.jsp`
    *   `src/main/webapp/WEB-INF/jsp/book-venue.jsp`
*   **Data Storage:**
    *   `DataFiles/venues.txt`