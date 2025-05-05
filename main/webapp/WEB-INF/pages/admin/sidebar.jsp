 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global/sidebar.css" />
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
     <script src="https://kit.fontawesome.com/385a42cb55.js"></script>
     
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
              <a href="${pageContext.request.contextPath}/manage-drone"> <i class="fa-solid fa-box"></i> Drones</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/category"><i class="fa-solid fa-icons"></i> Categories</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/dashboard"><i class="fa-solid fa-user"></i> Users</a>
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