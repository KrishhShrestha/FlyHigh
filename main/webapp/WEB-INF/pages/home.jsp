<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/home.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global/HeaderFooter.css" />
    
</head>
<body>
	<jsp:include page="header.jsp" />
	
	 <main>



      <!-- Hero Banner Section -->
      <section class="hero-banner">
        <div class="banner-content">
          <h2>DJI MAVIC 3 PRO</h2>
          <p>THE FUTURE OF AERIAL IMAGING</p>
          <button class="buy-now">Buy Now</button>
        </div>
        <div class="banner-controls">
        <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="DJI Mavic Drone" />
      </section>

      <!-- Trending Products Section -->
      <section class="trending-products">
        <h2>Trending Products</h2>
        <div class="product-grid">
          <!-- Product 1 -->
          <div class="product-card">
            <div class="product-image">
              <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="DJI Mavic 3 Pro" />
            </div>
            <div class="product-details">
              <h3>DJI MAVIC 3 PRO</h3>
              <p>
                Professional drone with Hasselblad camera and 46-minute flight time
              </p>
              <div class="product-price">
                <span>Rs 175,000</span>
              </div>
              <button class="add-to-cart">Add to Cart</button>
            </div>
          </div>

          <!-- Product 2 -->
          <div class="product-card">
            <div class="product-image">
              <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="Smart Controller" />
            </div>
            <div class="product-details">
              <h3>SMART CONTROLLER PRO</h3>
              <p>Advanced remote controller with built-in screen and long range</p>
              <div class="product-price">
                <span>Rs 14,999</span>
              </div>
              <button class="add-to-cart">Add to Cart</button>
            </div>
          </div>

          <!-- Product 3 -->
          <div class="product-card">
            <div class="product-image">
              <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="Mini Drone" />
            </div>
            <div class="product-details">
              <h3>Mini Explorer Drone</h3>
              <p>Compact drone with 4K camera and 30-minute flight time</p>
              <div class="product-price">
                <span>Rs 8,500</span>
              </div>
              <button class="add-to-cart">Add to Cart</button>
            </div>
          </div>

          <!-- Product 4 -->
          <div class="product-card">
            <div class="product-image">
              <img src="https://images.unsplash.com/photo-1521405924368-64c5b84bec60?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZHJvbmVzfGVufDB8fDB8fHww" alt="Drone Camera Module" />
            </div>
            <div class="product-details">
              <h3>Pro Camera Module</h3>
              <p>Interchangeable 4K camera module with gimbal stabilization</p>
              <div class="product-price">
                <span>Rs 52,599</span>
              </div>
              <button class="add-to-cart">Add to Cart</button>
            </div>
          </div>
        </div>
      </section>

    

      <!-- Brand Logos -->
      <section class="brand-logos">
        <div class="logo-container">
          <img src="data:image/png;base64,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" alt="DJI" />
          <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMwAAADACAMAAAB/Pny7AAAAdVBMVEX////aJRzYAADaIhjaJCX/+/rrnZvZGw7tr63dRT/54+PaIBXZEQLvtLP66OfwsbDnionfYl3cLyjjcnL32trxvbvokI7dMy31ycjcQDr88fHbKiH10tHmg4HywsHgW1fke3jsqKbeTEfbOTLiambeU07plpWemxcSAAAEuUlEQVR4nO3ZD5OiLAAGcINDyn9ZaZlpqZXf/yO+qGimYNle987OPL+5m91JQh8QQdYwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB+F8Z+8NXK5NGP6/4ES5Ik8NSHrHPohu5SWK/Ff/ecxE8FQrOWKK/Yaw4uxUFW1zHJ7Wr2olBfbC2KBXn9a6g4p7v3S3OpShOUmxN5Yhdp2Lvw2Gk+vsSKbxu+/FIkQpPXlrLO5e76othN/mqNTima/mbmZ3fcuNHdcWwqLDqUk0P6uHKL1J/aJ2XHXpz6KFkbxp4sXiFpfQXBbkFsOlFsbxi23fwajU65Y+Yt38XLYHgguTqq2mxyG4XZKsNsPgiTrJyJJDLMQhvmxsziFrI8GXweF8osondI/rUw3kpz0jfDZLGZham1Ht72pfb8lHwrDPNflpsOExeBxUL/PPjY66oV3S6GDe0NHuJ/EIY+PJql91kVxiKKI0/qMFttGHHSNM2GN1nXlrZNxT9aPQjE8JefLeaGcZ9GAh38rHFx85rypNzWdQx18ukwSrI+++SX+1pZmuVd3tF2ODOMsSzNTnlvGoVfzJ6cdd+wr6WpUVbF5oZpO7zq1YdEPjR5NjfME9nrzn54QDbW4wmj1oZRzZoq7fB/npi8W3M2XvwkTDvMHX/4jXZmGg7gH4ZZcXmZT3Mpkze1fQy+GsaVaz6FD8LEpLmfSPa8MAiby6Cn/Jth+H2nZ80Oc27vskH5QPaYHDR/O0z7gOGOFjFnh8maWulwLedlzXXwTfyNMEf57J9QzXFXPivMqsnOi+FVLmWYVfJ/hdl3xd4MExzkkClZdjr0XA9NlZSavybMUk7OJAr5s3ZqJumvCZPJB7Md+JrqnY31zTC6pRml1ZiZFYZdmtLOzdtowvBj9L0wYjWotQi7SfC9MIkc/8S0Cs2Sj1brwm+FIamrVb21z+qZ/CSHTHi+6tavxGffC/NiOTMrTCon4mOw147IetDIMPzwl8Ks5oV5Z9Ucy+WkGDIuH2+PyHeDbdSFoTxRrKLirexf9+0w7ao5nV6btZOmry72VGVSyMKlmPKDAStv56B1tYST/XT6oyDfvUYNqA+TtW+EquoaPOm6fEHVRY7920/OMpQvVf3m3dt2ESuak7wN1a+4zYWNtrf0Ydy2caYezax7IdUUI/165bsML0bv0rWbfG7fg251M4Vkw60SfZh2sT5V3b7an5gs1g/j7eSQ2Sn3KQ2zaXPqVFn/vJqzbToapvowTL8l9AjDDDa92dMP0w6Z8VutPH7oDexIvVP4yMLLUZPowxjx5lXfVGGqR9TUpmevXpc3Lb9VDhlxLUc5pdb3T1gQ7VaKuN6FP35qT4QxrJ0z3Tp1mOru0d8SvTCiq+t1g1OMNmyljSywqq8zySghDldwCLmP9hYrPmnesxRhDC+/a6pryB0Wz1xpi/Xrje72SdiWur+sJMe6wMlsCsRRnm7uq5HjJXXV7RHdLpWd8gHDgnC/OY6raysN2mKuf9EU6Y1S5gVWRT38K9agAIs9zxrzdDVU5QXtCWJVbW2lr4t5//bvWwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/UfxIXYxL9y/5FAAAAAElFTkSuQmCC" alt="Autel" />
          <img src="data:image/jpeg;base64,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ZtfV6z0SZ6Sp0ldKu21D+kcxkJa+N+McTcjByAAQe4c++gEQeJp3UD726ZslluttMQB/T4AwPzn3SCc9XzXtoiDk9UatrrRPNS23S94uc7Ggslhh/MOJGccec+fJT1fNL64vl2qrpX6fuLqmqkL3ltM4AeA8AMAeAVYogwLa+v1loqOehqtI3Wrt08nSEMhIfG/GCRnkc4HLl1da2PTt/fexN0lmuttMQHKvgEfHnPu4JzjHzC9pEBfju9so7zbp7fcqdk9LOzhkjd2j+hHWCOYK/YiCedR7R6i01c2XTR8z6yOCQSQ8LgJ4iPDqd6dfcu4se7DYqZsOr7Jc7ZXMGHubSPMbz2kDrHlz81pyIMn1NufX3KkfQ6Esd0qauUcIq30jgyLPaB2nzwB49S5rRWy9wr6oV+snmGAu43UrZOKWY5yeNw90HtwSfJb6iD5U1PDS08dPTRMihiaGMjY3DWtHUAO5F9UQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQf//Z" alt="Parrot" />
          <img src="data:image/jpeg;base64,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" alt="Skydio" />
          <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMwAAADACAMAAAB/Pny7AAAAZlBMVEUAAAD///97e3tmZmZ2dnbU1NTa2tq6urovLy/7+/tISEjIyMjk5OSpqamNjY08PDwqKiohISFCQkLOzs4VFRVsbGwbGxs3NzdcXFyysrL09PRNTU3BwcEODg6UlJRhYWGDg4OcnJyQGnAsAAADjElEQVR4nO3YW5trMBiGYd2o0ppWdatm2v7/P7kkJITPdJh2Dtb13EeuhPAKSfA8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAACA/8DnL6qfHNsnuU2Vg9vWTBfO1Ha5eds7O8x14VkVTgVbtc9pLlVZc33BkbjT/aArr8JRm+/C7NKJsnYKj74uXKjttd5Mt84OmS7MT8XmRJAvVSO5VGWEX+p6r75ceVeVt4XQ8rdhNiu9k+8U7tO6sDzdyg1TJgzUNYdiGhXTi/uzZB9ef5ZsqirPQpbAvYy/CRMGOs2lN8uXekKrp6Jtfe/rtNXu2yxvCjMJL9+lyb4SdeqefrmroBuhX/wnWd4VZhLG6ogkXgh8ncW7rMXKD5XlKGRZR0+yvCpMcJiVbo/QpFFXnESCnc7iXaW6aHdsZrHtFq7PsshhPgeHieuh+2Hu5GPkbGFP+mzw6qjCuENztBgcJqkr7SA2H5ekzpI+e0laqjDlnFKJqsZGhrGv/VexvezOe2a32d2tWFblezPIpcP6pXg6zX1MjzaLaSweGcYLyuPVXHKYtGVmr/Y7Xq1CttXtnfjPX5K2rbmPeXW9kWks8MaGOdVhZp3Rzj7RK7c8m5XXE4zPUjwI5uhyorNZLt7oMLvxYRJzbxfnEVmK16ZKE+ZxHD/cfnlDGPuYtcKEhxdkKZ4KYUkYmHH1NWH8fGWYu1SFydKqPFeP1da8SIvR4/qpdZOaK7oqjHOxw8PcTxvj5Ibxz5udttEj0NlOMe4Zh6RpLfkCe8YqjO+OkoPDuN9LzTDt8fcFaXbOoi+vs5gJ7OI0PTiMNH/KYeqlf74XDvqRqDHqp40sdjaIj43CN/ZMkWZtno/R702dxv2qjEMhzVvDeFebZvSTZrp3cXLL7VLrUXf7K8OcujU2zWXZrfyZD33erHNe+4X1uFWL8fPgMPbQqoHEhllMnZqZ/mixT9ql8QkwaOb5yOQwZqnVMW7SVNY3rzNpmsvXLdi+aciGpOkN0/f1+4sw574wYVw2cRPSrAek6Q+TyH3zzjDij6YBa5z+MPVS9u/CiGnSH6+kH2Vr4vfhVvqj1/gJ6M6pUVmoPs663zM6jHpnhIud2MW6ug/SD5qf9k35q3QuDJWF5aH7r7T+PXu/OvNbor8h72pgWs4lB9WnN7Gqce+F37PTMR85AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKPwDaJE5BVIJACwAAAAASUVORK5CYII=" alt="Yuneec" />
        </div>
      </section>

      

      <script src="script.js"></script>
    </main>
	
	<jsp:include page="footer.jsp" />
	
	<script src="https://kit.fontawesome.com/385a42cb55.js" crossorigin="anonymous" defer ></script>
</body>
</html>