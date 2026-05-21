<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Support & Feedback - Eventxo</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-16 flex justify-center items-center">
        <div class="bg-white p-10 rounded-2xl shadow-xl shadow-gray-200 border border-gray-100 w-full max-w-2xl relative overflow-hidden">
            <!-- Decorative Accent -->
            <div class="absolute top-0 right-0 -mr-8 -mt-8 w-32 h-32 bg-brand-primary/5 rounded-full blur-2xl"></div>

            <div class="text-center mb-10 relative z-10">
                <div class="w-16 h-16 bg-amber-50 text-brand-accent rounded-2xl flex items-center justify-center mx-auto mb-6">
                    <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"></path></svg>
                </div>
                <h1 class="text-4xl font-display font-bold text-brand-dark mb-2">Support & Feedback</h1>
                <p class="text-gray-500 font-medium">We're here to help. Reach out to our campus admin team.</p>
            </div>

            <c:if test="${not empty successMessage}">
                <div class="bg-emerald-50 border border-emerald-200 text-emerald-600 px-4 py-3 rounded-xl mb-8 text-center text-sm font-medium flex items-center justify-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                    <c:out value="${successMessage}" />
                </div>
            </c:if>

            <form action="/submit-inquiry" method="post" class="space-y-6 relative z-10">
                <div>
                    <label for="studentEmail" class="block text-sm font-medium text-gray-700 mb-1.5">Email Address</label>
                    <input type="email" id="studentEmail" name="studentEmail" required
                           class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div>
                    <label for="subject" class="block text-sm font-medium text-gray-700 mb-1.5">Subject</label>
                    <input type="text" id="subject" name="subject" required
                           class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div>
                    <label for="message" class="block text-sm font-medium text-gray-700 mb-1.5">Message</label>
                    <textarea id="message" name="message" rows="5" required
                              class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all resize-none"></textarea>
                </div>
                <button type="submit"
                        class="w-full bg-brand-primary text-white font-medium py-3.5 rounded-xl hover:bg-indigo-700 transition-colors mt-2 shadow-sm shadow-brand-primary/30 flex items-center justify-center gap-2">
                    Send Message
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                </button>
            </form>
        </div>
    </main>

    <jsp:include page="shared/footer.jsp" />
</body>
</html>