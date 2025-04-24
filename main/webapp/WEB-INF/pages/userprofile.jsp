<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>UserProfile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/userprofile.css" />
    
</head>
<body>
<body>
    <div class="topbar"></div>
    <div class="container">
      <div class="sidebar">
        <h2>Overview</h2>
        <a href="">My orders</a>
        <a href="">Payment</a>
        <a href="">Address</a>
      </div>

      <div class="main-content">
        <h1>Welcome!!!</h1>

        <div class="card-container">
          <div class="profile-card">
            <img src="" alt="profile image" />
            <div class="profile-details">
              <h3>User</h3>
              <p>user@gmail.com</p>
              <p>Member since: Jan 2024</p>
              <a href="edit.html" class="btn">Edit Profile</a>
            </div>
          </div>

          <div class="credit">
            <p>My Available FlyHigh Credit</p>
            <h1>USD $0.00</h1>
            <p style="margin-top: 4rem">USD $0.00 available soon</p>
          </div>
        </div>

        <div class="orders">
          <h1>Your Recent Orders</h1>
          <p>No orders found.</p>
        </div>
      </div>
    </div>
  </body>
</body>
</html>