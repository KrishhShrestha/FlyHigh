<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Messages</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/admin/adminContactMessages.css" />
</head>
<body>
<jsp:include page="sidebar.jsp" />

<div class="admin-content" style="margin-left: 15vw; padding: 1rem;">
    <h2>Contact Messages</h2>

    <c:if test="${empty contacts}">
        <p>No messages found.</p>
    </c:if>

    <c:if test="${not empty contacts}">
        <table class="messages-table">
            <thead>
            <tr>
                <th>#</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Message</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="msg" items="${contacts}" varStatus="st">
                <tr>
                    <td>${st.index + 1}</td>
                    <td>${msg.firstname}</td>
                    <td>${msg.lastname}</td>
                    <td>${msg.email}</td>
                    <td>${msg.message}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

</body>
</html>
