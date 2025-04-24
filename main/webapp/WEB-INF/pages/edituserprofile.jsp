<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>EditUserProfile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/edituserprofile.css" />
    
</head>
<body>
<div class="edit-profile-container">
      <h2>Edit Your Profile</h2>
      <form class="edit-profile-form">
        <div class="form-row">
          <div class="form-group">
            <label>First Name</label>
            <input type="text" placeholder="Enter first name" />
          </div>
          <div class="form-group">
            <label>Last Name</label>
            <input type="text" placeholder="Enter last name" />
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label>Phone</label>
            <input type="tel" placeholder="Enter phone number" />
          </div>
          <div class="form-group">
            <label>Gender</label>
            <select>
              <option value="Male">Male</option>
              <option value="Female">Female</option>
              <option value="Other">Other</option>
            </select>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label>Date of Birth</label>
            <input type="date" />
          </div>
          <div class="form-group">
            <label>Email</label>
            <input type="email" placeholder="Enter email address" />
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label>Address</label>
            <input type="text" placeholder="Enter address" />
          </div>
          <div class="form-group">
            <label>Image</label>
            <input type="file" />
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label>Password</label>
            <input type="password" placeholder="Enter new password" />
          </div>
          <div class="form-group">
            <label>Confirm Password</label>
            <input type="password" placeholder="Confirm new password" />
          </div>
        </div>
        <hr />
        <div class="form-actions">
          <button type="submit">Update Profile</button>
        </div>
      </form>
    </div>
</body>
</html>