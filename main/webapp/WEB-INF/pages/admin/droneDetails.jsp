<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drone Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/droneDetails.css" />
</head>
<body>
    <!-- ===== START OF PRODUCT DETAIL PAGE ===== -->
    <div class="container fade-in">
        <h1>Drone Details</h1>
        
        <!-- Navigation and action buttons -->
        <div class="card">
            <a href="drone-management.html" class="btn btn-back">← Back to Drones</a>
            <a href="#editDroneModal" class="btn btn-edit">Edit Drone</a>
        </div>
        
        <!-- Product detail container -->
        <div class="card">
            <div class="product-detail">
                <!-- Product image section with placeholder -->
                <div class="product-image">
                    <div class="no-image-placeholder">D</div>
                </div>
                
                <!-- Product information section -->
                <div class="product-info">
                    <!-- Product name and description -->
                    <div class="product-name">DJI Mavic Air 2</div>
                    <div class="product-description">
                        The DJI Mavic Air 2 is a versatile drone designed for both beginners and professionals. With its modular design, users can customize various components to suit their specific needs. The drone features advanced stabilization technology and an intuitive control system.
                    </div>
                    
                    <!-- Product specifications -->
                    <div class="product-specs">
                        <!-- Price information -->
                        <div class="spec-group">
                            <div class="spec-label">Price:</div>
                            <div class="spec-value">$799</div>
                        </div>
                        
                        <!-- Category information -->
                        <div class="spec-group">
                            <div class="spec-label">Category:</div>
                            <div class="spec-value">Photography</div>
                        </div>
                        
                        <!-- Dimension information -->
                        <div class="spec-group">
                            <div class="spec-label">Dimension:</div>
                            <div class="spec-value">10.2×8.5×3.7 inches</div>
                        </div>
                        
                        <!-- Stock information -->
                        <div class="spec-group">
                            <div class="spec-label">Stock:</div>
                            <div class="spec-value">15</div>
                        </div>
                        
                        <!-- Weight information -->
                        <div class="spec-group">
                            <div class="spec-label">Weight:</div>
                            <div class="spec-value">650 g</div>
                        </div>
                        
                        <!-- Flight time information -->
                        <div class="spec-group">
                            <div class="spec-label">Flight Time:</div>
                            <div class="spec-value">28 minutes</div>
                        </div>
                        
                        <!-- Range information -->
                        <div class="spec-group">
                            <div class="spec-label">Range:</div>
                            <div class="spec-value">5.5 km</div>
                        </div>
                        
                        <!-- Camera quality information -->
                        <div class="spec-group">
                            <div class="spec-label">Camera Quality:</div>
                            <div class="spec-value">1080p HD</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ===== END OF PRODUCT DETAIL PAGE ===== -->

    <!-- ===== EDIT DRONE MODAL ===== -->
    <div id="editDroneModal" class="modal">
        <div class="modal-content">
            <a href="#" class="close">&times;</a>
            <h2>Edit Drone</h2>
            <form action="drone-detail-noimage.html" method="get">
                <!-- Basic drone information -->
                <div class="form-group">
                    <label for="droneId">Drone ID</label>
                    <input type="text" id="droneId" name="droneId" value="DRN-006" required>
                </div>
                <div class="form-group">
                    <label for="droneName">Product Name</label>
                    <input type="text" id="droneName" name="droneName" value="Custom Drone X1" required>
                </div>
                <div class="form-group">
                    <label for="droneDescription">Description</label>
                    <textarea id="droneDescription" name="droneDescription" required>The DJI Mavic Air 2 is a versatile drone designed for both beginners and professionals. With its modular design, users can customize various components to suit their specific needs. The drone features advanced stabilization technology and an intuitive control system.</textarea>
                </div>
                <div class="form-group">
                    <label for="category">Category</label>
                    <select id="category" name="category" required>
                        <option value="">Select Category</option>
                        <option value="">Select Category</option>
                        <option value="Commercial" selected>Commercial</option>
                        <option value="Photography">Photography</option>
                        <option value="Racing">Racing</option>
                        <option value="Delivery">Delivery</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Price ($)</label>
                    <input type="number" id="price" name="price" min="0" step="0.01" value="549.99" required>
                </div>
                <div class="form-group">
                    <label for="stock">Stock</label>
                    <input type="number" id="stock" name="stock" min="0" value="15" required>
                </div>
                
                <!-- Additional drone specifications -->
                <div class="form-group">
                    <label for="dimension">Dimensions (L×W×H inches)</label>
                    <input type="text" id="dimension" name="dimension" value="10.2×8.5×3.7" placeholder="e.g., 12×8×4">
                </div>
                <div class="form-group">
                    <label for="weight">Weight (g)</label>
                    <input type="number" id="weight" name="weight" min="0" value="650">
                </div>
                <div class="form-group">
                    <label for="range">Range (km)</label>
                    <input type="number" id="range" name="range" min="0" step="0.1" value="5.5">
                </div>
                <div class="form-group">
                    <label for="flightTime">Flight Time (minutes)</label>
                    <input type="number" id="flightTime" name="flightTime" min="0" value="28">
                </div>
                <div class="form-group">
                    <label for="cameraQuality">Camera Quality</label>
                    <input type="text" id="cameraQuality" name="cameraQuality" value="1080p HD" placeholder="e.g., 4K Ultra HD">
                </div>
                <div class="form-group">
                    <label for="droneImage">Drone Image URL</label>
                    <input type="url" id="droneImage" name="droneImage" value="" placeholder="https://example.com/image.jpg">
                </div>
                
                <!-- Form action buttons -->
                <div class="form-actions">
                    <a href="#" class="btn btn-back">Cancel</a>
                    <button type="submit" class="btn btn-edit">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>