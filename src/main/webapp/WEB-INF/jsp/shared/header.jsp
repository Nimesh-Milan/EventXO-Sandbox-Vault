<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://cdn.tailwindcss.com"></script>
<script>
    tailwind.config = {
        theme: {
            extend: {
                colors: {
                    'brand-primary': '#2563eb',    // blue-600
                    'brand-secondary': '#8b5cf6',  // violet-500
                    'brand-accent': '#f43f5e',     // rose-500
                    'brand-light': '#f8fafc',      // slate-50
                    'brand-dark': '#0f172a'        // slate-900
                },
                fontFamily: {
                    'sans': ['Inter', 'sans-serif'],
                    'display': ['Outfit', 'sans-serif']
                },
                animation: {
                    'blob': 'blob 7s infinite',
                    'fade-in': 'fadeIn 0.5s ease-out'
                },
                keyframes: {
                    blob: {
                        '0%': { transform: 'translate(0px, 0px) scale(1)' },
                        '33%': { transform: 'translate(30px, -50px) scale(1.1)' },
                        '66%': { transform: 'translate(-20px, 20px) scale(0.9)' },
                        '100%': { transform: 'translate(0px, 0px) scale(1)' }
                    },
                    fadeIn: {
                        '0%': { opacity: '0', transform: 'translateY(10px)' },
                        '100%': { opacity: '1', transform: 'translateY(0)' }
                    }
                }
            }
        }
    }
</script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600&family=Outfit:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<!-- Announcement Bar -->
<div class="bg-gradient-to-r from-brand-primary to-brand-secondary px-4 py-2 text-center text-xs font-medium text-white tracking-wide">
    🎉 Welcome to the Spring 2026 Semester! <a href="/events" class="underline underline-offset-2 hover:text-blue-100">Check out the Welcome Week events.</a>
</div>

