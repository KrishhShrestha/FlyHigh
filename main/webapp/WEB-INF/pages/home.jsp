<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    </div>
  </section>

  <!-- Trending Products Section -->
  <section class="trending-products">
    <h2>Trending Products</h2>
    <c:if test="${not empty topDrones}">
      <div class="product-grid">
        <c:forEach items="${topDrones}" var="drone">
          <div class="product-card">
            <div class="product-image">
              <img src="${pageContext.request.contextPath}/product/${drone.imageUrl}" alt="${drone.name}" />
            </div>
            <div class="product-details">
              <h3>${drone.name}</h3>
              <p>${drone.description}</p>
              <div class="product-price">
                <span>Rs ${drone.price}</span>
              </div>
              <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="hidden" name="productId" value="${drone.id}" />
                <input type="hidden" name="action" value="add" />
                <button type="submit" class="btn btn-secondary">Add to Cart</button>
              </form>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:if>
    <c:if test="${empty topDrones}">
      <p>No trending drones found.</p>
    </c:if>
  </section>

  <!-- Brand Logos -->
  <section class="brand-logos">
    <div class="logo-container">
      <img src="dji-logo.png" alt="DJI" />
      <img src="autel-logo.png" alt="Autel" />
      <img src="parrot-logo.png" alt="Parrot" />
      <img src="skydio-logo.png" alt="Skydio" />
      <img src="yuneec-logo.png" alt="Yuneec" />
    </div>
  </section>

  <!-- New Arrivals -->
  <section class="new-arrivals">
    <h2>New Arrival</h2>
    <c:if test="${not empty trendingDrones}">
      <div class="arrival-grid">
        <c:forEach items="${trendingDrones}" var="drone">
          <div class="product-card">
            <div class="product-image">
              <img src="${pageContext.request.contextPath}/product/${drone.imageUrl}" alt="${drone.name}" />
            </div>
            <div class="product-details">
              <h3>${drone.name}</h3>
              <p>${drone.description}</p>
              <div class="product-price">
                <span>Rs ${drone.price}</span>
              </div>
              <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="hidden" name="productId" value="${drone.id}" />
                <input type="hidden" name="action" value="add" />
                <button type="submit" class="btn btn-secondary">Add to Cart</button>
              </form>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:if>
    <c:if test="${empty trendingDrones}">
      <p>No new arrivals found.</p>
    </c:if>
  </section>

  <!-- Service Features Section -->
  <section>
    <div class="service-container">
      <div class="service-item">
        <i class="fas fa-shipping-fast service-icon"></i>
        <h3 class="service-title">Free Shipping</h3>
        <p class="service-description">Free Shipping Within Kathmandu Valley</p>
      </div>
      <div class="service-item">
        <i class="fas fa-headset service-icon"></i>
        <h3 class="service-title">24/7 Service</h3>
        <p class="service-description">24/7 On Time Service</p>
      </div>
      <div class="service-item">
        <i class="fas fa-certificate service-icon"></i>
        <h3 class="service-title">Company Authorized</h3>
        <p class="service-description">100% Genuine Products</p>
      </div>
      <div class="service-item">
        <i class="fas fa-map-marked-alt service-icon"></i>
        <h3 class="service-title">All Over Nepal</h3>
        <p class="service-description">Delivery All Over Nepal</p>
      </div>
    </div>
  </section>

</div>

<jsp:include page="footer.jsp" />
<script src="https://kit.fontawesome.com/385a42cb55.js" crossorigin="anonymous" defer></script>
</body>
</html>
