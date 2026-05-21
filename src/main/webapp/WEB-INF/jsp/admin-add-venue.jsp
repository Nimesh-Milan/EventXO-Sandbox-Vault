<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Venue - Eventxo Admin</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-20 flex justify-center items-center">
        <div class="bg-white p-10 rounded-2xl shadow-xl shadow-gray-200 border border-gray-100 w-full max-w-md">
            <div class="text-center mb-8">
                <div class="w-12 h-12 bg-emerald-50 text-brand-secondary rounded-xl flex items-center justify-center mx-auto mb-4">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
                </div>
                <h2 class="text-2xl font-display font-bold text-brand-dark">Add New Venue</h2>
                <p class="text-gray-500 text-sm mt-2">Configure a new campus space</p>
            </div>

            <form action="/admin/add-venue" method="post" class="space-y-5">
                <div>
                    <label for="locationName" class="block text-sm font-medium text-gray-700 mb-1.5">Location Name</label>
                    <input type="text" id="locationName" name="locationName" required placeholder="e.g. Main Auditorium"
                           class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div class="flex gap-4">
                    <div class="flex-1">
                        <label for="capacity" class="block text-sm font-medium text-gray-700 mb-1.5">Capacity</label>
                        <input type="number" id="capacity" name="capacity" min="1" required placeholder="e.g. 500"
                               class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                    </div>
                    <div class="flex-1">
                        <label for="pricePerHour" class="block text-sm font-medium text-gray-700 mb-1.5">Price / Hour ($)</label>
                        <input type="number" id="pricePerHour" name="pricePerHour" step="0.01" min="0" required placeholder="e.g. 50.00"
                               class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                    </div>
                </div>
                <div class="flex gap-3 pt-4">
                    <a href="/admin/manage-venues" class="w-1/3 flex items-center justify-center bg-white border border-gray-200 text-gray-700 font-medium py-3 rounded-xl hover:bg-gray-50 transition-colors shadow-sm">
                        Cancel
                    </a>
                    <button type="submit"
                            class="w-2/3 bg-brand-primary text-white font-medium py-3 rounded-xl hover:bg-indigo-700 transition-colors shadow-sm shadow-brand-primary/30">
                        Save Venue
                    </button>
                </div>
            </form>
        </div>
    </main>

    <jsp:include page="shared/footer.jsp" />
</body>
</html>