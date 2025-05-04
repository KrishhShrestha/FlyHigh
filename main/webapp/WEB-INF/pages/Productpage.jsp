<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="css/pages/productpage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  </head>
<body>
<body>
<jsp:include page="header.jsp" />
	
	<div class="main-body">
		<div class="container">
        <h1 class="page-title">All Drones</h1>
        <p class="page-description">Explore our wide range of drones for photography, videography, racing, and surveillance. From beginner-friendly models to professional equipment for aerial cinematography.</p>
        
        <div class="filters">
            <div class="filter-box">
                <div class="filter-title">Category</div>
                <div class="filter-options">
                    <label class="filter-option">
                        <input type="checkbox"> Photography Drones
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Racing Drones
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Agricultural Drones
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Surveillance Drones
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Toy Drones
                    </label>
                </div>
            </div>
            
            <div class="filter-box">
                <div class="filter-title">Price</div>
                <div class="filter-options">
                    <label class="filter-option">
                        <input type="checkbox"> Under Rs.15,000
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Rs.15,000 - Rs.50,000
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Rs.50,000 - Rs.1,00,000
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Above Rs.1,00,000
                    </label>
                </div>
            </div>
            
            <div class="filter-box">
                <div class="filter-title">Brand</div>
                <div class="filter-options">
                    <label class="filter-option">
                        <input type="checkbox"> DJI
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Parrot
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Autel Robotics
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Yuneec
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Skydio
                    </label>
                </div>
            </div>
            
            <div class="filter-box">
                <div class="filter-title">Features</div>
                <div class="filter-options">
                    <label class="filter-option">
                        <input type="checkbox"> 4K Camera
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> GPS
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Obstacle Avoidance
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Follow Me Mode
                    </label>
                    <label class="filter-option">
                        <input type="checkbox"> Long Flight Time
                    </label>
                </div>
            </div>
        </div>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</body>
</html>