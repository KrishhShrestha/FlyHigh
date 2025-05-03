<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global/loginRegister.css" />
    
    <script src="https://kit.fontawesome.com/385a42cb55.js"></script>
  </head>

  <body>
    <main class="main">
      <section class="register-wrapper login-wrapper">
        <div class="image-container">
          <img src="${pageContext.request.contextPath}/images/login-register-image.jpg" alt="" />

          <div class="overlay"></div>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/login">

          <h3 class="title">Login to Fly High</h3>
          <section class="form-wrapper">
            <div class="input-div">
              <label for="email">Email</label>
              <input
                type="email"
                id="email"
                name="email"
                placeholder="ram.thapa@flyhigh.com.np"
              />
            </div>

            <div class="input-div">
              <label for="password">Password</label>
              <input
                type="password"
                id="password"
                placeholder="P@$sw0Rd!"
                name="password"
              />
            </div>
            
            <div>
            
			<%
    		String error = (String) request.getAttribute("errorMessage");
    		if (error != null) {
			%>
    		<div class="toast error"><i class="fa-solid fa-xmark"></i> <%= error %></div>
			<%
    		}
			%>
			
			
			<button class="submit-cta" type="submit">
              login <i class="fa-solid fa-right-to-bracket"></i>
            </button>
			</div>


          </section>

          <hr class="hr" />

          <p class="signup-text">
            Don't have an account?
            <a href="${contextPath}/register">Sign Up.</a>
          </p>
        </form>
      </section>
    </main>
  </body>
</html>
