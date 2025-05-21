<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User Profile - FlyHigh</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/pages/edituserprofile.css" />
</head>
<body>
<jsp:include page="header.jsp" />
	<div class="edit-profile-container">
		<h2>Edit Your Profile</h2>
		<form class="edit-profile-form"
			action="${pageContext.request.contextPath}/edituserprofile"
			method="post" enctype="multipart/form-data">
			<div class="form-row">
				<div class="form-group">
					<label for="firstname">First Name</label> <input type="text"
						id="firstname" name="firstname" value="${user.firstname}"
						placeholder="Enter first name" required />
				</div>
				<div class="form-group">
					<label for="lastname">Last Name</label> <input type="text"
						id="lastname" name="lastname" value="${user.lastname}"
						placeholder="Enter last name" required />
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label for="phone">Phone</label> <input type="tel" id="phone"
						name="phone" value="${user.phone}"
						placeholder="Enter phone number" />
				</div>
				<div class="form-group">
					<label for="gender">Gender</label> <select id="gender"
						name="gender">
						<option value="Male" ${user.gender == 'Male'||user.gender == null ? 'selected' : ''}>Male</option>
						<option value="Female"
							${user.gender == 'Female' ? 'selected' : ''}>Female</option>
						<option value="Other" ${user.gender == 'Other' ? 'selected' : ''}>Other</option>
					</select>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label for="dob">Date of Birth</label> <input type="date" id="dob"
						name="dob" value="${user.dob}" />
				</div>
				<div class="form-group">
					<label for="email">Email</label> <input type="email" id="email"
						name="email" value="${user.email}"
						placeholder="Enter email address" required />
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label for="address">Address</label> <input type="text"
						id="address" name="address" value="${user.address}"
						placeholder="Enter address" />
				</div>
				<div class="form-group">
					<label for="profileImage">Profile Image</label> <input type="file"
						id="profileImage" name="profileImage" accept="image/*"
						onchange="previewImage(this)" />
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label for="password">New Password</label> <input type="password"
						id="password" name="password" placeholder="Enter new password" />
				</div>
				<div class="form-group">
					<label for="confirmPassword">Confirm Password</label> <input
						type="password" id="confirmPassword" name="confirmPassword"
						placeholder="Confirm new password" />
				</div>
			</div>

			<hr />
			<div class="form-actions">
				<button type="submit" class="btn primary">Update Profile</button>
			</div>
		</form>
	</div>

	<script>
		function previewImage(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					// Optionally show preview
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<jsp:include page="footer.jsp" />
</body>
</html>