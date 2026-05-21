<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Tickets - Eventxo</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-16">
        <div class="text-center mb-16">
            <h1 class="text-4xl md:text-5xl font-display font-bold text-brand-dark mb-4">My Tickets</h1>
            <p class="text-gray-500 max-w-2xl mx-auto">Manage your reserved seats and upcoming campus experiences.</p>
        </div>

        <c:choose>
            <c:when test="${empty tickets}">
                <div class="text-center bg-white p-12 rounded-2xl shadow-sm border border-gray-100 max-w-2xl mx-auto">
                    <div class="w-16 h-16 bg-gray-50 text-gray-400 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 110 4v3a2 2 0 002 2h14a2 2 0 002-2v-3a2 2 0 110-4V7a2 2 0 00-2-2H5z"></path></svg>
                    </div>
                    <p class="text-xl font-display font-medium text-gray-700">You haven't booked any tickets yet.</p>
                    <div class="mt-6">
                        <a href="/events" class="inline-flex items-center justify-center bg-brand-primary text-white font-medium px-8 py-3 rounded-xl hover:bg-indigo-700 transition-colors shadow-sm">
                            Browse Events
                        </a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <c:forEach var="ticket" items="${tickets}">
                        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 relative group hover:shadow-md transition-all">

                            <!-- Cancel Ticket Button -->
                            <form action="/cancel-ticket" method="post" class="absolute top-4 right-4 z-10 m-0">
                                <input type="hidden" name="ticketId" value="${ticket.ticketId}">
                                <button type="submit" onclick="return confirm('Are you sure you want to cancel this booking?');"
                                        class="w-8 h-8 flex items-center justify-center rounded-full bg-gray-50 text-gray-400 hover:bg-red-50 hover:text-red-500 transition-colors" title="Cancel Booking">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                                </button>
                            </form>

                            <div class="mb-6 pr-8">
                                <div class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 mb-3">Confirmed</div>
                                <h3 class="text-2xl font-display font-bold text-brand-dark leading-tight"><c:out value="${ticket.eventName}" /></h3>
                            </div>

                            <div class="space-y-4 mb-6 bg-gray-50 rounded-xl p-4 border border-gray-100">
                                <div class="flex justify-between items-center">
                                    <span class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Attendee</span>
                                    <span class="text-sm font-medium text-brand-dark"><c:out value="${ticket.customerName}" /></span>
                                </div>

                                <div class="border-t border-gray-200"></div>

                                <!-- Inline Edit Quantity Form -->
                                <form action="/update-ticket" method="post" class="flex justify-between items-center m-0">
                                    <input type="hidden" name="ticketId" value="${ticket.ticketId}">
                                    <span class="text-xs font-semibold text-gray-500 uppercase tracking-wider">Quantity</span>
                                    <div class="flex items-center gap-2">
                                        <input type="number" name="quantity" value="${ticket.quantity}" min="1" required
                                               class="w-16 px-2 py-1 bg-white border border-gray-200 rounded-lg text-center text-sm font-semibold text-brand-dark focus:outline-none focus:border-brand-primary">
                                        <button type="submit" class="text-xs font-semibold text-brand-primary hover:text-indigo-800 transition-colors">
                                            Update
                                        </button>
                                    </div>
                                </form>
                            </div>

                            <div class="pt-4 border-t border-gray-100 flex items-center justify-between">
                                <span class="text-xs text-gray-400 font-mono">ID: <c:out value="${ticket.ticketId}" /></span>
                                <svg class="w-5 h-5 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 110 4v3a2 2 0 002 2h14a2 2 0 002-2v-3a2 2 0 110-4V7a2 2 0 00-2-2H5z"></path></svg>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </main>

    <jsp:include page="shared/footer.jsp" />
</body>
</html>