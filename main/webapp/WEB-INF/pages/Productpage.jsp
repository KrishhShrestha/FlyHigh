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
	<div class="product-grid">
            <!-- Product 1 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="XDJ-TT5 Plus Drone">
                </div>
                <div class="product-details">
                    <div class="product-category">Photography Drones</div>
                    <div class="product-name">XDJ-TT5 Plus</div>
                    <div class="product-specs">Flight Time: 35 min | Range: 10 km | Camera: 4K</div>
                    <div class="product-price">Rs. 75,000</div>
                    <div class="product-rating">
                        <span class="stars">★★★★★</span> (24)
                    </div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            
            <!-- Product 2 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="SMART Controller PRO Drone">
                </div>
                <div class="product-details">
                    <div class="product-category">Racing Drones</div>
                    <div class="product-name">SMART Controller PRO</div>
                    <div class="product-specs">Flight Time: 20 min | Max Speed: 120 km/h | Camera: 1080p</div>
                    <div class="product-price">Rs. 35,000</div>
                    <div class="product-rating">
                        <span class="stars">★★★★☆</span> (18)
                    </div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            
            <!-- Product 3 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="MIDI Explorer Series Drone">
                </div>
                <div class="product-details">
                    <div class="product-category">Surveillance Drones</div>
                    <div class="product-name">MIDI Explorer Series</div>
                    <div class="product-specs">Flight Time: 45 min | Range: 8 km | Thermal Camera</div>
                    <div class="product-price">Rs. 42,000</div>
                    <div class="product-rating">
                        <span class="stars">★★★★☆</span> (12)
                    </div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            
            <!-- Product 4 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="Pro X-Series Drone">
                </div>
                <div class="product-details">
                    <div class="product-category">Photography Drones</div>
                    <div class="product-name">Pro X-Series Mixdeck</div>
                    <div class="product-specs">Flight Time: 40 min | Range: 15 km | Camera: 8K</div>
                    <div class="product-price">Rs. 1,55,000</div>
                    <div class="product-rating">
                        <span class="stars">★★★★★</span> (32)
                    </div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            
            <!-- Product 5 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="Agricultural Drone">
                </div>
                <div class="product-details">
                    <div class="product-category">Agricultural Drones</div>
                    <div class="product-name">Agricultural Drone</div>
                    <div class="product-specs">Flight Time: 30 min | Payload: 10kg | Spray Width: 5m</div>
                    <div class="product-price">Rs. 75,000</div>
                    <div class="product-rating">
                        <span class="stars">★★★★☆</span> (45)
                    </div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            
            <!-- Product 6 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="Ultrabeats Drone">
                </div>
                <div class="product-details">
                    <div class="product-category">Racing Drones</div>
                    <div class="product-name">Ultrabeats Drone</div>
                    <div class="product-specs">Flight Time: 15 min | Max Speed: 150 km/h | FPV</div>
                    <div class="product-price">Rs. 28,000</div>
                    <div class="product-rating">
                        <span class="stars">★★★★★</span> (21)
                    </div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            
            <!-- Product 7 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="Amplitude Drone">
                </div>
                <div class="product-details">
                    <div class="product-category">Photography Drones</div>
                    <div class="product-name">Amplitude Drone</div>
                    <div class="product-specs">Flight Time: 25 min | Range: 7 km | Camera: 4K</div>
                    <div class="product-price">Rs. 62,000</div>
                    <div class="product-rating">
                        <span class="stars">★★★★☆</span> (14)
                    </div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            
            <!-- Product 8 -->
            <div class="product-card">
                <div class="product-image">
                    <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="Mass Surveillance Drone">
                </div>
                <div class="product-details">
                    <div class="product-category">Surveillance Drones</div>
                    <div class="product-name">Mass Surveillance Drone</div>
                    <div class="product-specs">Flight Time: 50 min | Range: 12 km | Night Vision</div>
                    <div class="product-price">Rs. 1,23,000</div>
                    <div class="product-rating">
                        <span class="stars">★★★★☆</span> (19)
                    </div>
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
        </div>

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
</body>
</body>
</html>