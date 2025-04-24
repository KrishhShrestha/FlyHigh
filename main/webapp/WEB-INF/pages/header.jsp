<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/global/HeaderFooter.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />



<%
	HttpSession userSession = request.getSession(false);
	String currentUser = (String) (userSession != null ? userSession.getAttribute("email") : null);

	pageContext.setAttribute("currentUser", currentUser);
%>


<header class="header">
  <div class="container">
    <ul class="header_ul">
      <li><a href="${contextPath}/home">Home</a></li>
      <li><a href="${contextPath}/drones">Drones</a></li>
      <li><a href="${contextPath}/about">About Us</a></li>
      <li><a href="${contextPath}/contact">Contact Us</a></li>
    </ul>
    <div class="header_logo_wrapper">
      <a href="${contextPath}/home">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="header_logo" />
      </a>
    </div>
    
    <ul class="header_ul cart_ul">
      <li><i class="fa-solid fa-magnifying-glass"></i> Search</li>
    
      <c:choose>
      	<c:when test="${empty currentUser}">
      		<li>
        		<a href="${contextPath}/login"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
      		</li>	
      	</c:when>
      	<c:otherwise>
      	  <li> <a href="${contextPath}/cart"> <i class="fa-solid fa-cart-shopping"></i> Cart</a> </li>
      	  <li> <a href="${contextPath}/profile"><i class="fa-solid fa-user"></i> Account</a> </li>
      
			<li>
			  <form action="${contextPath}/logout" method="post" style="display: inline;">
			    <button type="submit" >
			      <i class="fa-solid fa-right-to-bracket"></i> Logout
			    </button>
			  </form>
			</li>

      	</c:otherwise>
      </c:choose>
      

    
    </ul>
  </div>
</header>