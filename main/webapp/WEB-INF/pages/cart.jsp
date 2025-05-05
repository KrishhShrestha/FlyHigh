<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Cart</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/cart.css" />
    
    <script src="https://kit.fontawesome.com/385a42cb55.js"></script>
</head>
<body>

<main>
<jsp:include page="header.jsp" />
      <div class="small-container">
        <div class="heading">
          <h1>My Cart</h1>
        </div>
        <table>
          <tr>
            <th>PRODUCT</th>
            <th>QUANTITY</th>
            <th>SUBTOTAL</th>
          </tr>
          <tr>
            <td>
              <div class="cart-info">
                <img src="${pageContext.request.contextPath}/images/drone.png" alt="" />
                <div>
                  <p style="font-weight: 550">DJI Mini 4 Pro</p>
                  <small>Price: $5000</small>
                  <br />
                  <a href="">Remove</a>
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
            <td>$5000</td>
          </tr>
          <tr>
            <td>
              <div class="cart-info">
                <img src="${pageContext.request.contextPath}/images/drone2.png" alt="" />
                <div>
                  <p style="font-weight: 550">DJI Mini 43 Pro</p>
                  <small>Price: $5000</small>
                  <br />
                  <a href="">Remove</a>
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
            <td>$5000</td>
          </tr>
          <tr>
            <td>
              <div class="cart-info">
                <img src="${pageContext.request.contextPath}/images/drone3.png" alt="" />
                <div>
                  <p style="font-weight: 550">DJI Neo</p>
                  <small>Price: $5000</small>
                  <br />
                  <a href="">Remove</a>
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
            <td>$5000</td>
          </tr>
        </table>

        <div class="total-price">
          <table>
            <tr>
              <td>Subtotal</td>
              <td>$10000</td>
            </tr>
            <tr>
              <td>Tax</td>
              <td>$40</td>
            </tr>
            <tr>
              <td>Total</td>
              <td>$10000</td>
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
      </div>
    </main>
    <jsp:include page="footer.jsp" />
</body>
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
      });

      minus.addEventListener("click", () => {
        if (count > 1) {
          count--;
          num.innerText = count;
        }
      });
    });
  </script>
</html>