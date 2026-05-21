<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
                        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-xl hover:shadow-brand-primary/10 transition-all duration-300 group flex flex-col h-full transform hover:-translate-y-1">
                            <!-- Event Header Image / Pattern placeholder -->
                            <div class="h-32 bg-gradient-to-r from-indigo-500 to-purple-600 relative overflow-hidden">
                                <div class="absolute inset-0 bg-white/20 blur-2xl rounded-full transform scale-150 -top-10 -right-10"></div>
                                <div class="absolute bottom-4 left-6 bg-white/90 backdrop-blur-sm px-3 py-1 rounded-full text-xs font-bold text-brand-dark shadow-sm">
                                    <c:out value="${event.date}" />
                                </div>
                            </div>

                            <div class="p-6 flex flex-col flex-grow">
                                <h3 class="text-xl font-display font-bold text-brand-dark mb-4 group-hover:text-brand-primary transition-colors line-clamp-2">
                                    <c:out value="${event.title}" />
                                </h3>

                                <div class="mt-auto space-y-4 pt-4 border-t border-gray-100">
                                    <div class="flex items-center justify-between text-sm">
                                        <div class="flex items-center text-gray-500 font-medium">
                                            <svg class="w-4 h-4 mr-2 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 110 4v3a2 2 0 002 2h14a2 2 0 002-2v-3a2 2 0 110-4V7a2 2 0 00-2-2H5z"></path></svg>
                                            Availability
                                        </div>

                                        <c:choose>
                                            <c:when test="${event.availableTickets <= 0}">
                                                <span class="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-red-50 text-red-600 border border-red-100">
                                                    Sold Out
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="font-bold text-brand-dark"><c:out value="${event.availableTickets}" /> <span class="font-normal text-gray-500">left</span></span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <c:choose>
                                        <c:when test="${event.availableTickets > 0}">
                                            <a href="/book-ticket?eventName=${event.title}" class="block w-full text-center bg-brand-light text-brand-primary font-medium py-3 rounded-xl hover:bg-brand-primary hover:text-white transition-colors">
                                                Book Ticket
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <button disabled class="w-full text-center bg-gray-100 text-gray-400 font-medium py-3 rounded-xl cursor-not-allowed">
                                                Unavailable
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