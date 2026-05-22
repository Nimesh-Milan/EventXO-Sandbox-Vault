<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Staff - Admin</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-12">
        <div class="mb-10 flex flex-col md:flex-row md:items-end justify-between border-b border-gray-200 pb-6 gap-4">
            <div>
                <h1 class="text-3xl font-display font-bold text-brand-dark">Manage Staff</h1>
                <p class="text-gray-500 text-sm mt-1">Add, update, or remove administrative personnel.</p>
            </div>
            <a href="/admin/dashboard" class="bg-white border border-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm font-medium hover:bg-gray-50 transition-colors shadow-sm flex items-center gap-2">
                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
                Back to Dashboard
            </a>
        </div>

        <!-- Add Admin Form -->
        <div class="bg-white p-6 md:p-8 rounded-2xl shadow-sm border border-gray-100 mb-10">
            <div class="flex items-center gap-3 mb-6">
                <div class="w-10 h-10 rounded-lg bg-indigo-50 text-brand-primary flex items-center justify-center">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                </div>
                <h2 class="text-xl font-display font-bold text-brand-dark">Add New Admin</h2>
            </div>

            <form action="/admin/add-staff" method="post" class="grid grid-cols-1 md:grid-cols-3 gap-6 items-end">
                <div>
                    <label for="username" class="block text-sm font-medium text-gray-700 mb-1.5">Username</label>
                    <input type="text" id="username" name="username" required
                           class="block w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div>
                    <label for="roleLevel" class="block text-sm font-medium text-gray-700 mb-1.5">Role Level</label>
                    <select id="roleLevel" name="roleLevel" required
                            class="block w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all cursor-pointer">
                        <option value="Admin">Admin</option>
                        <option value="Super Admin">Super Admin</option>
                    </select>
                </div>
                <div>
                    <button type="submit"
                            class="w-full bg-brand-primary text-white font-medium py-3 rounded-xl hover:bg-indigo-700 transition-colors shadow-sm shadow-brand-primary/30">
                        Add Staff Member
                    </button>
                </div>
            </form>
        </div>

        <c:choose>
            <c:when test="${empty staffList}">
                <div class="text-center bg-white p-12 rounded-2xl shadow-sm border border-gray-100">
                    <div class="w-16 h-16 bg-gray-50 text-gray-400 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"></path></svg>
                    </div>
                    <p class="text-lg font-medium text-gray-600">No staff members found.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left border-collapse min-w-[600px]">
                            <thead>
                                <tr class="bg-gray-50 border-b border-gray-200">
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider">Admin Details</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider">Role Level</th>
                                    <th class="py-4 px-6 text-xs font-semibold text-gray-500 uppercase tracking-wider text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                <c:forEach var="staff" items="${staffList}">
                                    <tr class="hover:bg-gray-50/50 transition-colors duration-150">
                                        <td class="py-4 px-6">
                                            <div class="flex items-center gap-3">
                                                <div class="w-10 h-10 rounded-full bg-brand-light flex items-center justify-center text-brand-primary font-bold text-sm">
                                                    ${fn:substring(staff.username, 0, 1)}
                                                </div>
                                                <div>
                                                    <p class="text-sm font-bold text-brand-dark"><c:out value="${staff.username}" /></p>
                                                    <p class="text-xs text-gray-500 font-mono mt-0.5">ID: <c:out value="${fn:substring(staff.adminId, 0, 8)}..." /></p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="py-4 px-6">
                                            <form action="/admin/update-staff" method="post" class="m-0">
                                                <input type="hidden" name="adminId" value="${staff.adminId}">
                                                <select name="roleLevel" onchange="this.form.submit()"
                                                        class="px-3 py-1.5 bg-white border border-gray-200 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-colors cursor-pointer font-medium
                                                        <c:choose>
                                                            <c:when test="${staff.roleLevel == 'Super Admin'}">text-brand-primary border-brand-primary/30 bg-indigo-50/50</c:when>
                                                            <c:otherwise>text-gray-700</c:otherwise>
                                                        </c:choose>">
                                                    <option value="Admin" <c:if test="${staff.roleLevel == 'Admin'}">selected</c:if>>Admin</option>
                                                    <option value="Super Admin" <c:if test="${staff.roleLevel == 'Super Admin'}">selected</c:if>>Super Admin</option>
                                                </select>
                                            </form>
                                        </td>
                                        <td class="py-4 px-6 text-right">
                                            <form action="/admin/delete-staff" method="post" class="inline-block m-0">
                                                <input type="hidden" name="adminId" value="${staff.adminId}">
                                                <button type="submit" onclick="return confirm('Are you sure you want to remove this staff member?');"
                                                        class="p-2 text-gray-400 hover:text-red-500 hover:bg-red-50 rounded-lg transition-colors" title="Remove Staff">
                                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                                                </button>
                                            </form>
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