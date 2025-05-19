
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Search</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/search.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/home.css" />

    <script src="https://kit.fontawesome.com/385a42cb55.js"></script>
  </head>
  <body>
  <jsp:include page="header.jsp" />
  
    <section class="section_main_search">
      <form action="${pageContext.request.contextPath}/search" method="POST">
        <div class="main_body_search">
          <h3>Search for Drones</h3>

          <div class="section">
            <input type="text" class="search_bar" name="search" placeholder="Search..." />
          </div>

          <div class="section">
            <h4 style="margin-bottom: 8px">Price</h4>

            <div class="range_wrapper">
              <input type="number" name="from" id="from" placeholder="1000" value="0" />
              <i class="fa-solid fa-minus"></i>
              <input type="number" name="to" id="to" placeholder="25000" value="100000" />
            </div>
          </div>
        </div>

        <button class="btn btn-primary">Search</button>
      </form>
    </section>
    
    <main style="margin-left: 20rem; padding: 1rem;">
    	<h2>Drones</h2>
    	
		<c:if test="${not empty drones}">
		<div class="product-grid">
	
<c:forEach items="${drones}" var="drone">
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
		
		<c:if test="${empty drones}">
		  <p>No drones found.</p>
		</c:if>

    	
    </main>
  </body>
</html>
