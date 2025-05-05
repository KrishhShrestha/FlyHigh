<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drone Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/droneManagement.css" />
    
</head>
<body>
	<jsp:include page="sidebar.jsp" />
	
	

    <div style='margin-left: 15vw' class='main'>
        <h1>Drones</h1>        
        
		<section class="section_wrapper cols-2">
		  <div class="start_col">
		    <input type="search" name="search" placeholder='Type here to search..' id="search">
		    <button class='btn btn-secondary'> search</button>
		  </div>
		  
		  <div class="end_col">
		  <a href="${pageContext.request.contextPath}/add-drone"><button class='btn btn-primary'>Add Drone</button></a>
		    
		  </div>
		  
		</section>
	        
      
        <!-- Search, filter and table section -->
        <div class="card">
            <table>
                <thead>
                    <tr>
                    	<th>ID</th>
                        <th>PRODUCT NAME</th>
                        <th>CATEGORY</th>
                        <th>PRICE</th>
                        <th class="hide-mobile">STOCK</th>
                        <th>VIEW</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="drone" items="${DroneData}">
                		<tr>
                			<td>${drone.id}</td>
                			<td>${drone.name}</td>
                			<td>${drone.category.name} </td>
                			<td>${drone.price}</td>
                			<td>${drone.quantity}</td>
                			<td>
                				 <a href="${pageContext.request.contextPath}/drone-details?id=${drone.id}">View</a>
                			</td>
                		</tr>
                	</c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <!-- Add Drone Modal using CSS-only approach with :target pseudo-class -->

</body>
</html>