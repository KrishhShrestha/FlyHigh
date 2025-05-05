<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drone Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/droneDetails.css" />
</head>
<body>
	<jsp:include page="sidebar.jsp" />
   
    <div style='margin-left: 15vw'>
        <h1 style='margin-bottom: 1rem;'>Drone Details</h1>

        <!-- Display error message if available -->
        <c:if test="${not empty errorMessage}">
            <div class='toast'>
                ${errorMessage}
            </div>
        </c:if>

        <!-- Product detail container -->
        <c:if test="${not empty drone}">
            <div class="card">
                <div class="product-detail">
                    <!-- Product image section with placeholder -->
                    <div class="product-image">
                        <img src='${pageContext.request.contextPath}/product/${drone.imageUrl}' />
                    </div>

                    <!-- Product information section -->
                    <div class="product-info">
                        <!-- Product name and description -->
                        <div class="product-name">${drone.name}</div>
                        <div class="product-description">${drone.description}</div>
                        
                        <!-- Product specifications -->
                        <div class="product-specs">
                            <!-- Price information -->
                            
                            <div class="spec-group">
                                <div class="spec-label">ID:</div>
                                <div class="spec-value">${drone.id}</div>
                            </div>
                            
                            <div class="spec-group">
                                <div class="spec-label">Price:</div>
                                <div class="spec-value">${drone.price}</div>
                            </div>
                            
                            <!-- Category information -->
                            <div class="spec-group">
                                <div class="spec-label">Category:</div>
                                <div class="spec-value">${drone.category.name}</div>
                            </div>
                            
                            <!-- Dimension information -->
                            <div class="spec-group">
                                <div class="spec-label">Dimension:</div>
                                <div class="spec-value">${drone.dimension}</div>
                            </div>
                            
                            <!-- Stock information -->
                            <div class="spec-group">
                                <div class="spec-label">Stock:</div>
                                <div class="spec-value">${drone.quantity}</div>
                            </div>
                            
                            <!-- Weight information -->
                            <div class="spec-group">
                                <div class="spec-label">Weight:</div>
                                <div class="spec-value">${drone.weight} g</div>
                            </div>
                            
                            <!-- Flight time information -->
                            <div class="spec-group">
                                <div class="spec-label">Flight Time:</div>
                                <div class="spec-value">${drone.flightTime} minutes</div>
                            </div>
                            
                            <!-- Range information -->
                            <div class="spec-group">
                                <div class="spec-label">Range:</div>
                                <div class="spec-value">${drone.range} km</div>
                            </div>
                            
                            <!-- Camera quality information -->
                            <div class="spec-group">
                                <div class="spec-label">Camera Quality:</div>
                                <div class="spec-value">${drone.cameraQuality}</div>
                            </div>
                        </div>
                    </div>
                    

                </div>
                
				<div style="display:flex; align-items:center; gap: 8px; margin-top: 1rem;">
						
									<form action="${pageContext.request.contextPath}/drone-details" method="post"
										style="display: inline;">
										<input type="hidden" name="droneId" value="${drone.id}">
										<input type="hidden" name="action" value="delete">
										<button class="btn btn-error" type="submit">Delete</button>
									</form>
									
					<button class="btn btn-secondary"> Edit </button>
				</div>
            </div>
        </c:if>
    </div>

</body>
</html>
