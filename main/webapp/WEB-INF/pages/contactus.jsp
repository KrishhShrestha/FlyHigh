<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/contactus.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
      integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <script src="https://kit.fontawesome.com/385a42cb55.js"></script>
  </head>

  <body>
       <main>
      <div class="container">
        <div class="info">
          <p>Contact Us</p>
          <a href=""><i class="fa-solid fa-envelope"></i>flyhigh@gmail.com</a>
          <a href=""><i class="fa-solid fa-phone"></i>9818909069</a>
          <a href=""
            ><i class="fa-solid fa-location-dot"></i>Kamalpokhari,Kathmandu</a
          >
        </div>
        <div class="msg">
          <form class="log" id="form">
            <div class="namefield">
              <div class="field">
                <label for="fname">First Name</label>
                <input type="text" name="fname" id="fname" />
              </div>
              <div class="field">
                <label for="lname">Last Name</label>
                <input type="text" name="lname" id="lname" />
              </div>
            </div>

            <label for="email">Email</label>
            <input type="email" name="email" id="email" />

            <label for="msg">Message</label>
            <textarea rows="4" cols="50" name="message" form="form">
			Enter text here</textarea
            >
            <div class="btn">
              <button>Send Message</button>
            </div>
          </form>
        </div>
      </div>
    </main>
  </body>
</html>