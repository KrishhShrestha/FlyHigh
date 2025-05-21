<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Category</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/category.css" />
<script src="https://kit.fontawesome.com/385a42cb55.js"></script>
</head>
<body>
<main >

    <!-- Display error message if available -->
    <c:if test="${not empty errorMessage}">
        <div class="toast error">
            <i class="fa-solid fa-xmark"></i> ${errorMessage}
        </div>
    </c:if>
    <jsp:include page="sidebar.jsp" />

    <div  style="margin-left:15vw;padding-inline: 2rem">
        <div class="heading">
            <p>Edit Category</p>
        </div>

        <form action="${pageContext.request.contextPath}/editcategory" method="post" class="category">
            <input type="hidden" name="categoryId" value="${category.id}" />

            <div class="subheading" style="flex-direction: column; align-items: flex-start; gap: 1rem">
                <div class="form-group">
                    <label for="categoryname">Name: </label>
                    <input type="text" name="category" value="${category.name}" />
                </div>
                <div class="form-group">
                    <label for="categorydescription">Description: </label>
                    <input type="text" name="description" value="${category.description}" />
                </div>

                <button class="editbtn" type="submit"
                    style="font-weight: 500; padding: 1rem 1rem; border-radius: 0.5rem; border: none;">
                    <i class="fa-solid fa-pen-to-square"></i> Update
                </button>
            </div>
        </form>
    </div>
</main>
</body>
</html>
