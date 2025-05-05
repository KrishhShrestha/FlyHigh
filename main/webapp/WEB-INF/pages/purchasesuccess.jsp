<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Cart</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/purchasesuccess.css" />
    
    <script src="https://kit.fontawesome.com/385a42cb55.js"></script>
</head>
<body>

<main>
<jsp:include page="header.jsp" />
      <div class="container-x container">
            <div class="sign">
                <i class="fa-regular fa-circle-check fa-10x" style="color: #32960d;"></i>
            </div>
            <div class="msg">
                <h1>Your purchase was successful!</h1>
                <p>Thankyou for choosing us.</p>
                
            </div>
            <div class="butn">
            <a href="${pageContext.request.contextPath}/home" >
             <button>Return to Home Page</button>
            </a>
            </div>
        </div>
    </main>
    <jsp:include page="footer.jsp" />
</body>
</html>