<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/home.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global/HeaderFooter.css" />
    
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="main-body">
		 <!-- Hero Banner Section -->
      <section class="hero-banner">
        <div class="banner-content">
          <h2>DJI MAVIC 3 PRO</h2>
          <p>THE FUTURE OF AERIAL IMAGING</p>
          <button class="buy-now">Buy Now</button>
        </div>
        <div class="banner-controls">
        <img src="mavic-drone.png" alt="DJI Mavic Drone" />
      </section>

      <!-- Trending Products Section -->
      <section class="trending-products">
        <h2>Trending Products</h2>
        <div class="product-grid">
          <!-- Product 1 -->
          <div class="product-card">
            <div class="product-image">
              <img src="mavic-3-pro.png" alt="DJI Mavic 3 Pro" />
            </div>
            <div class="product-details">
              <h3>DJI MAVIC 3 PRO</h3>
              <p>
                Professional drone with Hasselblad camera and 46-minute flight time
              </p>
              <div class="product-price">
                <span>Rs 175,000</span>
              </div>
              <button class="add-to-cart">Add to Cart</button>
            </div>
          </div>

          <!-- Product 2 -->
          <div class="product-card">
            <div class="product-image">
              <img src="drone-controller.png" alt="Smart Controller" />
            </div>
            <div class="product-details">
              <h3>SMART CONTROLLER PRO</h3>
              <p>Advanced remote controller with built-in screen and long range</p>
              <div class="product-price">
                <span>Rs 14,999</span>
              </div>
              <button class="add-to-cart">Add to Cart</button>
            </div>
          </div>

          <!-- Product 3 -->
          <div class="product-card">
            <div class="product-image">
              <img src="mini-drone.png" alt="Mini Drone" />
            </div>
            <div class="product-details">
              <h3>Mini Explorer Drone</h3>
              <p>Compact drone with 4K camera and 30-minute flight time</p>
              <div class="product-price">
                <span>Rs 8,500</span>
              </div>
              <button class="add-to-cart">Add to Cart</button>
            </div>
          </div>

          <!-- Product 4 -->
          <div class="product-card">
            <div class="product-image">
              <img src="drone-camera.png" alt="Drone Camera Module" />
            </div>
            <div class="product-details">
              <h3>Pro Camera Module</h3>
              <p>Interchangeable 4K camera module with gimbal stabilization</p>
              <div class="product-price">
                <span>Rs 52,599</span>
              </div>
              <button class="add-to-cart">Add to Cart</button>
            </div>
          </div>
        </div>
      </section>
	</div>
	
	<jsp:include page="footer.jsp" />
	
	<script src="https://kit.fontawesome.com/385a42cb55.js" crossorigin="anonymous" defer ></script>
</body>
</html>