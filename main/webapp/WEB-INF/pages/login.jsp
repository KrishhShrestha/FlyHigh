<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<h1 class="text text-large">Login </h1>
			</div>
			<form method="POST" name="signin" class="form">
				<div class="input-control">
					<label for="username" class="input-label" hidden>Email Address</label>
					<input type="email" name="email" id="email" class="input-field" placeholder="Email Address">
				</div>
				<div class="input-control">
					<label for="password" class="input-label" hidden>Password</label>
					<input type="password" name="password" id="password" class="input-field" placeholder="Password">
				</div>
				<div class="input-control">
					<input type="submit" name="submit" class="input-submit" value="Sign In"/>
				</div>
			</form>
		</section>
	</div>
</main>
</body>
</html>