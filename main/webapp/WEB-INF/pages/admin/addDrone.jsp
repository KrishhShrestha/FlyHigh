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
    <main class="add_drone_page_main">
      <section class="sidebar-sa">
        <a href="${pageContext.request.contextPath}/dashboard" class="logo_sidebar">
          <img src="${pageContext.request.contextPath}/images/logo-1.png" alt="Logo" />
        </a>

        <section>
          <ul>
            <li>
              <a href="${pageContext.request.contextPath}/dashboard"><i class="fa-solid fa-cube"></i> Dashboard</a>
            </li>
            <li>
              <a href=""> <i class="fa-solid fa-box"></i> Drones</a>
            </li>
            <li>
              <a href=""><i class="fa-solid fa-icons"></i> Categories</a>
            </li>
            <li>
              <a href=""><i class="fa-solid fa-user"></i> Users</a>
            </li>
          </ul>
        </section>

        <form action="${pageContext.request.contextPath}/logout" method="post"  class="bottom-bar">
          <button type='button' class="btn btn-secondary">
            <i class="fa-solid fa-user"></i> Profile
          </button>
          
          <button type='submit' class="btn btn-secondary">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
          </button>
        </form>
      </section>
      
      <main class="add-drone-page">
        <h2>Create a Drone</h2>
      
      	   <%
    		String error = (String) request.getAttribute("errorMessage");
    		if (error != null) {
			%>
    		<div class="toast error"> <i class="fa-solid fa-xmark"></i> <%= error %></div>
			<%
    		}
			%>
        <form action="${pageContext.request.contextPath}/drone_add" method="post" enctype="multipart/form-data" class="form-wrapper">
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
                  <option value="1">Photography</option>
                  <option value="2">Racing</option>
                  <option value="3">Toy</option>
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
