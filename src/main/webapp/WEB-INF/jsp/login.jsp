<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign In - Eventxo</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-20 flex justify-center items-center">
        <div class="bg-white p-10 rounded-2xl shadow-xl shadow-gray-200 border border-gray-100 w-full max-w-md">
            <div class="text-center mb-8">
                <div class="w-12 h-12 bg-indigo-50 text-brand-primary rounded-xl flex items-center justify-center mx-auto mb-4">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"></path></svg>
                </div>
                <h2 class="text-2xl font-display font-bold text-brand-dark">Welcome Back</h2>
                <p class="text-gray-500 text-sm mt-2">Please sign in to your account</p>
            </div>

            <c:if test="${not empty successMessage}">
                <div class="bg-emerald-50 border border-emerald-200 text-emerald-600 px-4 py-3 rounded-xl mb-6 text-center text-sm font-medium">
                    <c:out value="${successMessage}" />
                </div>
            </c:if>

            <c:if test="${not empty errorMessage}">
                <div class="bg-red-50 border border-red-200 text-red-600 px-4 py-3 rounded-xl mb-6 text-center text-sm font-medium">
                    <c:out value="${errorMessage}" />
                </div>
            </c:if>

            <form action="/login" method="post" class="space-y-5">
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1.5">Email Address</label>
                    <input type="email" id="email" name="email" required
                           class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1.5">Password</label>
                    <input type="password" id="password" name="password" required
                           class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <button type="submit"
                        class="w-full bg-brand-primary text-white font-medium py-3.5 rounded-xl hover:bg-indigo-700 transition-colors mt-2 shadow-sm shadow-brand-primary/30">
                    Sign In
                </button>
            </form>
            <p class="mt-8 text-center text-sm text-gray-500">
                Don't have an account? <a href="/register" class="text-brand-primary font-semibold hover:underline">Sign up</a>
            </p>
        </div>
    </main>

    <jsp:include page="shared/footer.jsp" />
</body>
</html>