<nav class="sticky top-0 w-full z-50 px-6 py-4 bg-white/80 backdrop-blur-xl border-b border-gray-200/50 shadow-sm transition-all duration-300">
    <div class="container mx-auto flex justify-between items-center">
        <!-- Logo -->
        <div class="text-2xl font-display font-extrabold text-brand-dark tracking-tight">
            <a href="/" class="flex items-center gap-2 group">
                <div class="w-10 h-10 rounded-xl bg-gradient-to-br from-brand-primary to-brand-secondary flex items-center justify-center text-white text-xl shadow-lg group-hover:shadow-brand-primary/30 group-hover:scale-105 transition-all">E</div>
                <span class="bg-clip-text text-transparent bg-gradient-to-r from-brand-dark to-gray-600">ventxo</span>
            </a>
        </div>

        <!-- Global Search (Desktop) -->
        <div class="hidden lg:flex flex-1 max-w-md mx-8">
            <div class="relative w-full group">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <svg class="w-4 h-4 text-gray-400 group-focus-within:text-brand-primary transition-colors" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                </div>
                <input type="text" placeholder="Search events, venues, or categories..."
                       class="w-full pl-10 pr-4 py-2 bg-gray-100 border-transparent rounded-full text-sm focus:bg-white focus:border-brand-primary focus:ring-2 focus:ring-brand-primary/20 transition-all outline-none text-brand-dark placeholder-gray-400">
            </div>
        </div>

        <!-- Navigation Links -->
        <div class="hidden md:flex items-center space-x-1 font-medium text-sm">
            <a href="/events" class="px-4 py-2 rounded-full text-gray-600 hover:text-brand-primary hover:bg-blue-50 transition-all">Events</a>
            <a href="/venues" class="px-4 py-2 rounded-full text-gray-600 hover:text-brand-primary hover:bg-blue-50 transition-all">Venues</a>
            <a href="/reviews" class="px-4 py-2 rounded-full text-gray-600 hover:text-brand-primary hover:bg-blue-50 transition-all">Reviews</a>
            <a href="/support" class="px-4 py-2 rounded-full text-gray-600 hover:text-brand-primary hover:bg-blue-50 transition-all">Support</a>
        </div>

        <!-- User Actions -->
        <div class="flex items-center gap-2">
            <c:choose>
                <c:when test="${not empty sessionScope.loggedInUser}">
                    <!-- Notifications -->
                    <button class="relative p-2 text-gray-400 hover:text-brand-primary hover:bg-blue-50 rounded-full transition-colors hidden sm:block">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path></svg>
                        <span class="absolute top-1.5 right-1.5 w-2 h-2 bg-brand-accent rounded-full border-2 border-white"></span>
                    </button>

                    <!-- User Dropdown -->
                    <div class="relative group cursor-pointer inline-block ml-2">
                        <button class="flex items-center gap-2 pl-1 pr-3 py-1 rounded-full bg-white border border-gray-200 hover:border-brand-primary/30 hover:shadow-md transition-all text-brand-dark">
                            <div class="w-8 h-8 rounded-full bg-gradient-to-r from-brand-primary to-brand-secondary text-white flex items-center justify-center text-sm font-bold shadow-inner">
                                ${fn:substring(sessionScope.loggedInUser, 0, 1)}
                            </div>
                            <span class="text-sm font-semibold hidden sm:block"><c:out value="${sessionScope.loggedInUser}" /></span>
                            <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                        </button>

                        <!-- Dropdown Menu -->
                        <div class="absolute right-0 mt-3 w-64 bg-white border border-gray-100 shadow-2xl rounded-2xl opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 z-50 overflow-hidden transform origin-top-right scale-95 group-hover:scale-100">
                            <div class="px-4 py-4 bg-gradient-to-br from-gray-50 to-white border-b border-gray-100 flex items-center gap-3">
                                <div class="w-10 h-10 rounded-full bg-brand-primary text-white flex items-center justify-center text-lg font-bold shadow-inner">
                                    ${fn:substring(sessionScope.loggedInUser, 0, 1)}
                                </div>
                                <div>
                                    <p class="text-sm font-bold text-brand-dark"><c:out value="${sessionScope.loggedInUser}" /></p>
                                    <p class="text-xs text-gray-500">${sessionScope.isAdmin ? 'Admin Account' : 'Student Account'}</p>
                                </div>
                            </div>
                            <div class="p-2 space-y-1">
                                <c:choose>
                                    <c:when test="${sessionScope.isAdmin}">
                                        <a href="/admin/dashboard" class="flex items-center gap-3 px-3 py-2.5 text-sm text-gray-700 hover:bg-blue-50 hover:text-brand-primary rounded-xl transition-colors">
                                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path></svg>
                                            Dashboard
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/profile" class="flex items-center gap-3 px-3 py-2.5 text-sm text-gray-700 hover:bg-blue-50 hover:text-brand-primary rounded-xl transition-colors">
                                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                                            My Profile
                                        </a>
                                        <a href="/my-tickets" class="flex items-center justify-between px-3 py-2.5 text-sm text-gray-700 hover:bg-blue-50 hover:text-brand-primary rounded-xl transition-colors">
                                            <div class="flex items-center gap-3">
                                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 5v2m0 4v2m0 4v2M5 5a2 2 0 00-2 2v3a2 2 0 110 4v3a2 2 0 002 2h14a2 2 0 002-2v-3a2 2 0 110-4V7a2 2 0 00-2-2H5z"></path></svg>
                                                My Tickets
                                            </div>
                                            <span class="bg-brand-primary/10 text-brand-primary text-xs font-bold px-2 py-0.5 rounded-full">New</span>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="p-2 border-t border-gray-100">
                                <a href="/logout" class="flex items-center gap-3 px-3 py-2 text-sm text-red-600 hover:bg-red-50 rounded-xl transition-colors font-medium">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>
                                    Sign Out
                                </a>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="/login" class="text-sm font-medium text-gray-600 hover:text-brand-dark px-4 py-2 rounded-full hover:bg-gray-100 transition-colors hidden sm:block">Sign In</a>
                    <a href="/register" class="text-sm font-medium bg-brand-dark text-white px-5 py-2.5 rounded-full hover:bg-brand-primary transition-all shadow-md hover:shadow-lg transform hover:-translate-y-0.5 hidden sm:flex items-center gap-2">
                        Get Started
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                    </a>
                </c:otherwise>
            </c:choose>

            <!-- Mobile Menu Toggle -->
            <button id="mobile-menu-toggle" class="md:hidden ml-2 p-2 text-gray-600 hover:bg-gray-100 rounded-lg">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path></svg>
            </button>
        </div>
    </div>
    <!-- Mobile Menu -->
    <div id="mobile-menu" class="hidden md:hidden">
        <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
            <a href="/events" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50">Events</a>
            <a href="/venues" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50">Venues</a>
            <a href="/reviews" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50">Reviews</a>
            <a href="/support" class="block px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-gray-900 hover:bg-gray-50">Support</a>
        </div>
        <c:if test="${empty sessionScope.loggedInUser}">
            <div class="pt-4 pb-3 border-t border-gray-200">
                <div class="flex items-center px-5">
                    <a href="/login" class="w-full text-center text-sm font-medium text-gray-600 hover:text-brand-dark px-4 py-2 rounded-full hover:bg-gray-100 transition-colors">Sign In</a>
                </div>
                 <div class="mt-3 px-2 space-y-1">
                    <a href="/register" class="block w-full text-center text-sm font-medium bg-brand-dark text-white px-5 py-2.5 rounded-full hover:bg-brand-primary transition-all">Get Started</a>
                </div>
            </div>
        </c:if>
    </div>
</nav>

<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        const mobileMenuButton = document.getElementById('mobile-menu-toggle');
        const mobileMenu = document.getElementById('mobile-menu');

        if (mobileMenuButton && mobileMenu) {
            mobileMenuButton.addEventListener('click', () => {
                mobileMenu.classList.toggle('hidden');
            });
        }
    });
</script>