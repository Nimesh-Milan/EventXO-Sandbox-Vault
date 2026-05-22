<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Venues - Eventxo</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-16">
        <div class="text-center mb-16">
            <h1 class="text-4xl md:text-5xl font-display font-bold text-brand-dark mb-4">Our Venues</h1>
            <p class="text-gray-500 max-w-2xl mx-auto">Discover premium spaces tailored for your next campus event, workshop, or gathering.</p>
        </div>

        <c:choose>
            <c:when test="${empty venues}">
                <div class="text-center bg-white p-12 rounded-2xl shadow-sm border border-gray-100 max-w-2xl mx-auto">
                    <div class="w-16 h-16 bg-gray-50 text-gray-400 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
                    </div>
                    <p class="text-xl font-display font-medium text-gray-700">No venues are currently available.</p>
                    <p class="text-gray-500 mt-2">Please check back later.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <c:forEach var="venue" items="${venues}">
                        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-xl hover:shadow-brand-primary/10 transition-all duration-300 group flex flex-col h-full">
                            <!-- Abstract Graphic for Venue -->
                            <div class="h-40 bg-gray-50 relative overflow-hidden flex items-center justify-center border-b border-gray-100">
                                <div class="absolute inset-0 opacity-50 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-indigo-100 via-gray-50 to-gray-50"></div>
                                <svg class="w-20 h-20 text-gray-200 relative z-10" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M4 4a2 2 0 012-2h8a2 2 0 012 2v12a1 1 0 110 2h-3a1 1 0 01-1-1v-2a1 1 0 00-1-1H9a1 1 0 00-1 1v2a1 1 0 01-1 1H4a1 1 0 110-2V4zm3 1h2v2H7V5zm2 4H7v2h2V9zm2-4h2v2h-2V5zm2 4h-2v2h2V9z" clip-rule="evenodd"></path></svg>
                            </div>

                            <div class="p-6 flex flex-col flex-grow">
                                <h3 class="text-2xl font-display font-bold text-brand-dark mb-6 group-hover:text-brand-primary transition-colors">
                                    <c:out value="${venue.locationName}" />
                                </h3>

                                <div class="mt-auto space-y-3 pt-6 border-t border-gray-100">
                                    <div class="flex items-center justify-between text-sm">
                                        <div class="flex items-center text-gray-500 font-medium">
                                            <div class="w-8 h-8 rounded-full bg-indigo-50 flex items-center justify-center mr-3 text-brand-primary">
                                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                                            </div>
                                            Capacity
                                        </div>
                                        <span class="font-semibold text-brand-dark"><c:out value="${venue.capacity}" /> <span class="text-gray-400 font-normal">pax</span></span>
                                    </div>

                                    <div class="flex items-center justify-between text-sm">
                                        <div class="flex items-center text-gray-500 font-medium">
                                            <div class="w-8 h-8 rounded-full bg-emerald-50 flex items-center justify-center mr-3 text-brand-secondary">
                                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                            </div>
                                            Rate
                                        </div>
                                        <span class="font-semibold text-brand-dark">$<c:out value="${venue.pricePerHour}" /> <span class="text-gray-400 font-normal">/ hr</span></span>
                                    </div>
                                </div>

                                <button class="mt-8 w-full bg-white border border-brand-primary text-brand-primary font-semibold py-3 rounded-xl hover:bg-brand-primary hover:text-white transition-colors group-hover:shadow-sm">
                                    Inquire Now
                                </button>
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