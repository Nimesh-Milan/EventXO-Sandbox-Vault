<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Support Desk - Admin</title>
</head>
<body class="bg-lux-dark text-white font-sans min-h-screen flex flex-col">
    <jsp:include page="shared/header.jsp" />

    <main class="flex-grow container mx-auto px-4 py-16">
        <div class="text-center mb-12 border-b border-white/10 pb-6">
            <h1 class="text-4xl font-serif text-white shadow-sm tracking-wide">Support Desk</h1>
        </div>

        <c:choose>
            <c:when test="${empty inquiries}">
                <div class="text-center text-gray-400 mt-10 bg-lux-card p-10 rounded-lg shadow-xl border border-white/10 max-w-3xl mx-auto">
                    <p class="text-lg font-serif tracking-wide">No inquiries in the queue. You're all caught up!</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="overflow-x-auto shadow-2xl rounded-lg border border-white/10">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-black/80 border-b border-white/10">
                                <th class="py-5 px-6 text-xs font-medium text-gray-400 uppercase tracking-wider">Email</th>
                                <th class="py-5 px-6 text-xs font-medium text-gray-400 uppercase tracking-wider">Subject</th>
                                <th class="py-5 px-6 text-xs font-medium text-gray-400 uppercase tracking-wider w-1/3">Message</th>
                                <th class="py-5 px-6 text-xs font-medium text-gray-400 uppercase tracking-wider">Status</th>
                                <th class="py-5 px-6 text-xs font-medium text-gray-400 uppercase tracking-wider text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody class="bg-lux-card divide-y divide-white/5">
                            <c:forEach var="inquiry" items="${inquiries}">
                                <tr class="hover:bg-black/40 transition-colors duration-200 group">
                                    <td class="py-5 px-6 text-sm text-gray-400 tracking-wider whitespace-nowrap"><c:out value="${inquiry.studentEmail}" /></td>
                                    <td class="py-5 px-6 text-sm text-white font-medium tracking-wide"><c:out value="${inquiry.subject}" /></td>
                                    <td class="py-5 px-6 text-sm text-gray-400 tracking-wide truncate max-w-xs" title="${inquiry.message}">
                                        <c:out value="${inquiry.message}" />
                                    </td>
                                    <td class="py-5 px-6 text-sm">
                                        <c:choose>
                                            <c:when test="${inquiry.status == 'Pending'}">
                                                <span class="px-3 py-1 text-[10px] uppercase tracking-widest font-bold text-yellow-500 bg-yellow-900/30 rounded-none border border-yellow-700/50">
                                                    PENDING
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="px-3 py-1 text-[10px] uppercase tracking-widest font-bold text-green-500 bg-green-900/30 rounded-none border border-green-700/50">
                                                    RESOLVED
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="py-5 px-6 text-sm text-center flex justify-center space-x-3">
                                        <c:if test="${inquiry.status == 'Pending'}">
                                            <form action="/admin/resolve-inquiry" method="post">
                                                <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}">
                                                <button type="submit" class="text-xs uppercase tracking-widest font-bold text-lux-gold hover:text-black border border-lux-gold/50 hover:bg-lux-gold py-2 px-3 transition-all duration-200">
                                                    RESOLVE
                                                </button>
                                            </form>
                                        </c:if>
                                        <form action="/admin/delete-inquiry" method="post">
                                            <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}">
                                            <button type="submit" onclick="return confirm('Delete this inquiry permanently?');" class="text-xs uppercase tracking-widest font-bold text-red-500 hover:text-white border border-red-500/50 hover:bg-red-600/80 hover:border-red-600 py-2 px-3 transition-all duration-200">
                                                DELETE
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </main>

    <jsp:include page="shared/footer.jsp" />
</body>
</html>