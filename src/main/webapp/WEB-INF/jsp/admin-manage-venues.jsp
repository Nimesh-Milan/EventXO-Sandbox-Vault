<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Venues - Admin</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-12">
        <div class="mb-10 flex flex-col md:flex-row md:items-end justify-between border-b border-gray-200 pb-6 gap-4">
            <div>
                <h1 class="text-3xl font-display font-bold text-brand-dark">Manage Venues</h1>
                <p class="text-gray-500 text-sm mt-1">Configure campus spaces, capacities, and pricing.</p>
            </div>
            <div class="flex gap-3">
                <a href="/admin/dashboard" class="bg-white border border-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm font-medium hover:bg-gray-50 transition-colors shadow-sm flex items-center gap-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
                    Back
                </a>
                <a href="/admin/add-venue" class="bg-brand-primary text-white px-4 py-2 rounded-lg text-sm font-medium hover:bg-indigo-700 transition-colors shadow-sm flex items-center gap-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                    Add Venue
                </a>
            </div>
        </div>

        <c:choose>
            <c:when test="${empty venues}">
                <div class="text-center bg-white p-12 rounded-2xl shadow-sm border border-gray-100 max-w-3xl mx-auto">
                    <div class="w-16 h-16 bg-gray-50 text-gray-400 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
                    </div>
                    <p class="text-lg font-medium text-gray-600">No venues configured.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse min-w-[800px]">
                            <thead>
                                <tr class="bg-gray-50 border-b border-gray-200">
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider w-1/3">Location Details</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider w-1/5">Capacity</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider w-1/5">Price/Hr</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                <c:forEach var="venue" items="${venues}">
                                    <tr class="hover:bg-gray-50/50 transition-colors duration-150 group">
                                        <form action="/admin/update-venue" method="post">
                                            <input type="hidden" name="venueId" value="${venue.venueId}">

                                            <td class="py-4 px-6">
                                                <div class="flex flex-col">
                                                    <input type="text" name="locationName" value="${venue.locationName}" required
                                                           class="font-display font-bold text-brand-dark bg-transparent border-b border-transparent focus:border-brand-primary focus:outline-none transition-colors w-full p-1 -ml-1 text-lg">
                                                    <p class="text-xs text-gray-400 font-mono mt-1 truncate max-w-xs" title="${venue.venueId}">ID: <c:out value="${venue.venueId}" /></p>
                                                </div>
                                            </td>
                                            <td class="py-4 px-6">
                                                <div class="flex items-center gap-2">
                                                    <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
                                                    <input type="number" name="capacity" value="${venue.capacity}" required
                                                           class="w-20 font-medium text-gray-700 bg-transparent border-b border-transparent focus:border-brand-primary focus:outline-none transition-colors p-1">
                                                    <span class="text-xs text-gray-500">pax</span>
                                                </div>
                                            </td>
                                            <td class="py-4 px-6">
                                                <div class="flex items-center gap-1">
                                                    <span class="text-brand-secondary font-medium">$</span>
                                                    <input type="number" step="0.01" name="pricePerHour" value="${venue.pricePerHour}" required
                                                           class="w-20 font-bold text-brand-dark bg-transparent border-b border-transparent focus:border-brand-primary focus:outline-none transition-colors p-1">
                                                </div>
                                            </td>
                                            <td class="py-4 px-6 text-right">
                                                <div class="flex justify-end gap-2 items-center">
                                                    <button type="submit" class="text-xs font-semibold text-white bg-gray-800 hover:bg-black px-3 py-1.5 rounded-lg transition-colors opacity-0 group-hover:opacity-100">
                                                        Save
                                                    </button>
                                        </form>

                                        <form action="/admin/delete-venue" method="post" class="m-0">
                                            <input type="hidden" name="venueId" value="${venue.venueId}">
                                            <button type="submit" onclick="return confirm('Are you sure you want to delete this venue?');"
                                                    class="p-2 text-gray-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-colors" title="Delete Venue">
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