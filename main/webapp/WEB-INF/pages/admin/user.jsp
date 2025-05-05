<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/user.css" />
</head>
<body>

  
  
    <!-- Sidebar -->
    <div class="sidebar">
      <div class="sidebar-header">
        <h2>Admin Panel</h2>
        <p>Welcome Admin</p>
      </div>
      <ul class="nav-menu">
        <li class="nav-item"><i>📊</i> Dashboard</li>
        <li class="nav-item"><i>🗂️</i> Category</li>
        <li class="nav-item"><i>📦</i> Product</li>
        <li class="nav-item active"><i>👥</i> Users</li>
      </ul>
      
    </div>

    <!-- Main Content -->
    <div class="main-content">
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
            <tr>
              <td>001</td>
              <td>John Doe</td>
              <td><span class="status admin">Admin</span></td>
              <td>
                <button class="action-btn edit-btn">✏️</button>
                <button class="action-btn delete-btn">🗑️</button>
              </td>
            </tr>
            <tr>
              <td>002</td>
              <td>Jane Smith</td>
              <td><span class="status user">User</span></td>
              <td>
                <button class="action-btn edit-btn">✏️</button>
                <button class="action-btn delete-btn">🗑️</button>
              </td>
            </tr>
            <tr>
              <td>003</td>
              <td>Robert Johnson</td>
              <td><span class="status user">User</span></td>
              <td>
                <button class="action-btn edit-btn">✏️</button>
                <button class="action-btn delete-btn">🗑️</button>
              </td>
            </tr>
            <tr>
              <td>004</td>
              <td>Emily Brown</td>
              <td><span class="status admin">Admin</span></td>
              <td>
                <button class="action-btn edit-btn">✏️</button>
                <button class="action-btn delete-btn">🗑️</button>
              </td>
            </tr>
            <tr>
              <td>005</td>
              <td>Michael Wilson</td>
              <td><span class="status user">User</span></td>
              <td>
                <button class="action-btn edit-btn">✏️</button>
                <button class="action-btn delete-btn">🗑️</button>
              </td>
            </tr>
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
  
</body>
</html>