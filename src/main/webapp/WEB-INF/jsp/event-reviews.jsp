<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Event Reviews - Eventxo</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-16">
        <div class="text-center mb-16">
            <h1 class="text-4xl md:text-5xl font-display font-bold text-brand-dark mb-4">Hear From Our Guests</h1>
            <p class="text-gray-500 max-w-2xl mx-auto">Discover what students are saying about their recent campus experiences.</p>
        </div>

        <!-- Add Review Form -->
        <div class="bg-white p-6 md:p-8 rounded-2xl shadow-sm border border-gray-100 mb-12 max-w-4xl mx-auto">
            <div class="flex items-center gap-3 mb-6">
                <div class="w-10 h-10 rounded-lg bg-amber-50 text-brand-accent flex items-center justify-center">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z"></path></svg>
                </div>
                <h2 class="text-xl font-display font-bold text-brand-dark">Write a Review</h2>
            </div>

            <form action="/submit-review" method="post" class="grid grid-cols-1 md:grid-cols-4 gap-6 items-end">
                <div class="md:col-span-1">
                    <label for="customerName" class="block text-sm font-medium text-gray-700 mb-1.5">Your Name</label>
                    <input type="text" id="customerName" name="customerName" required value="${sessionScope.loggedInUser}"
                           class="block w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div class="md:col-span-1">
                    <label for="eventName" class="block text-sm font-medium text-gray-700 mb-1.5">Event Attended</label>
                    <input type="text" id="eventName" name="eventName" required placeholder="e.g. Tech Workshop"
                           class="block w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
                <div class="md:col-span-1">
                    <label for="rating" class="block text-sm font-medium text-gray-700 mb-1.5">Rating (1-5)</label>
                    <input type="number" id="rating" name="rating" min="1" max="5" required value="5"
                           class="block w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all text-center font-bold">
                </div>
                <div class="md:col-span-4">
                    <label for="comment" class="block text-sm font-medium text-gray-700 mb-1.5">Comments</label>
                    <textarea id="comment" name="comment" rows="2" required placeholder="Share your experience..."
                              class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all resize-none"></textarea>
                </div>
                <div class="md:col-span-4 flex justify-end">
                    <button type="submit"
                            class="bg-brand-primary text-white font-medium px-8 py-3 rounded-xl hover:bg-indigo-700 transition-colors shadow-sm shadow-brand-primary/30">
                        Submit Review
                    </button>
                </div>
            </form>
        </div>

        <c:choose>
            <c:when test="${empty reviews}">
                <div class="text-center bg-white p-12 rounded-2xl shadow-sm border border-gray-100 max-w-2xl mx-auto">
                    <p class="text-lg font-medium text-gray-600">No reviews yet. Be the first to share your experience!</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <c:forEach var="review" items="${reviews}">
                        <!-- Modern Review Card -->
                        <div class="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 relative overflow-hidden group hover:shadow-md transition-all flex flex-col">

                            <!-- Delete Button (Top Right) -->
                            <form action="/delete-review" method="post" class="absolute top-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity z-10 m-0">
                                <input type="hidden" name="reviewId" value="${review.reviewId}">
                                <button type="submit" onclick="return confirm('Remove this review?');"
                                        class="w-8 h-8 flex items-center justify-center rounded-full bg-red-50 text-red-500 hover:bg-red-100 transition-colors" title="Delete Review">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                                </button>
                            </form>

                            <!-- Update Form overlay -->
                            <div class="absolute inset-0 bg-white/95 backdrop-blur-sm z-20 flex flex-col justify-center p-6 opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none group-hover:pointer-events-auto border border-brand-primary/20 rounded-2xl">
                                <form action="/update-review" method="post" class="space-y-4">
                                    <input type="hidden" name="reviewId" value="${review.reviewId}">
                                    <div>
                                        <label class="block text-xs font-semibold text-gray-500 uppercase tracking-wider mb-1.5">Edit Rating</label>
                                        <input type="number" name="rating" value="${review.rating}" min="1" max="5"
                                               class="w-full bg-gray-50 border border-gray-200 text-brand-dark rounded-xl px-4 py-2 outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary text-center font-bold">
                                    </div>
                                    <div>
                                        <label class="block text-xs font-semibold text-gray-500 uppercase tracking-wider mb-1.5">Edit Comment</label>
                                        <textarea name="comment" rows="3"
                                                  class="w-full bg-gray-50 border border-gray-200 text-brand-dark rounded-xl px-4 py-2 outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary resize-none text-sm"><c:out value="${review.comment}" /></textarea>
                                    </div>
                                    <button type="submit" class="w-full bg-brand-primary text-white text-sm font-medium py-2.5 rounded-xl hover:bg-indigo-700 transition-colors">Save Changes</button>
                                </form>
                            </div>

                            <!-- Star Rating -->
                            <div class="flex items-center space-x-1 mb-6">
                                <c:forEach begin="1" end="5" var="i">
                                    <svg class="w-5 h-5 <c:choose><c:when test='${i <= review.rating}'>text-brand-accent fill-current</c:when><c:otherwise>text-gray-200 fill-current</c:otherwise></c:choose>" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 00.95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 00-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 00-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 00-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 00.951-.69l1.519-4.674z" />
                                    </svg>
                                </c:forEach>
                            </div>

                            <!-- Review Comment -->
                            <blockquote class="text-gray-600 font-sans italic mb-8 leading-relaxed flex-grow relative z-0">
                                "<c:out value="${review.comment}" />"
                            </blockquote>

                            <!-- User & Event Info -->
                            <div class="border-t border-gray-100 pt-6 mt-auto flex justify-between items-center relative z-0">
                                <div class="flex items-center gap-3">
                                    <div class="w-10 h-10 rounded-full bg-brand-light flex items-center justify-center text-brand-primary font-bold text-sm">
                                        <c:out value="${fn:substring(review.customerName, 0, 1)}" />
                                    </div>
                                    <div>
                                        <p class="font-bold text-brand-dark text-sm"><c:out value="${review.customerName}" /></p>
                                        <p class="text-xs text-brand-primary font-medium mt-0.5"><c:out value="${review.eventName}" /></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </main>

    <jsp:include page="shared/footer.jsp" />
</body>
</html>