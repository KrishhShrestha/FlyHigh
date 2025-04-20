<%@ page language="java" contentType="text/html; charset=UTF-8"  
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global/loginRegister.css" />

    <script src="https://kit.fontawesome.com/385a42cb55.js"></script>
  </head>

  <body>

    <main class="main">
      <section class="register-wrapper">
        <div class="image-container">
          <img src="${pageContext.request.contextPath}/images/login-register-image.jpg" alt="" />

          <div class="overlay"></div>
        </div>

       <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
          <h3 class="title">Register to Fly High</h3>
          <section class="form-wrapper">
            <div class="input-div">
              <label for="first_name">first name</label>
              <input
                type="text"
                id="first_name"
                placeholder="Ram"
                name="first_name"
              />
            </div>
            <div class="input-div">
              <label for="last_name">last name</label>
              <input
                type="text"
                id="last_name"
                placeholder="Thapa"
                name="last_name"
              />
            </div>
            <div class="input-div">
              <label for="phone">Phone</label>
              <input
                type="text"
                id="phone"
                name="phone"
                placeholder="+977 9860000011"
              />
            </div>
            <div class="input-div">
              <label for="gender">Gender</label>
              <select id="gender" name="gender">
                <option value="">Select Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
              </select>
            </div>
            <div class="input-div">
              <label for="dob">Date of Birth</label>
              <input type="date" id="dob" name="dob" />
            </div>
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
              <label for="address">Address</label>
              <input
                type="text"
                id="address"
                placeholder="kamalpokhari 123"
                name="address"
              />
            </div>
            <div class="input-div">
              <label for="image">Image</label>
              <input type="file" id="image" name="image" />
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
            <div class="input-div">
              <label for="confirm-password">Confirm Password</label>
              <input
                type="password"
                id="confirm-password"
                placeholder="P@$sw0Rd!"
                name="confirm-password"
              />
            </div>

            <button class="submit-cta" type="submit">
              Submit

              <i class="fa-solid fa-user-plus"></i>
            </button>
            <%
    		String error = (String) request.getAttribute("errorMessage");
    		if (error != null) {
			%>
    		<div style="color: red; margin-bottom: 10px;"><%= error %></div>
			<%
    		}
			%>
          </section>
          <hr class="hr" />
          <p class="signup-text">
            Already have an account? <a href="/">Sign in.</a>
          </p>
        </form>
      </section>
    </main>
  </body>
</html>