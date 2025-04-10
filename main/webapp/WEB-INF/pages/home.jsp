<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global/HeaderFooter.css" />
    
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="main-body">
		This is our Home Page
	</div>
	
	<jsp:include page="footer.jsp" />
	
	<script src="https://kit.fontawesome.com/385a42cb55.js" crossorigin="anonymous" defer ></script>
</body>
</html>