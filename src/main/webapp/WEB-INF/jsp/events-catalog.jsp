<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events - Eventxo</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-16">
        <div class="text-center mb-16">
            <h1 class="text-4xl md:text-5xl font-display font-bold text-brand-dark mb-4">Discover Events</h1>
            <p class="text-gray-500 max-w-2xl mx-auto">Explore the latest workshops, guest lectures, and student activities happening around campus.</p>
        </div>

        <c:choose>
            <c:when test="${empty events}">
                <div class="text-center bg-white p-12 rounded-2xl shadow-sm border border-gray-100 max-w-2xl mx-auto">
                    <div class="w-16 h-16 bg-gray-50 text-gray-400 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                    </div>
                    <p class="text-xl font-display font-medium text-gray-700">No events currently scheduled.</p>
                    <p class="text-gray-500 mt-2">Check back soon for upcoming campus activities.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <c:forEach var="event" items="${events}">
                        <div class="bg-white rounded-3xl shadow-md border border-gray-100 overflow-hidden hover:shadow-2xl hover:-translate-y-2 transition-all duration-300 flex flex-col h-full group">
                            <!-- Image/Header Area -->
                            <div class="h-48 relative overflow-hidden bg-gradient-to-br from-gray-900 to-brand-dark">
                                <div class="absolute inset-0 opacity-40 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')]"></div>
                                <div class="absolute top-4 right-4 bg-white/95 backdrop-blur-sm px-3 py-1.5 rounded-full text-xs font-bold text-brand-primary shadow-sm flex items-center gap-1.5">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                    <c:out value="${event.date}" />
                                </div>
                                <div class="absolute bottom-4 left-4">
                                     <span class="px-2.5 py-1 bg-white/20 backdrop-blur-md rounded-lg text-white text-xs font-semibold uppercase tracking-wider border border-white/30">Campus Event</span>
                                </div>
                            </div>

                            <div class="p-6 flex flex-col flex-grow relative bg-white">
                                <!-- Price Badge (Floating) -->
                                <div class="absolute -top-6 right-6 w-12 h-12 bg-emerald-500 rounded-full flex items-center justify-center text-white font-bold shadow-lg border-2 border-white group-hover:scale-110 transition-transform">
                                    $15
                                </div>

                                <h3 class="text-2xl font-display font-bold text-brand-dark mb-2 mt-2 leading-tight group-hover:text-brand-primary transition-colors">
                                    <c:out value="${event.title}" />
                                </h3>

                                <p class="text-gray-500 text-sm mb-6 line-clamp-2">Join us for this exciting campus event. Connect with peers, learn new skills, and make the most of your university experience.</p>

                                <div class="mt-auto space-y-4 pt-4 border-t border-gray-100">
                                    <div class="flex items-center justify-between text-sm">
                                        <div class="flex items-center text-gray-500 font-medium">
                                            <div class="w-8 h-8 rounded-full bg-blue-50 flex items-center justify-center mr-3 text-brand-primary">
                                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 110 4v3a2 2 0 002 2h14a2 2 0 002-2v-3a2 2 0 110-4V7a2 2 0 00-2-2H5z"></path></svg>
                                            </div>
                                            Availability
                                        </div>

                                        <c:choose>
                                            <c:when test="${event.availableTickets <= 0}">
                                                <span class="px-3 py-1 rounded-full text-xs font-bold bg-red-100 text-red-700">
                                                    Sold Out
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="font-bold text-brand-dark bg-gray-100 px-3 py-1 rounded-full"><c:out value="${event.availableTickets}" /> <span class="font-medium text-gray-500 ml-1">left</span></span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <c:choose>
                                        <c:when test="${event.availableTickets > 0}">
                                            <a href="/book-ticket?eventName=${event.title}" class="mt-4 flex items-center justify-center gap-2 w-full bg-brand-dark text-white font-semibold py-3.5 rounded-xl hover:bg-brand-primary transition-all shadow-md group-hover:shadow-lg transform active:scale-95">
                                                <span>Reserve Spot</span>
                                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <button disabled class="mt-4 w-full text-center bg-gray-100 text-gray-400 font-semibold py-3.5 rounded-xl cursor-not-allowed">
                                                Event Full
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
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