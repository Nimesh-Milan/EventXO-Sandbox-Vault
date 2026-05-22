<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Venue - Eventxo</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-20 flex justify-center items-center">
        <div class="bg-white p-10 rounded-2xl shadow-xl shadow-gray-200 border border-gray-100 w-full max-w-md">
            <div class="text-center mb-8">
                <div class="w-12 h-12 bg-indigo-50 text-brand-primary rounded-xl flex items-center justify-center mx-auto mb-4">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                </div>
                <h2 class="text-2xl font-display font-bold text-brand-dark">Reserve a Venue</h2>
                <p class="text-gray-500 text-sm mt-2">Book a campus space for your next event</p>
            </div>

            <form action="/book-venue" method="post" class="space-y-5">
                <div>
                    <label for="customerName" class="block text-sm font-medium text-gray-700 mb-1.5">Your Name</label>
                    <input type="text" id="customerName" name="customerName" required value="${sessionScope.loggedInUser}"
                           class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div>
                    <label for="venueName" class="block text-sm font-medium text-gray-700 mb-1.5">Venue Name</label>
                    <input type="text" id="venueName" name="venueName" required value="${param.venueName}"
                           class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div class="flex gap-4">
                    <div class="flex-1">
                        <label for="bookingDate" class="block text-sm font-medium text-gray-700 mb-1.5">Desired Date</label>
                        <input type="date" id="bookingDate" name="bookingDate" required
                               class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                    </div>
                    <div class="flex-1">
                        <label for="hours" class="block text-sm font-medium text-gray-700 mb-1.5">Hours Needed</label>
                        <input type="number" id="hours" name="hours" min="1" required value="1"
                               class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                    </div>
                </div>
                <button type="submit"
                        class="w-full bg-brand-primary text-white font-medium py-3.5 rounded-xl hover:bg-indigo-700 transition-colors mt-4 shadow-sm shadow-brand-primary/30 flex items-center justify-center gap-2">
                    Confirm Reservation
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>
                </button>
            </form>
        </div>
    </main>

    <jsp:include page="shared/footer.jsp" />
</body>
</html>