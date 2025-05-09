<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/global/HeaderFooter.css" />



    <footer class="footer">
      <div class="container">
        <div class="about_section">
          <a href="#">
            <img
              src="${pageContext.request.contextPath}/images/logo-1.png"
              class="footer_logo"
              alt="Footer Logo"
            />
          </a>
          <h4>Precision in the Sky, Power in Your Hands.</h4>

          <p>
            Unleash your potential with high-performance drones. For adventure,
            work, and everything in between.
          </p>
        </div>

        <div class="">
          <p class="footer_subtitle">QUICK LINKS</p>
          <ul class="footer_ul">
        	  <li><a href="${contextPath}/home">Home</a></li>
        	  <li><a href="${contextPath}/drones">Drones</a></li>
        	  <li><a href="${contextPath}/about">About Us</a></li>
        	  <li><a href="${contextPath}/contact">Contact Us</a></li>
          </ul>
        </div>

        <div class="">
          <p class="footer_subtitle">CONTACT US</p>

          <p>
            Feel Free to
            <a href="#">contact us</a>
            for any queries.
          </p>
        </div>
      </div>

      <p class="copyright">&copy; Fly High 2025</p>
    </footer>