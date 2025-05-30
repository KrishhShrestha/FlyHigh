<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Drone</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/addDrone.css" />
    
    <script src="https://kit.fontawesome.com/385a42cb55.js"></script>
  </head>
  <body>
    <main class="">
     <jsp:include page="sidebar.jsp" />
           
      <main  style="margin-left:15vw; padding-inline: 2rem" class="add-drone-page">
        <h2>Create a Drone</h2>
      
      	   <%
    		String error = (String) request.getAttribute("errorMessage");
    		if (error != null) {
			%>
    		<div class="toast error"> <i class="fa-solid fa-xmark"></i> <%= error %></div>
			<%
    		}
			%>
			
        <form action="${pageContext.request.contextPath}/add-drone" method="post" enctype="multipart/form-data" class="form-wrapper">
          <section class="section-wrapper">
            <h3>Basic Information</h3>
            <div class="form-section">
              <div class="input-div">
                <label for="drone_name">Name</label>
                <input
                  type="text"
                  id="drone_name"
                  name="drone_name"
                  placeholder="DJI Mavic Air"
                />
              </div>
              <div class="input-div">
                <label for="description">Description</label>
                <textarea
                  id="description"
                  name="description"
                  placeholder="Compact and powerful drone..."
                ></textarea>
              </div>
              <div class="input-div">
                <label for="price">Price ($)</label>
                <input
                  type="number"
                  id="price"
                  name="price"
                  placeholder="999.99"
                />
              </div>
              <div class="input-div">
                <label for="category">Category</label>
                <select id="category" name="category">
                   <option value="">Select a category</option>
	                <c:forEach items="${categoryList}" var="category">
		                  <option value="${category.id}">${category.name}</option>
	                   </c:forEach>
                </select>
              </div>
            </div>
          </section>

          <section class="section-wrapper">
            <h3>Detailed Specification</h3>
            <div class="form-section">
              <div class="input-div">
                <label for="weight">Weight (g)</label>
                <input
                  type="number"
                  id="weight"
                  name="weight"
                  placeholder="570"
                />
              </div>
              <div class="input-div">
                <label for="flight_time">Flight Time (min)</label>
                <input
                  type="number"
                  id="flight_time"
                  name="flight_time"
                  placeholder="30"
                />
              </div>
              <div class="input-div">
                <label for="range">Range (m)</label>
                <input
                  type="number"
                  id="range"
                  name="range"
                  placeholder="10000"
                />
              </div>
              <div class="input-div">
                <label for="camera_quality">Camera Quality (MP)</label>
                <input
                  type="text"
                  id="camera_quality"
                  name="camera_quality"
                  placeholder="12MP 4K"
                />
              </div>
              <div class="input-div">
                <label for="dimension">Dimension (LxWxH mm)</label>
                <input
                  type="text"
                  id="dimension"
                  name="dimension"
                  placeholder="168x83x49"
                />
              </div>
            </div>
          </section>

          <section class="section-wrapper image-section">
            <h3>Drone Image</h3>

            <div class="form-section">
              <div class="input-div">
                <input type="file" id="image" name="image" accept="image/*" />
              </div>
            </div>

            <p class="subtitle_text">Supported: .jpg images. max 2MB</p>
          </section>
          
          
          <section class="section-wrapper image-section">
            <h3>Additional Information</h3>

            <div class="form-section">
              <div class="input-div">
                <label for="quantity">Quantity/Stock</label>
                <input
                  type="number"
                  id="quantity"
                  name="quantity"
                  placeholder="52"
                />
              </div>
            </div>
          </section>
          
       

          <section class="submit-section">
            <button type="reset" class="btn btn-delete">
              <i class="fa-solid fa-trash"></i> Reset
            </button>

            <button type="submit" class="btn btn-primary">
              <i class="fa-solid fa-plus"></i> Add Drone
            </button>
          </section>
        </form>
      </main>
    </main>
  </body>
</html>
