<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drone Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/droneManagement.css" />
    
</head>
<body>
    <div class="container">
        <h1>Drones</h1>
        
        <!-- Action buttons section -->
        <div class="card">
            <div class="button-container">
                <a href="#" class="btn btn-delete">Delete</a>
                <a href="#addDroneModal" class="btn btn-add">Add Drone</a>
            </div>
        </div>
        
        <!-- Search, filter and table section -->
        <div class="card">
            <div class="search-container">
                <input type="text" class="search-input" placeholder="Search Drone">
                
                <!-- CSS-only filter implementation -->
                <input type="checkbox" id="filter-toggle">
                <label for="filter-toggle" class="filter-toggle-label">Show Filters</label>
                
                <div class="filter-controls">
                    <!-- Category filter -->
                    <div>
                        <h4>Category:</h4>
                        <input type="radio" name="category" id="cat-all" class="filter-option" checked>
                        <label for="cat-all" class="filter-label">All</label>
                        
                        <input type="radio" name="category" id="cat-commercial" class="filter-option">
                        <label for="cat-commercial" class="filter-label">Commercial</label>
                        
                        <input type="radio" name="category" id="cat-photography" class="filter-option">
                        <label for="cat-photography" class="filter-label">Photography</label>
                        
                        <input type="radio" name="category" id="cat-racing" class="filter-option">
                        <label for="cat-racing" class="filter-label">Racing</label>
                        
                        <input type="radio" name="category" id="cat-delivery" class="filter-option">
                        <label for="cat-delivery" class="filter-label">Delivery</label>
                    </div>
                    
                    <!-- Price filter -->
                    <div>
                        <h4>Price:</h4>
                        <input type="radio" name="price" id="price-all" class="filter-option" checked>
                        <label for="price-all" class="filter-label">All</label>
                        
                        <input type="radio" name="price" id="price-low" class="filter-option">
                        <label for="price-low" class="filter-label">Under $500</label>
                        
                        <input type="radio" name="price" id="price-mid" class="filter-option">
                        <label for="price-mid" class="filter-label">$500-$1000</label>
                        
                        <input type="radio" name="price" id="price-high" class="filter-option">
                        <label for="price-high" class="filter-label">Over $1000</label>
                    </div>
                </div>
            </div>
            
            <!-- Drone products table -->
            <table>
                <thead>
                    <tr>
                        <th><input type="checkbox" class="checkbox"></th>
                        <th>DRONE ID</th>
                        <th>PRODUCT NAME</th>
                        <th>CATEGORY</th>
                        <th>PRICE</th>
                        <th class="hide-mobile">STOCK</th>
                        <th>VIEW</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Hardcoded drone data -->
                    <tr>
                        <td><input type="checkbox" class="checkbox"></td>
                        <td>DRN-001</td>
                        <td class="product-name">
                            <div class="product-img">
                                <img src="https://m.media-amazon.com/images/I/61O6DFmupbL._AC_SL1500_.jpg" alt="DJI Mavic Air 2">
                            </div>
                            DJI Mavic Air 2
                        </td>
                        <td>Photography</td>
                        <td>$799.00</td>
                        <td class="hide-mobile">24</td>
                        <td><a href="drone-detail.html?id=DRN-001" class="view-icon">&#128065;</a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox"></td>
                        <td>DRN-002</td>
                        <td class="product-name">
                            <div class="product-img">
                                <img src="https://m.media-amazon.com/images/I/71ZBmgkzY0L._AC_SL1500_.jpg" alt="Parrot Anafi">
                            </div>
                            Parrot Anafi
                        </td>
                        <td>Commercial</td>
                        <td>$699.99</td>
                        <td class="hide-mobile">18</td>
                        <td><a href="drone-detail.html?id=DRN-002" class="view-icon">&#128065;</a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox"></td>
                        <td>DRN-003</td>
                        <td class="product-name">
                            <div class="product-img">
                                <img src="https://m.media-amazon.com/images/I/61iJd1-SyVL._AC_SL1500_.jpg" alt="Autel EVO II">
                            </div>
                            Autel EVO II
                        </td>
                        <td>Photography</td>
                        <td>$1,495.00</td>
                        <td class="hide-mobile">12</td>
                        <td><a href="drone-detail.html?id=DRN-003" class="view-icon">&#128065;</a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox"></td>
                        <td>DRN-004</td>
                        <td class="product-name">
                            <div class="product-img">
                                <img src="https://m.media-amazon.com/images/I/61RYoGzmCQL._AC_SL1500_.jpg" alt="Skydio 2">
                            </div>
                            Skydio 2
                        </td>
                        <td>Racing</td>
                        <td>$999.00</td>
                        <td class="hide-mobile">9</td>
                        <td><a href="drone-detail.html?id=DRN-004" class="view-icon">&#128065;</a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" class="checkbox"></td>
                        <td>DRN-005</td>
                        <td class="product-name">
                            <div class="product-img">
                                <img src="https://m.media-amazon.com/images/I/71+qAJKQCDL._AC_SL1500_.jpg" alt="Holy Stone HS720">
                            </div>
                            Holy Stone HS720
                        </td>
                        <td>Delivery</td>
                        <td>$299.99</td>
                        <td class="hide-mobile">32</td>
                        <td><a href="drone-detail.html?id=DRN-005" class="view-icon">&#128065;</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Add Drone Modal using CSS-only approach with :target pseudo-class -->
    <div id="addDroneModal" class="modal">
        <div class="modal-content">
            <a href="#" class="close">&times;</a>
            <h2>Add New Drone</h2>
            <form action="index.html" method="get">
                <!-- Basic drone information -->
                <div class="form-group">
                    <label for="droneId">Drone ID</label>
                    <input type="text" id="droneId" name="droneId" required>
                </div>
                <div class="form-group">
                    <label for="droneName">Product Name</label>
                    <input type="text" id="droneName" name="droneName" required>
                </div>
                <div class="form-group">
                    <label for="droneDescription">Description</label>
                    <textarea id="droneDescription" name="droneDescription" required></textarea>
                </div>
                <div class="form-group">
                    <label for="category">Category</label>
                    <select id="category" name="category" required>
                        <option value="">Select Category</option>
                        <option value="Commercial">Commercial</option>
                        <option value="Photography">Photography</option>
                        <option value="Racing">Racing</option>
                        <option value="Delivery">Delivery</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Price ($)</label>
                    <input type="number" id="price" name="price" min="0" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="stock">Stock</label>
                    <input type="number" id="stock" name="stock" min="0" required>
                </div>
                
                <!-- Additional drone specifications -->
                <div class="form-group">
                    <label for="dimension">Dimensions (L譝譎 inches)</label>
                    <input type="text" id="dimension" name="dimension" placeholder="e.g., 12󭅈">
                </div>
                <div class="form-group">
                    <label for="weight">Weight (g)</label>
                    <input type="number" id="weight" name="weight" min="0">
                </div>
                <div class="form-group">
                    <label for="range">Range (km)</label>
                    <input type="number" id="range" name="range" min="0" step="0.1">
                </div>
                <div class="form-group">
                    <label for="flightTime">Flight Time (minutes)</label>
                    <input type="number" id="flightTime" name="flightTime" min="0">
                </div>
                <div class="form-group">
                    <label for="cameraQuality">Camera Quality</label>
                    <input type="text" id="cameraQuality" name="cameraQuality" placeholder="e.g., 4K Ultra HD">
                </div>
                <div class="form-group">
                    <label for="droneImage">Drone Image URL</label>
                    <input type="url" id="droneImage" name="droneImage" placeholder="https://example.com/image.jpg">
                </div>
                
                <!-- Form action buttons -->
                <div class="form-actions">
                    <a href="#" class="btn btn-reset">Cancel</a>
                    <button type="submit" class="btn btn-add">Add Drone</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>