<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <div class="crudcontainer">
        <div class="heading">
          <p>Add New Category</p>
        </div>

        <form action="/add-category" method="post" class="category">
          <div
            class="subheading"
            style="flex-direction: column; align-items: flex-start; gap: 1.5rem"
          >
            <div class="form-group">
              <label for="categoryname">Name: </label>
              <input type="text" name="categoryname" placeholder="" required />
            </div>
            <div class="form-group">
              <label for="categorydescription">Description: </label>
              <input
                type="text"
                name="categorydescription"
                placeholder=""
                required
              />
            </div>
            <button class="addbtn" type="submit">
              <i class="fa-solid fa-plus"></i> Add Category
            </button>
          </div>
        </form>
      </div>
    </main>
</body>
</html>