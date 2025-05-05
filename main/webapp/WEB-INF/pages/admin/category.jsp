<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/category.css" />
<script src="https://kit.fontawesome.com/385a42cb55.js"></script>
</head>
<body>
<main>
      <div class="container">
        <div class="heading">
          <p>Category</p>
        </div>
        <div class="category">
          <div class="subheading">
            <input
              type="text"
              name="search"
              id="search"
              placeholder="Search for categories"
            />

            <button class="addbtn">
              <i class="fa-solid fa-plus"></i> Add Category
            </button>
          </div>
          <div class="info">
            <table class="infotable">
              <tr>
                <th>Category Id</th>
                <th>Category Name</th>
                <th>Description</th>
                <th>Action</th>
              </tr>
              <c:forEach var="category" items="${CategoryData}">
                		<tr>
                			<td>${category.id}</td>
                			<td>${category.name}</td>
                			<td>${category.description} </td>
                			<td>
                  			<button class="editbtn">
                    		<i class="fa-solid fa-pen-to-square"></i>
                  			</button>
                  			<button class="delbtn">
                    		<i class="fa-solid fa-trash"></i>
                  			</button>
                			</td>
                		</tr>                		
                	</c:forEach>          
            </table>
          </div>
        </div>
      </div>
    </main>
</body>
</html>