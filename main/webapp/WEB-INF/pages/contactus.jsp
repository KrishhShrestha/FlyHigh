<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/contactus.css" />
    
    <script src="https://kit.fontawesome.com/385a42cb55.js"></script>
  </head>

  <body>
  		<jsp:include page="header.jsp" />
  	
       <main>
      <div class="contact_container container">
        <div class="info">
          <p>Contact Us</p>
          <a href=""><i class="fa-solid fa-envelope"></i>flyhigh@gmail.com</a>
          <a href=""><i class="fa-solid fa-phone"></i>9818909069</a>
          <a href=""
            ><i class="fa-solid fa-location-dot"></i>Kamalpokhari,Kathmandu</a
          >
        </div>
        
        <div class="msg">
          <form class="log" action="${pageContext.request.contextPath}/contact" method="post" >
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
            <textarea rows="4" cols="50" name="message" placeholder="Enter your message here..."></textarea>
			<div>
			  <%
			    String error = (String) request.getAttribute("errorMessage");
			    String success = (String) request.getAttribute("successMessage");
			    if (error != null) {
			  %>
			    <div class="toast error"><i class="fa-solid fa-xmark"></i> <%= error %></div>
			  <%
			    } else if (success != null) {
			  %>
			    <div class="toast success"><i class="fa-solid fa-check"></i> <%= success %></div>
			  <%
			    }
			  %>
            <div class="btn">
              <button>Send Message</button>
            </div>
            </div>
          </form>
        </div>
      </div>
      
      	<jsp:include page="footer.jsp" />
    </main>
  </body>
</html>