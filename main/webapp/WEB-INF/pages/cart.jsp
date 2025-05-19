<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Cart</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/cart.css" />
  <script src="https://kit.fontawesome.com/385a42cb55.js"></script>
</head>
<body>

<jsp:include page="header.jsp" />

<main>
  <div class="small-container">
    <div class="heading">
      <h1>My Cart</h1>
    </div>
    
        <c:if test="${not empty errorMessage}">
            <div class='toast error'>
                ${errorMessage}
            </div>
        </c:if>
        
    <c:if test="${empty cartItems}">
      <p>Your cart is empty.</p>
    </c:if>

    <c:if test="${not empty cartItems}">
      <table>
        <tr>
          <th>PRODUCT</th>
          <th>QUANTITY</th>
          <th>SUBTOTAL</th>
        </tr>

        <c:set var="totalPrice" value="0.0" />
        <c:forEach var="drone" items="${cartItems}">
          <c:set var="qty" value="${quantityMap[drone.id]}" />
          <tr>
            <td>
              <div class="cart-info">
                <img src="${pageContext.request.contextPath}/product/${drone.imageUrl}" alt="${drone.name}" style="width:100px;" />
                <div>
                  <p style="font-weight: 550">${drone.name}</p>
                  <small>Price: <fmt:formatNumber value="${drone.price}" type="currency" currencySymbol="$" /></small><br />
                  
              <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="hidden" name="action" value="remove" />
                <input type="hidden" name="productId" value="${drone.id}" />
                <button type="submit" class="btn btn-error">Remove</button>
              </form>
                </div>
              </div>
            </td>
            <td>
              <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="hidden" name="action" value="updateQuantity" />
                <input type="hidden" name="productId" value="${drone.id}" />
                <input type="number" name="quantity" value="${qty}" min="1" max="10" style="width: 80px;" />
                <button type="submit" class="update-btn">Update</button>
              </form>
            </td>
            <td>
              <fmt:formatNumber value="${drone.price * qty}" type="currency" currencySymbol="$" />
              <c:set var="totalPrice" value="${totalPrice + (drone.price * qty)}" />
            </td>
          </tr>
        </c:forEach>
      </table>

      <div class="total-price">
        <table>
          <tr>
            <td>Total</td>
            <td><fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="$" /></td>
          </tr>
          <tr>
            <td colspan="2">
              <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="hidden" name="action" value="checkout" />
                <button type="submit" class="paybtn">PROCEED TO PAY</button>
              </form>
            </td>
          </tr>
        </table>
      </div>
    </c:if>
  </div>
</main>

<jsp:include page="footer.jsp" />

</body>
</html>