<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Category</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/category.css" />
<script src="https://kit.fontawesome.com/385a42cb55.js"></script>
</head>
<body>
<main>
      <div class="crudcontainer">
        <div class="heading">
          <p>Edit Category</p>
        </div>

        <form action="/edit-category" method="post" class="category">
          <div
            class="subheading"
            style="flex-direction: column; align-items: flex-start; gap: 1rem"
          >
            <div class="form-group">
              <label for="categoryname">Name: </label>
              <input type="text" name="category" value="" required />
            </div>
            <div class="form-group">
              <label for="categoryname">Description: </label>
              <input type="text" name="description" value="" required />
            </div>

            <button
              class="editbtn"
              type="submit"
              style="
                font-weight: 500;
                padding: 1rem 1rem;
                border-radius: 0.5rem;
                border: none;
              "
            >
              <i class="fa-solid fa-pen-to-square"></i> Update
            </button>
          </div>
        </form>
      </div>
    </main>
</body>
</html>