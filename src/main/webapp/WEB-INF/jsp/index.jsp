<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Eventxo | Campus Experiences</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="shared/header.jsp" />
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">

<header class="relative bg-white overflow-hidden">
    <!-- Abstract Background Elements -->
    <div class="absolute top-0 right-0 -mr-20 -mt-20 w-96 h-96 rounded-full bg-blue-50 blur-3xl opacity-70 pointer-events-none"></div>
    <div class="absolute bottom-0 left-0 -ml-20 -mb-20 w-80 h-80 rounded-full bg-indigo-50 blur-3xl opacity-70 pointer-events-none"></div>

    <div class="container mx-auto px-6 py-20 md:py-32 relative z-10">
        <div class="max-w-4xl mx-auto text-center">
            <div class="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-blue-50 text-brand-primary text-xs font-semibold tracking-wide border border-blue-100 mb-8 mx-auto">
                <span class="relative flex h-2 w-2">
                  <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-brand-primary opacity-75"></span>
                  <span class="relative inline-flex rounded-full h-2 w-2 bg-brand-primary"></span>
                </span>
                Now live on campus
            </div>

            <h1 class="text-5xl md:text-7xl font-display font-extrabold tracking-tight text-brand-dark mb-6 leading-[1.1]">
                Your campus life,<br>
                <span class="bg-clip-text text-transparent bg-gradient-to-r from-brand-primary via-blue-500 to-teal-400">perfectly organized.</span>
            </h1>

            <p class="text-lg md:text-xl text-gray-500 max-w-2xl mx-auto leading-relaxed mb-10">
                Discover exclusive workshops, reserve study spaces, and seamlessly book tickets for the best university events all in one place.
            </p>

            <div class="flex flex-col sm:flex-row items-center justify-center gap-4">
                <a href="/events" class="w-full sm:w-auto px-8 py-4 bg-brand-dark text-white rounded-full font-medium hover:bg-black transition-all shadow-lg hover:shadow-xl transform hover:-translate-y-0.5">
                    Browse Events
                </a>
                <a href="/venues" class="w-full sm:w-auto px-8 py-4 bg-white text-brand-dark border border-gray-200 rounded-full font-medium hover:border-gray-300 hover:bg-gray-50 transition-all flex items-center justify-center gap-2">
                    Explore Venues
                    <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                </a>
            </div>

            <div class="mt-16 pt-8 border-t border-gray-100 flex flex-col md:flex-row items-center justify-center gap-8 opacity-60 grayscale hover:grayscale-0 transition-all duration-500">
                <p class="text-sm font-semibold text-gray-400 uppercase tracking-widest">Trusted by Student Unions</p>
                <div class="flex gap-8 items-center">
                    <!-- Placeholder logos -->
                    <div class="text-xl font-display font-bold text-gray-400">TechSoc</div>
                    <div class="text-xl font-display font-bold text-gray-400">Arts Council</div>
                    <div class="text-xl font-display font-bold text-gray-400">BusinessClub</div>
                </div>
            </div>
        </div>
    </div>
</header>

<section class="py-24 bg-brand-light relative">
    <div class="container mx-auto px-6">
        <div class="text-center max-w-2xl mx-auto mb-16">
            <h2 class="text-3xl md:text-4xl font-display font-bold text-brand-dark mb-4">Everything you need</h2>
            <p class="text-gray-500">A complete ecosystem designed specifically for the modern university experience.</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-white p-8 rounded-3xl shadow-sm border border-gray-100 hover:shadow-lg hover:border-blue-100 transition-all duration-300 group">
                <div class="w-14 h-14 bg-gradient-to-br from-blue-500 to-brand-primary text-white rounded-2xl flex items-center justify-center mb-6 shadow-md group-hover:scale-110 transition-transform">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 110 4v3a2 2 0 002 2h14a2 2 0 002-2v-3a2 2 0 110-4V7a2 2 0 00-2-2H5z"></path></svg>
                </div>
                <h3 class="text-xl font-display font-bold text-brand-dark mb-3">Instant Ticketing</h3>
                <p class="text-gray-500 text-sm leading-relaxed mb-6">Skip the lines. Reserve your seat for guest lectures and workshops in seconds with our queue system.</p>
                <a href="/events" class="text-brand-primary text-sm font-semibold hover:text-blue-800 flex items-center gap-1">Learn more <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg></a>
            </div>

            <div class="bg-white p-8 rounded-3xl shadow-sm border border-gray-100 hover:shadow-lg hover:border-teal-100 transition-all duration-300 group">
                <div class="w-14 h-14 bg-gradient-to-br from-teal-400 to-brand-secondary text-white rounded-2xl flex items-center justify-center mb-6 shadow-md group-hover:scale-110 transition-transform">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
                </div>
                <h3 class="text-xl font-display font-bold text-brand-dark mb-3">Venue Logistics</h3>
                <p class="text-gray-500 text-sm leading-relaxed mb-6">Need a space? Browse university halls, check capacities, and view hourly rates effortlessly.</p>
                <a href="/venues" class="text-brand-secondary text-sm font-semibold hover:text-teal-800 flex items-center gap-1">Browse spaces <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg></a>
            </div>

            <div class="bg-white p-8 rounded-3xl shadow-sm border border-gray-100 hover:shadow-lg hover:border-rose-100 transition-all duration-300 group">
                <div class="w-14 h-14 bg-gradient-to-br from-rose-400 to-brand-accent text-white rounded-2xl flex items-center justify-center mb-6 shadow-md group-hover:scale-110 transition-transform">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"></path></svg>
                </div>
                <h3 class="text-xl font-display font-bold text-brand-dark mb-3">Direct Support</h3>
                <p class="text-gray-500 text-sm leading-relaxed mb-6">Got questions? Our built-in support desk connects you directly with the administrative staff.</p>
                <a href="/support" class="text-brand-accent text-sm font-semibold hover:text-rose-800 flex items-center gap-1">Get help <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg></a>
            </div>
        </div>
    </div>
</section>

<jsp:include page="shared/footer.jsp" />
</body>
</html>