<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/user.css" />
</head>
<body>
    <jsp:include page="sidebar.jsp" />

    <!-- Main Content -->
    <div style="margin-left:15vw;padding-inline: 2rem" class="main-content">
      <h1 class="page-title">FlyHigh</h1>

      <div class="card">


        <table class="user-table">
          <thead>
            <tr>
              <th>User ID</th>
              <th>User Name</th>
              <th>Role</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="User" items="${UserData}">
              <tr>
                <td>${User.id}</td>
                <td>${User.firstname}</td>
                <td>${User.role}</td>
                <td>
                  <button class="action-btn edit-btn"
                      data-id="${User.id}"
                      data-name="${User.firstname}"
                      data-role="${User.role}" onclick="toggleRoleForm(${User.id})">📝 Change Role</button>
                  <a href="${pageContext.request.contextPath}/manage-user?action=delete&id=${User.id}"
                      onclick="return confirm('Are you sure you want to delete this user?');"
                      class="action-btn delete-btn">🗑️</a>

                  <!-- Role Update Form -->
                  <div class="role-update-form" id="roleForm-${User.id}" style="display: none;">
                    <form action="${pageContext.request.contextPath}/manage-user" method="POST">
                      <input type="hidden" name="action" value="updateRole">
                      <input type="hidden" name="id" value="${User.id}">
                      <select name="role">
                        <option value="admin" ${User.role == 'admin' ? 'selected' : ''}>Admin</option>
                        <option value="customer" ${User.role == 'customer' ? 'selected' : ''}>Customer</option>
                      </select>
                      <button type="submit" class="action-btn">Update Role</button>
                      <button type="button" class="action-btn" onclick="toggleRoleForm(${User.id})">Cancel</button>
                    </form>
                  </div>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

        <div class="pagination">
          <button>Previous</button>
          <button class="active">1</button>
          <button>2</button>
          <button>3</button>
          <button>Next</button>
        </div>
      </div>
    </div>

<script type="text/javascript">
  // Toggle visibility of the role update form
  function toggleRoleForm(userId) {
    var form = document.getElementById('roleForm-' + userId);
    if (form.style.display === 'none') {
      form.style.display = 'block';  // Show the form
    } else {
      form.style.display = 'none';   // Hide the form
    }
  }
</script>

</body>
</html>
