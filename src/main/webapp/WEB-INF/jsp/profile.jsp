<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - Eventxo</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-16 flex justify-center items-center">
        <div class="bg-white p-10 rounded-2xl shadow-xl shadow-gray-200 border border-gray-100 w-full max-w-lg">
            <div class="flex flex-col items-center mb-8 relative">
                <!-- Profile Avatar -->
                <div class="w-24 h-24 bg-indigo-50 text-brand-primary rounded-full flex items-center justify-center border-4 border-white shadow-md mb-4">
                    <span class="text-3xl font-display font-bold"><c:out value="${userInitial}" /></span>
                </div>

                <c:choose>
                    <c:when test="${editMode}">
                        <form action="/update-profile" method="post" class="w-full flex flex-col items-center space-y-3">
                            <input type="text" name="fullName" value="${userName}" required
                                   class="block w-full max-w-xs px-4 py-2 bg-gray-50 border border-gray-200 rounded-lg text-center text-xl font-display font-semibold focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                            <button type="submit" class="text-xs font-semibold text-white bg-brand-primary px-4 py-1.5 rounded-full hover:bg-indigo-700 transition-colors">Save Name</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <h2 class="text-2xl font-display font-bold text-brand-dark mb-1"><c:out value="${userName}" /></h2>
                    </c:otherwise>
                </c:choose>

                <p class="text-gray-500 text-sm mt-1"><c:out value="${userEmail}" /></p>
            </div>

            <c:if test="${not empty successMessage}">
                <div class="bg-emerald-50 border border-emerald-200 text-emerald-600 px-4 py-3 rounded-xl mb-6 text-center text-sm font-medium">
                    <c:out value="${successMessage}" />
                </div>
            </c:if>

            <div class="space-y-4 bg-gray-50 p-6 rounded-xl border border-gray-100 mb-8">
                <div class="flex justify-between items-center">
                    <span class="text-sm font-medium text-gray-500">Member Since</span>
                    <span class="text-brand-dark text-sm font-semibold"><c:out value="${memberSince}" /></span>
                </div>
                <div class="border-t border-gray-200"></div>
                <div class="flex justify-between items-center">
                    <span class="text-sm font-medium text-gray-500">Tickets Booked</span>
                    <span class="text-brand-dark text-sm font-semibold">0</span>
                </div>
                <div class="border-t border-gray-200"></div>
                <div class="flex justify-between items-center">
                    <span class="text-sm font-medium text-gray-500">Account Status</span>
                    <span class="text-emerald-600 bg-emerald-50 px-2.5 py-0.5 rounded-full text-xs font-semibold">Active</span>
                </div>
            </div>

            <div class="flex flex-col sm:flex-row gap-3">
                <c:if test="${!editMode}">
                    <a href="/profile?edit=true" class="flex-1 text-center bg-white border border-gray-200 text-brand-dark font-medium py-3 rounded-xl hover:bg-gray-50 transition-colors">
                        Edit Profile
                    </a>
                </c:if>
                <form action="/delete-account" method="post" class="flex-1 m-0">
                    <button type="submit" class="w-full bg-white border border-red-200 text-red-600 font-medium py-3 rounded-xl hover:bg-red-50 transition-colors" onclick="return confirm('Are you sure you want to delete your account? This action cannot be undone.');">
                        Delete Account
                    </button>
                </form>
            </div>
        </div>
    </main>

    <jsp:include page="shared/footer.jsp" />
</body>
</html>