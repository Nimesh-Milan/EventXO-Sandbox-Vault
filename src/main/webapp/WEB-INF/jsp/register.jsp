<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Eventxo</title>
</head>
<body class="bg-brand-light text-brand-dark font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-20 flex justify-center items-center">
        <div class="bg-white p-10 rounded-2xl shadow-xl shadow-gray-200 border border-gray-100 w-full max-w-md">
            <div class="text-center mb-8">
                <div class="w-12 h-12 bg-indigo-50 text-brand-primary rounded-xl flex items-center justify-center mx-auto mb-4">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                </div>
                <h2 class="text-2xl font-display font-bold text-brand-dark">Create an Account</h2>
                <p class="text-gray-500 text-sm mt-2">Join the campus community today</p>
            </div>

            <form action="/register" method="post" class="space-y-5">
                <div>
                    <label for="fullName" class="block text-sm font-medium text-gray-700 mb-1.5">Full Name</label>
                    <input type="text" id="fullName" name="fullName" required
                           class="block w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl text-brand-dark focus:outline-none focus:ring-2 focus:ring-brand-primary/20 focus:border-brand-primary transition-all">
                </div>
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
                        class="w-full bg-brand-primary text-white font-medium py-3.5 rounded-xl hover:bg-indigo-700 transition-colors mt-4 shadow-sm shadow-brand-primary/30">
                    Create Account
                </button>
            </form>
            <p class="mt-8 text-center text-sm text-gray-500">
                Already have an account? <a href="/login" class="text-brand-primary font-semibold hover:underline">Log in</a>
            </p>
        </div>
    </main>

    <jsp:include page="shared/footer.jsp" />
</body>
</html>