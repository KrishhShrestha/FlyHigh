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
    <div class="main-content" style="margin-left:15vw;padding-inline: 2rem">
      <h1 class="page-title">FlyHigh</h1>

      <div class="card">
        <div class="card-header">
          <input type="text" class="search-bar" placeholder="Search users..." />
          <button class="add-btn"><i>➕</i> Add New User</button>
        </div>

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
		        <td>  <button class="action-btn edit-btn">✏️</button>
                <button class="action-btn delete-btn">🗑️</button> </td>
		    </tr>
		</c:forEach>
		               
             
            
            
            <!-- More rows... -->
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
    
    <!-- Edit User Overlay -->
    <div class="overlay" id="editOverlay">
      <div class="edit-form">
        <h2>Edit User</h2>
        <form id="userEditForm">
          <div class="form-group">
            <label for="userId">User ID</label>
            <input type="text" id="userId" name="userId" readonly>
          </div>
          <div class="form-group">
            <label for="userName">User Name</label>
            <input type="text" id="userName" name="userName" required>
          </div>
          <div class="form-group">
            <label for="userRole">Role</label>
            <select id="userRole" name="userRole" required>
              <option value="admin">Admin</option>
              <option value="user">User</option>
            </select>
          </div>
          <div class="form-actions">
            <button type="button" class="cancel-btn" id="cancelEdit">Cancel</button>
            <button type="submit" class="save-btn">Save Changes</button>
          </div>
        </form>
      </div>
    </div>

    <script>
      document.addEventListener('DOMContentLoaded', function() {
        // Get all edit buttons
        const editButtons = document.querySelectorAll('.edit-btn');
        const editOverlay = document.getElementById('editOverlay');
        const cancelEdit = document.getElementById('cancelEdit');
        const userEditForm = document.getElementById('userEditForm');
        
        // Show edit overlay when edit button is clicked
        editButtons.forEach(button => {
          button.addEventListener('click', function() {
            const userId = this.getAttribute('data-id');
            const userName = this.getAttribute('data-name');
            const userRole = this.getAttribute('data-role');
            
            // Populate the form with user data
            document.getElementById('userId').value = userId;
            document.getElementById('userName').value = userName;
            document.getElementById('userRole').value = userRole;
            
            // Show the overlay
            editOverlay.style.display = 'flex';
          });
        });
        
        // Hide overlay when cancel button is clicked
        cancelEdit.addEventListener('click', function() {
          editOverlay.style.display = 'none';
        });
        
        // Handle form submission
        userEditForm.addEventListener('submit', function(e) {
          e.preventDefault();
          
          // Get form values
          const userId = document.getElementById('userId').value;
          const userName = document.getElementById('userName').value;
          const userRole = document.getElementById('userRole').value;
          
          // Here you would typically send this data to the server via AJAX
          console.log('Updating user:', { userId, userName, userRole });
          
          // For demo purposes, we'll just update the table directly
          const row = document.querySelector(`.edit-btn[data-id="${userId}"]`).closest('tr');
          row.cells[1].textContent = userName;
          row.cells[2].innerHTML = `<span class="status ${userRole}">${userRole.charAt(0).toUpperCase() + userRole.slice(1)}</span>`;
          
          // Update the data attributes on the edit button
          const editBtn = row.querySelector('.edit-btn');
          editBtn.setAttribute('data-name', userName);
          editBtn.setAttribute('data-role', userRole);
          
          // Hide the overlay
          editOverlay.style.display = 'none';
          
          // Show success message (you could add this)
          alert('User updated successfully!');
        });
        
        // Close overlay when clicking outside the form
        editOverlay.addEventListener('click', function(e) {
          if (e.target === editOverlay) {
            editOverlay.style.display = 'none';
          }
        });
      });
    </script>
</body>
</html>