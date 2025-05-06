<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Add Drone</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/addDrone.css" />
    <script src="https://kit.fontawesome.com/385a42cb55.js"></script>
</head>
<body>
    <jsp:include page="sidebar.jsp" />

    <main style="margin-left:15vw;padding-inline: 2rem">
        <h2 style="margin-bottom: 1rem;">Editing drone</h2>

        <!-- Display error message if available -->
        <c:if test="${not empty errorMessage}">
            <div class="toast error">
                <i class="fa-solid fa-xmark"></i> ${errorMessage}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/edit-drone" method="post" enctype="multipart/form-data" class="form-wrapper">
            <!-- Basic Information -->
            <section class="section-wrapper">
            <input type="number" id="drone_id" name="drone_id" hidden value="${drone.id}" />
            <input type="hidden" name="existingImageUrl" value="${drone.imageUrl}" />
            
            
                <h3>Basic Information</h3>
                <div class="form-section">
                    <div class="input-div">
                        <label for="drone_name">Name</label>
                        <input type="text" id="drone_name" name="drone_name" placeholder="DJI Mavic Air"
                            value="${drone.name}" />
                    </div>
                    <div class="input-div">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" placeholder="Compact and powerful drone...">${drone.description}</textarea>
                    </div>
                    <div class="input-div">
                        <label for="price">Price ($)</label>
                        <input type="number" id="price" name="price" placeholder="999.99"
                            value="${drone.price}" />
                    </div>
                    <div class="input-div">
                        <label for="category">Category</label>
                        <select id="category" name="category">
                            <option value="" disabled <c:if test="${empty drone.category}">selected</c:if>>Select a category</option>
                            <c:forEach items="${categoryList}" var="category">
                                <option value="${category.id}" <c:if test="${drone.category.id == category.id}">selected</c:if>>
                                    ${category.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </section>

            <!-- Detailed Specifications -->
            <section class="section-wrapper">
                <h3>Detailed Specification</h3>
                <div class="form-section">
                    <div class="input-div">
                        <label for="weight">Weight (g)</label>
                        <input type="number" id="weight" name="weight" placeholder="570"
                            value="${drone.weight}" />
                    </div>
                    <div class="input-div">
                        <label for="flight_time">Flight Time (min)</label>
                        <input type="number" id="flight_time" name="flight_time" placeholder="30"
                            value="${drone.flightTime}" />
                    </div>
                    <div class="input-div">
                        <label for="range">Range (m)</label>
                        <input type="number" id="range" name="range" placeholder="10000"
                            value="${drone.range}" />
                    </div>
                    <div class="input-div">
                        <label for="camera_quality">Camera Quality (MP)</label>
                        <input type="text" id="camera_quality" name="camera_quality" placeholder="12MP 4K"
                            value="${drone.cameraQuality}" />
                    </div>
                    <div class="input-div">
                        <label for="dimension">Dimension (LxWxH mm)</label>
                        <input type="text" id="dimension" name="dimension" placeholder="168x83x49"
                            value="${drone.dimension}" />
                    </div>
                </div>
            </section>

            <!-- Image Upload -->
            <section class="section-wrapper image-section">
                <h3>Drone Image</h3>
                <div class="form-section">
                    <div class="input-div">
                        <input type="file" id="image" name="image" accept="image/*" />
                    </div>
                </div>
                <p class="subtitle_text">Supported: .jpg images, max 2MB</p>
                <c:if test="${not empty drone.imageUrl}">
                    <p>Current Image: ${drone.imageUrl} <a href="${pageContext.request.contextPath}/product/${drone.imageUrl}" style="font-weight:500;" target="_blank">View</a></p> 
                </c:if>
            </section>

            <!-- Additional Information -->
            <section class="section-wrapper image-section">
                <h3>Additional Information</h3>
                <div class="form-section">
                    <div class="input-div">
                        <label for="quantity">Quantity/Stock</label>
                        <input type="number" id="quantity" name="quantity" placeholder="52"
                            value="${drone.quantity}" />
                    </div>
                </div>
            </section>

            <!-- Submit Section -->
            <section class="submit-section">
                <button type="reset" class="btn btn-delete">
                    <i class="fa-solid fa-trash"></i> Reset
                </button>
                <button type="submit" class="btn btn-primary">
                    <i class="fa-solid fa-plus"></i> Edit Drone
                </button>
            </section>
        </form>
    </main>
</body>
</html>
