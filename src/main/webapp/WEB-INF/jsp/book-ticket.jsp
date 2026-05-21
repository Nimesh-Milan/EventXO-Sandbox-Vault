<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Ticket - Eventxo</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-20 flex justify-center items-center">
        <div class="bg-white p-10 rounded-2xl shadow-xl shadow-gray-200 border border-gray-100 w-full max-w-md">
            <div class="text-center mb-8">
                <div class="w-12 h-12 bg-indigo-50 text-brand-primary rounded-xl flex items-center justify-center mx-auto mb-4">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 110 4v3a2 2 0 002 2h14a2 2 0 002-2v-3a2 2 0 110-4V7a2 2 0 00-2-2H5z"></path></svg>
                </div>
                <h2 class="text-2xl font-display font-bold text-brand-dark">Reserve Your Ticket</h2>
                <p class="text-gray-500 text-sm mt-2">Secure your spot for the upcoming event</p>
            </div>

            <form action="/book-ticket" method="post" class="space-y-5">
                <div>
                    <label for="customerName" class="block text-sm font-medium text-gray-700 mb-1.5">Your Name</label>
                    <input type="text" id="customerName" name="customerName" required value="${sessionScope.loggedInUser}"
                           class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div>
                    <label for="eventName" class="block text-sm font-medium text-gray-700 mb-1.5">Event Name</label>
                    <input type="text" id="eventName" name="eventName" required value="${param.eventName}"
                           class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div>
                    <label for="quantity" class="block text-sm font-medium text-gray-700 mb-1.5">Quantity</label>
                    <div class="relative">
                        <input type="number" id="quantity" name="quantity" min="1" max="10" required value="1"
                               class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all pr-12">
                        <div class="absolute inset-y-0 right-0 pr-4 flex items-center pointer-events-none">
                            <span class="text-gray-400 text-sm font-medium">tickets</span>
                        </div>
                    </div>
                </div>
                <button type="submit"
                        class="w-full bg-brand-primary text-white font-medium py-3.5 rounded-xl hover:bg-indigo-700 transition-colors mt-4 shadow-sm shadow-brand-primary/30 flex items-center justify-center gap-2">
                    Confirm Booking
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>
                </button>
            </form>
        </div>
    </main>

    <jsp:include page="shared/footer.jsp" />
</body>
</html>