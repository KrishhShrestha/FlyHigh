<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>About</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/about.css" />
    
</head>
<body>
	<jsp:include page="header.jsp" />
	
	    <div class="box-wrapper">
      <div class="box-left">
        <h1 class="nochange">About FlyHigh</h1>
      </div>
      <div class="box">
        <div class="box-heading">
          <h1 style="color: rgb(160, 129, 64)">Simplifying the Drone Market</h1>
        </div>
        <div class="box-bottom">
          <p>
            FlyHigh simplifies the complex process of purchasing and choosing
            the perfect drone for your needs.
          </p>
        </div>
        <a href="product.html" class="btn">Start Your Drone Journey</a>
      </div>
    </div>

    <section class="section who">
      <div class="info-box">
        <h3>100+<br /><span>Drone Brands</span></h3>
      </div>
      <div class="info-box">
        <h3>20+<br /><span>Industries Served</span></h3>
      </div>
      <div class="who-description">
        <h2>Who <span class="highlight">We Are</span></h2>
        <p>
          At Fly High, we understand the challenges of selecting the right
          drone. As a premier drone marketplace, we’re committed to simplifying
          your drone buying journey with tailored recommendations, verified
          sellers, and transparent guidance.
        </p>
      </div>
    </section>

    <section class="section simplify">
      <h2>
        <span class="highlight"></span>
      </h2>
      <div class="simplify-content">
        <div class="text">
          <h3>After-Sales Support and Maintenance</h3>
          <p>
            We go beyond your purchase by offering support, training, and
            regular updates to ensure you get the best performance from your
            drone.
          </p>
        </div>
        <div class="image-box">
          <img src="${pageContext.request.contextPath}/images/pexels-pok-rie-33563-724921.jpg" alt="Drone Experience" />
        </div>
      </div>
    </section>

    <section class="team-section">
      <h2><span class="highlight">Meet Our Team</span></h2>
      <div class="team-container">
        <div class="team-card">
          <img src="${pageContext.request.contextPath}/images/krish.png" alt="krish" />
          <h3>Krish Shrestha</h3>
          <span>Creative Leader</span>
          <div class="social-icons">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-instagram"></i>
          </div>
        </div>

        <div class="team-card">
          <img src="${pageContext.request.contextPath}/images/nowal.png" alt="nowal" />
          <h3>Nowal Jung Baidwar</h3>
          <p></p>
          <span>Sales Manager</span>
          <div class="social-icons">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-instagram"></i>
          </div>
        </div>

        <div class="team-card">
          <img src="${pageContext.request.contextPath}/images/sayuj.png" alt="sayuj" />
          <h3>Sayuj Kuickel</h3>
          <span>Web Developer</span>
          <div class="social-icons">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-instagram"></i>
          </div>
        </div>

        <div class="team-card">
          <img src="${pageContext.request.contextPath}/images/abhijit.png" alt="abhijit" />
          <h3>Abhijit Mahato</h3>
          <p></p>
          <span>Web Designer</span>
          <div class="social-icons">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-instagram"></i>
          </div>
        </div>

        <div class="team-card">
          <img src="${pageContext.request.contextPath}/images/akrist.png" alt="aakrist" />
          <h3>Aakrist Rayamajhi</h3>
          <p></p>
          <span>UI/UX Designer</span>
          <div class="social-icons">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-instagram"></i>
          </div>
        </div>
      </div>
    </section>
	
	
	<jsp:include page="footer.jsp" />
	
	<script src="https://kit.fontawesome.com/385a42cb55.js" crossorigin="anonymous" defer ></script>
</body>
</html>