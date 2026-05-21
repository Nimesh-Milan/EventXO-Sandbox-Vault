<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Events - Admin</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-12">
        <div class="mb-10 flex flex-col md:flex-row md:items-end justify-between border-b border-gray-200 pb-6 gap-4">
            <div>
                <h1 class="text-3xl font-display font-bold text-brand-dark">Manage Events</h1>
                <p class="text-gray-500 text-sm mt-1">Create, update, and monitor campus events.</p>
            </div>
            <a href="/admin/dashboard" class="bg-white border border-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm font-medium hover:bg-gray-50 transition-colors shadow-sm flex items-center gap-2">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
                Back to Dashboard
            </a>
        </div>

        <!-- Add Event Form -->
        <div class="bg-white p-6 md:p-8 rounded-2xl shadow-sm border border-gray-100 mb-10">
            <div class="flex items-center gap-3 mb-6">
                <div class="w-10 h-10 rounded-lg bg-emerald-50 text-brand-secondary flex items-center justify-center">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                </div>
                <h2 class="text-xl font-display font-bold text-brand-dark">Create New Event</h2>
            </div>

            <form action="/admin/add-event" method="post" class="grid grid-cols-1 md:grid-cols-4 gap-6 items-end">
                <div class="md:col-span-1">
                    <label for="title" class="block text-sm font-medium text-gray-700 mb-1.5">Event Title</label>
                    <input type="text" id="title" name="title" required placeholder="e.g. Tech Workshop"
                           class="block w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div class="md:col-span-1">
                    <label for="date" class="block text-sm font-medium text-gray-700 mb-1.5">Date</label>
                    <input type="text" id="date" name="date" required placeholder="e.g. Nov 20, 2024"
                           class="block w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div class="md:col-span-1">
                    <label for="availableTickets" class="block text-sm font-medium text-gray-700 mb-1.5">Tickets Available</label>
                    <input type="number" id="availableTickets" name="availableTickets" min="1" required placeholder="e.g. 150"
                           class="block w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div class="md:col-span-1">
                    <button type="submit"
                            class="w-full bg-brand-primary text-white font-medium py-3 rounded-xl hover:bg-indigo-700 transition-colors shadow-sm shadow-brand-primary/30">
                        Create Event
                    </button>
                </div>
            </form>
        </div>

        <c:choose>
            <c:when test="${empty events}">
                <div class="text-center bg-white p-12 rounded-2xl shadow-sm border border-gray-100">
                    <div class="w-16 h-16 bg-gray-50 text-gray-400 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                    </div>
                    <p class="text-lg font-medium text-gray-600">No events found in the system.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse min-w-[800px]">
                            <thead>
                                <tr class="bg-gray-50 border-b border-gray-200">
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider w-1/3">Event Details</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider w-1/4">Date</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider w-1/6 text-center">Tickets</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                <c:forEach var="event" items="${events}">
                                    <tr class="hover:bg-gray-50/50 transition-colors duration-150 group">
                                        <form action="/admin/update-event" method="post">
                                            <input type="hidden" name="eventId" value="${event.eventId}">

                                            <td class="py-4 px-6">
                                                <div class="flex flex-col">
                                                    <input type="text" name="title" value="${event.title}" required
                                                           class="font-display font-bold text-brand-dark bg-transparent border-b border-transparent focus:border-brand-primary focus:outline-none transition-colors w-full p-1 -ml-1">
                                                    <p class="text-xs text-gray-400 font-mono mt-1">ID: <c:out value="${fn:substring(event.eventId, 0, 8)}..." /></p>
                                                </div>
                                            </td>
                                            <td class="py-4 px-6">
                                                <div class="flex items-center gap-2">
                                                    <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                                    <input type="text" name="date" value="${event.date}" required
                                                           class="text-gray-600 bg-transparent border-b border-transparent focus:border-brand-primary focus:outline-none transition-colors w-full p-1 text-sm">
                                                </div>
                                            </td>
                                            <td class="py-4 px-6 text-center">
                                                <c:choose>
                                                    <c:when test="${event.availableTickets <= 0}">
                                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-50 text-red-700 border border-red-200 mb-1">
                                                            Sold Out
                                                        </span>
                                                        <input type="number" name="availableTickets" value="${event.availableTickets}" required
                                                           class="text-gray-500 bg-transparent border-b border-transparent focus:border-brand-primary focus:outline-none transition-colors w-16 text-center text-sm p-1 mx-auto hidden group-hover:block">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="number" name="availableTickets" value="${event.availableTickets}" required
                                                           class="font-semibold text-brand-dark bg-transparent border-b border-transparent focus:border-brand-primary focus:outline-none transition-colors w-16 text-center p-1 mx-auto">
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="py-4 px-6 text-right">
                                                <div class="flex justify-end gap-2 items-center">
                                                    <button type="submit" class="text-xs font-semibold text-white bg-gray-800 hover:bg-black px-3 py-1.5 rounded-lg transition-colors opacity-0 group-hover:opacity-100">
                                                        Save
                                                    </button>
                                        </form>

                                        <form action="/admin/delete-event" method="post" class="m-0">
                                            <input type="hidden" name="eventId" value="${event.eventId}">
                                            <button type="submit" onclick="return confirm('Cancel and delete this event permanently?');"
                                                    class="p-2 text-gray-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-colors" title="Delete Event">
                                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                                            </button>
                                        </form>
                                                </div>
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