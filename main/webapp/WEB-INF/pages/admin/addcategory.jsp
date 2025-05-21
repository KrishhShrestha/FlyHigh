<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Category</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/category.css" />

<script src="https://kit.fontawesome.com/385a42cb55.js"></script>
</head>
<body>
<main>
	<jsp:include page="sidebar.jsp" />
	<c:if test="${not empty errorMessage}">
    <div class="toast error">
        <i class="fa-solid fa-xmark"></i> ${errorMessage}
    </div>
	</c:if>
      <div style='margin-left: 15vw; padding-inline: 2rem; padding-top: 2rem' class="">
        <div class="">
          <h1>Add New Category</h1>
        </div>

        <form action="${pageContext.request.contextPath}/addcategory" method="post" class="category">
          <div
            class="subheading"
            style="flex-direction: column; align-items: flex-start; gap: 1.5rem"
          >
            <div class="form-group">
              <label for="categoryname">Name: </label>
              <input type="text" name="categoryname" placeholder="" />
            </div>
            <div class="form-group">
              <label for="categorydescription">Description: </label>
              <input
                type="text"
                name="categorydescription"
                placeholder=""
               
              />
            </div>
            <button class="btn btn-primary" type="submit">
              <i class="fa-solid fa-plus"></i> Add Category
            </button>
          </div>
        </form>
      </div>
    </main>
</body>
</html>