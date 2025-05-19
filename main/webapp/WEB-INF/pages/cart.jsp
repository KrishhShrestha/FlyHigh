<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        <c:set var="totalPrice" value="0" />
        <c:forEach var="drone" items="${cartItems}">
          <tr>
            <td>
              <div class="cart-info">
                <img src="${pageContext.request.contextPath}/product/${drone.imageUrl}" alt="${drone.name}" style="width:100px;"/>
                <div>
                  <p style="font-weight: 550">${drone.name}</p>
                  <small>Price: $${drone.price}</small>
                  <br />
                  <a href="${pageContext.request.contextPath}/CartController?action=remove&productId=${drone.id}">Remove</a>
                </div>
              </div>
            </td>
            <td>
              <div class="wrapper">
                <span class="minus">-</span>
                <span class="num">1</span>
                <span class="plus">+</span>
              </div>
            </td>
            <td>
              $${drone.price}
              <c:set var="totalPrice" value="${totalPrice + drone.price}" />
            </td>
          </tr>
        </c:forEach>
      </table>

      <div class="total-price">
        <table>
          <tr>
            <td>Subtotal</td>
            <td>$${totalPrice}</td>
          </tr>
          <tr>
            <td>Tax (4%)</td>
            <td>$<c:out value="${(totalPrice * 0.04)}" /></td>
          </tr>
          <tr>
            <td>Total</td>
            <td>$<c:out value="${totalPrice + (totalPrice * 0.04)}" /></td>
          </tr>
          <tr>
            <td colspan="2">
              <a href="${pageContext.request.contextPath}/purchasesuccess">
                <button class="paybtn">PROCEED TO PAY</button>
              </a>
            </td>
          </tr>
        </table>
      </div>
    </c:if>
  </div>
</main>

<jsp:include page="footer.jsp" />

<script>
  const wrappers = document.querySelectorAll(".wrapper");
  wrappers.forEach((wrapper) => {
    const plus = wrapper.querySelector(".plus");
    const minus = wrapper.querySelector(".minus");
    const num = wrapper.querySelector(".num");

    let count = parseInt(num.innerText);

    plus.addEventListener("click", () => {
      count++;
      num.innerText = count;
      // TODO: Implement quantity update in session & recalc subtotal
    });

    minus.addEventListener("click", () => {
      if (count > 1) {
        count--;
        num.innerText = count;
        // TODO: Implement quantity update in session & recalc subtotal
      }
    });
  });
</script>

</body>
</html>
