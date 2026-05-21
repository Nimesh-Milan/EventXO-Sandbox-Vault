<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="bg-white border-t border-gray-200 pt-16 pb-8 mt-auto w-full relative overflow-hidden">
    <!-- Decorative subtle background -->
    <div class="absolute inset-0 bg-gradient-to-b from-transparent to-slate-50/80 pointer-events-none"></div>

    <div class="container mx-auto px-6 relative z-10">
        <!-- Newsletter Signup Section -->
        <div class="bg-brand-dark rounded-3xl p-8 md:p-12 mb-16 flex flex-col md:flex-row items-center justify-between gap-8 shadow-2xl relative overflow-hidden">
            <div class="absolute top-0 right-0 -mr-20 -mt-20 w-64 h-64 bg-brand-primary rounded-full blur-3xl opacity-50"></div>
            <div class="absolute bottom-0 left-0 -ml-20 -mb-20 w-64 h-64 bg-brand-secondary rounded-full blur-3xl opacity-50"></div>

            <div class="relative z-10 md:w-1/2">
                <h3 class="text-2xl md:text-3xl font-display font-bold text-white mb-2">Never miss an event.</h3>
                <p class="text-gray-400">Subscribe to get notified about upcoming campus workshops, parties, and guest lectures.</p>
            </div>

            <div class="relative z-10 w-full md:w-1/2 max-w-md">
                <form class="flex items-center bg-white/10 p-1.5 rounded-full border border-white/20 backdrop-blur-md">
                    <input type="email" placeholder="Your student email..." class="flex-1 bg-transparent px-4 text-white placeholder-gray-300 outline-none text-sm">
                    <button type="button" class="bg-white text-brand-dark px-6 py-2.5 rounded-full text-sm font-bold hover:bg-gray-100 transition-colors">
                        Subscribe
                    </button>
                </form>
            </div>
        </div>

        <!-- Main Footer Links -->
        <div class="grid grid-cols-1 md:grid-cols-12 gap-8 lg:gap-12 mb-12">
            <!-- Brand Column -->
            <div class="md:col-span-4 lg:col-span-5">
                <div class="text-2xl font-display font-extrabold text-brand-dark tracking-tight flex items-center gap-2 mb-6">
                     <div class="w-10 h-10 rounded-xl bg-gradient-to-br from-brand-primary to-brand-secondary flex items-center justify-center text-white text-xl shadow-md">E</div>
                     <span class="bg-clip-text text-transparent bg-gradient-to-r from-brand-dark to-gray-600">ventxo</span>
                </div>
                <p class="text-gray-500 text-sm max-w-sm leading-relaxed mb-6">
                    Building the ultimate digital ecosystem for university campuses. We make discovering and managing campus experiences seamless, fast, and beautiful.
                </p>
                <div class="flex gap-4">
                    <a href="#" class="w-10 h-10 rounded-full bg-gray-100 flex items-center justify-center text-gray-600 hover:bg-blue-500 hover:text-white transition-all shadow-sm"><svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24"><path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"/></svg></a>
                    <a href="#" class="w-10 h-10 rounded-full bg-gray-100 flex items-center justify-center text-gray-600 hover:bg-blue-700 hover:text-white transition-all shadow-sm"><svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24"><path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm3 8h-1.35c-.538 0-.65.221-.65.778v1.222h2l-.209 2h-1.791v7h-3v-7h-2v-2h2v-2.308c0-1.769.931-2.692 3.029-2.692h1.971v3z"/></svg></a>
                    <a href="#" class="w-10 h-10 rounded-full bg-gray-100 flex items-center justify-center text-gray-600 hover:bg-pink-600 hover:text-white transition-all shadow-sm"><svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg></a>
                </div>
            </div>

            <!-- Link Columns -->
            <div class="md:col-span-2 lg:col-span-2">
                <h4 class="font-display font-bold text-brand-dark mb-4 text-sm uppercase tracking-wider">Platform</h4>
                <ul class="space-y-3 text-sm text-gray-500 font-medium">
                    <li><a href="/" class="hover:text-brand-primary transition-colors flex items-center gap-1 group"><span class="w-0 group-hover:w-2 transition-all overflow-hidden h-px bg-brand-primary inline-block"></span> Home</a></li>
                    <li><a href="/events" class="hover:text-brand-primary transition-colors flex items-center gap-1 group"><span class="w-0 group-hover:w-2 transition-all overflow-hidden h-px bg-brand-primary inline-block"></span> Browse Events</a></li>
                    <li><a href="/venues" class="hover:text-brand-primary transition-colors flex items-center gap-1 group"><span class="w-0 group-hover:w-2 transition-all overflow-hidden h-px bg-brand-primary inline-block"></span> Venues & Spaces</a></li>
                    <li><a href="/reviews" class="hover:text-brand-primary transition-colors flex items-center gap-1 group"><span class="w-0 group-hover:w-2 transition-all overflow-hidden h-px bg-brand-primary inline-block"></span> Student Reviews</a></li>
                </ul>
            </div>

            <div class="md:col-span-3 lg:col-span-2">
                <h4 class="font-display font-bold text-brand-dark mb-4 text-sm uppercase tracking-wider">Support</h4>
                <ul class="space-y-3 text-sm text-gray-500 font-medium">
                    <li><a href="/support" class="hover:text-brand-primary transition-colors flex items-center gap-1 group"><span class="w-0 group-hover:w-2 transition-all overflow-hidden h-px bg-brand-primary inline-block"></span> Help Center</a></li>
                    <li><a href="/support" class="hover:text-brand-primary transition-colors flex items-center gap-1 group"><span class="w-0 group-hover:w-2 transition-all overflow-hidden h-px bg-brand-primary inline-block"></span> Contact Us</a></li>
                    <li><a href="#" class="hover:text-brand-primary transition-colors flex items-center gap-1 group"><span class="w-0 group-hover:w-2 transition-all overflow-hidden h-px bg-brand-primary inline-block"></span> FAQ</a></li>
                </ul>
            </div>

            <div class="md:col-span-3 lg:col-span-3">
                <h4 class="font-display font-bold text-brand-dark mb-4 text-sm uppercase tracking-wider">Admin Portal</h4>
                <div class="bg-gray-50 border border-gray-200 p-4 rounded-2xl">
                    <p class="text-xs text-gray-500 mb-3">Secure access for university staff and event coordinators.</p>
                    <a href="/admin" class="flex items-center justify-center gap-2 w-full bg-white border border-gray-200 text-brand-dark text-sm font-semibold py-2 rounded-xl hover:border-brand-primary hover:text-brand-primary transition-colors shadow-sm">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8V7a4 4 0 00-8 0v4h8z"></path></svg>
                        Staff Login
                    </a>
                </div>
            </div>
        </div>

        <!-- Bottom Bar -->
        <div class="pt-8 border-t border-gray-200 flex flex-col md:flex-row justify-between items-center gap-4">
            <p class="text-sm text-gray-500 font-medium flex items-center gap-1">
                &copy; 2024 Eventxo. Crafted with <svg class="w-4 h-4 text-red-500" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"></path></svg> for students.
            </p>
            <div class="flex gap-6 text-xs text-gray-500 font-semibold">
                <a href="#" class="hover:text-brand-dark transition-colors">Privacy Policy</a>
                <a href="#" class="hover:text-brand-dark transition-colors">Terms of Service</a>
                <a href="#" class="hover:text-brand-dark transition-colors">Cookie Settings</a>
            </div>
        </div>
    </div>
</footer>