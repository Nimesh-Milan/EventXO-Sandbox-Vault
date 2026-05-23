<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings - Admin</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-12">
        <div class="mb-10 flex flex-col md:flex-row md:items-end justify-between border-b border-gray-200 pb-6 gap-4">
            <div>
                <h1 class="text-3xl font-display font-bold text-brand-dark">View All Bookings</h1>
                <p class="text-gray-500 text-sm mt-1">Review all ticket reservations across the platform.</p>
            </div>
            <a href="/admin/dashboard" class="bg-white border border-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm font-medium hover:bg-gray-50 transition-colors shadow-sm flex items-center gap-2">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
                Back to Dashboard
            </a>
        </div>

        <c:choose>
            <c:when test="${empty bookings}">
                <div class="text-center bg-white p-12 rounded-2xl shadow-sm border border-gray-100 max-w-3xl mx-auto">
                    <div class="w-16 h-16 bg-gray-50 text-gray-400 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
                    </div>
                    <p class="text-lg font-medium text-gray-600">No bookings found in the system.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse min-w-[800px]">
                            <thead>
                                <tr class="bg-gray-50 border-b border-gray-200">
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider">Ticket ID</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider">Customer Name</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider">Details</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider text-center">Quantity/Hours</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider text-right">Total Price</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                <c:forEach var="booking" items="${bookings}">
                                    <tr class="hover:bg-gray-50/50 transition-colors duration-150 group">
                                        <td class="py-4 px-6 text-sm text-gray-500 font-mono tracking-wider"><c:out value="${booking.ticketId}" /></td>
                                        <td class="py-4 px-6 text-sm font-bold text-brand-dark"><c:out value="${booking.customerName}" /></td>
                                        <td class="py-4 px-6 text-sm text-brand-primary font-medium"><c:out value="${booking.eventName}" /></td>
                                        <td class="py-4 px-6 text-sm text-center">
                                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-700 border border-gray-200">
                                                <c:out value="${booking.quantity}" />
                                            </span>
                                        </td>
                                        <td class="py-4 px-6 text-sm text-right font-bold text-emerald-600">
                                            <fmt:setLocale value="en_US"/>
                                            <fmt:formatNumber value="${booking.price}" type="currency"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </main>

    <jsp:include page="shared/footer.jsp" />
</body>
</html>