<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login to your account</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />
</head>
<body>
<main class="main">
	<div class="container">
		<section class="wrapper">
			<div class="heading">
				<h1 class="text text-large">Registration form </h1>
			</div>
			<form name="signin" method="post" class="form">
				<div class="grid-wrapper">
				  <div class="input-control">
				    <label for="firstname" class="input-label" hidden>First Name</label>
				    <input type="text" name="firstname" id="firstname" class="input-field" placeholder="First Name">
				  </div>
				  <div class="input-control">
				    <label for="lastname" class="input-label" hidden>Last Name</label>
				    <input type="text" name="lastname" id="lastname" class="input-field" placeholder="Last Name">
				  </div>
				  <div class="input-control">
				    <label for="username" class="input-label" hidden>Username</label>
				    <input type="text" name="username" id="username" class="input-field" placeholder="Username">
				  </div>
				  <div class="input-control">
				    <label for="birthday" class="input-label" hidden>Birthday</label>
				    <input type="date" name="birthday" id="birthday" class="input-field" placeholder="Birthday">
				  </div>
				  
				  <div class="input-control">
				    <label for="gender" class="input-label" hidden>Gender</label>
				    <select name="gender" id="gender" class="input-field">
				      <option value="" disabled selected>Gender</option>
				      <option value="male">Male</option>
				      <option value="female">Female</option>
				      <option value="other">Other</option>
				    </select>
				  </div>
				  
				  <div class="input-control">
				    <label for="email" class="input-label" hidden>Email Address</label>
				    <input type="email" name="email" id="email" class="input-field" placeholder="Email Address">
				  </div>
				  <div class="input-control">
				    <label for="phone" class="input-label" hidden>Phone</label>
				    <input type="tel" name="phone" id="phone" class="input-field" placeholder="Phone Number">
				  </div>
				  <div class="input-control">
				    <label for="subject" class="input-label" hidden>Subject</label>
				    <input type="text" name="subject" id="subject" class="input-field" placeholder="Subject">
				  </div>
				  <div class="input-control">
				    <label for="password" class="input-label" hidden>Password</label>
				    <input type="password" name="password" id="password" class="input-field" placeholder="Password">
				  </div>
				  <div class="input-control">
				    <label for="confirm-password" class="input-label" hidden>Confirm Password</label>
				    <input type="password" name="confirm-password" id="confirm-password" class="input-field" placeholder="Confirm Password">
				  </div>
				</div>
				<div class="input-control">
					<input type="submit" name="submit" class="input-submit" value="Register">
				</div>
			</form>
		</section>
	</div>
</main>
</body>
</html>