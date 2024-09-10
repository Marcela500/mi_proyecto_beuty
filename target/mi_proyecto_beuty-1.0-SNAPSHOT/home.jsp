<%-- 
    Document   : home
    Created on : 25/07/2024, 4:58:37 p. m.
    Author     : lauma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beautè boutique</title>
    <style>
@import url('https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Poppins:wght@400;500;600;700;800&display=swap');

/* 
font-family: 'Oswald', sans-serif;
font-family: 'Poppins', sans-serif;
*/

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  text-decoration: none;
  list-style: none;
}

body {
  font-family: 'Poppins', sans-serif;
  background-color: #f2f2f2;
  color: #111111;
}

img {
  max-width: 100%;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.header {
  display: flex;
  align-items: center;
  min-height: 88vh;
  background-color: #F5F5F5;
  padding: 70px 20px;
  flex-direction: column;
}

.menu {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-color: #fff;
  padding: 10px 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  z-index: 1000;
}

.logo {
  font-size: 25px;
  color: #5E456B;
  text-transform: uppercase;
  font-weight: 800;
}

.menu .navbar ul {
  display: flex;
  align-items: center;
}

.menu .navbar ul li {
  margin: 0 10px; /* Ajusta el margen entre los elementos del menú */
}

.menu .navbar ul li a {
  font-size: 18px;
  padding: 10px 20px;
  color: #111111;
  display: block;
}

/* Estilos para los botones */
.btn {
  background-color: #5E456B;
  color: #FFFFFF;
  border-radius: 5px;
  padding: 10px 20px;
  text-transform: uppercase;
  font-weight: 600;
  transition: background-color 0.3s;
  cursor: pointer;
}

.btn:hover {
  background-color: #333333;
}

/* Estilo específico para el botón "Iniciar sesión" */
 .btn-login {
            background-color: #5E456B;
            color: #FFFFFF; /* Color de texto blanco */
            border-radius: 5px;
            padding: 10px 20px;
            text-transform: uppercase;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        .btn-login:hover {
            background-color: #333333;
            color: #FFFFFF;
}

#menu {
  display: none;
}

.menu-icono {
  width: 25px;
}

.menu label {
  cursor: pointer;
  display: none;
}

.submenu {
  position: relative;
}

.submenu #carrito {
  display: none;
}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex: 1;
  padding: 20px;
}

.header-img {
  flex-basis: 50%;
  text-align: center;
}

.header-txt {
  flex-basis: 50%;
  text-align: center;
}

.header-txt h1 {
  font-size: 60px;
  text-transform: uppercase;
  line-height: 1.2;
  color: #111111;
  font-family: 'Oswald', sans-serif;
  margin-bottom: 15px;
}

.header-txt p {
  font-size: 20px;
  text-transform: uppercase;
  margin-bottom: 20px;
}

.bn-1 {
  display: inline-block;
  padding: 11px 25px;
  background-color: #5E456B;
  color: #FFFFFF;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.bn-1:hover {
  background-color: #333333;
}

.ofert {
  padding: 20px 0;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}

.ofert-1 {
  display: flex;
  align-items: center;
  flex-basis: calc(33.3% - 15px);
  background-color: #F5F5F5;
  padding: 35px;
  margin-bottom: 30px;
}

.ofert-img {
  flex-basis: 50%;
  margin-right: 15px;
}

.ofert-img img {
  width: 250px;
}

.ofert-txt {
  flex-basis: 50%;
  text-align: center;
}

.ofert-txt h3 {
  color: #111111;
  font-family: 'Oswald', sans-serif;
  font-size: 25px;
  text-transform: uppercase;
  margin-bottom: 15px;
}

.btn-2 {
  display: inline-block;
  padding: 7px 10px;
  background-color: #5E456B;
  color: #FFFFFF;
  border-radius: 5px;
  font-size: 15px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.btn-2:hover {
  background-color: #333333;
}

.products {
  padding: 20px 20px; /* ajuste para mayor espacio entre la cabecera y los productos */
  text-align: center;
}

.products h2 {
  color: #111111;
  font-family: 'Oswald', sans-serif;
  font-size: 50px;
  text-transform: uppercase;
  margin-bottom: 50px;
}

.product-content {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); /* Ajuste para que los productos se distribuyan automáticamente en múltiples líneas */
  gap: 50px;
  justify-items: center; /* Centra los elementos en el contenedor */
}

.product {
  text-align: center;
  padding: 30px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.product img {
  width: 250px;
  height: 370px;
  margin-bottom: 20px;
}

.product h3 {
  font-size: 20px;
  color: #111111;
  font-family: 'Oswald', sans-serif;
  text-transform: uppercase;
  margin-bottom: 15px;
}

.product p, .precio {
  font-size: 16px;
  color: #111111;
  margin-bottom: 15px;
}

.precio {
  font-weight: 800;
}

.stars {
  color: #FFD700;
  font-size: 16px;
  margin-bottom: 15px;
}

.footer {
  padding: 50px 20px;
  background-color: #5E456B;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}

.link h3 {
  font-size: 18px;
  color: #FFFFFF;
  font-family: 'Oswald', sans-serif;
  text-transform: uppercase;
  margin-bottom: 20px;
}

.link a {
  font-size: 16px;
  color: #DCDCDC;
  display: block;
  margin-bottom: 10px;
}

@media (max-width: 991px) {
  .menu {
    padding: 20px;
  }

  .menu label {
    display: block;
  }

  .menu .navbar {
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    background-color: #181818;
    display: none;
    flex-direction: column;
  }

  .menu .navbar ul {
    flex-direction: column;
    align-items: flex-start;
  }

  .menu .navbar ul li {
    margin: 10px 0;
  }

  .menu .navbar ul li a {
    color: #FFFFFF;
  }

  #menu:checked ~ .navbar {
    display: flex;
  }

  .logo {
    display: none;
  }

  .header {
    min-height: 50vh;
  }

  .header-content {
    padding: 50px 20px;
    flex-direction: column;
  }

  .header-img {
    display: none;
  }

  .header-txt {
    flex-basis: 100%;
    text-align: center;
  }

  .header-txt h1 {
    font-size: 45px;
  }

  .header-txt p {
    font-size: 18px;
  }

  .ofert-1 {
    flex-basis: 100%;
  }

  .products {
    padding: 20px;
  }

  .product-content {
    grid-template-columns: 1fr;
    gap: 20px;
  }

  .footer-content {
    flex-direction: column;
  }
}
</style>
</head>
<body>
<!-- Menú -->
<div class="menu">
    <div class="logo">Beautè boutique</div>
    <input type="checkbox" id="menu">
    <label for="menu" class="menu-icono"><img src="images/menu.svg" alt="icono de menú" width="25"></label>
    <div class="navbar">
    <ul>
        <li><a href="index.jsp">Inicio</a></li>
        <li><a href="productos.jsp">Productos</a></li>
        <li><a href="contacto.jsp">Contacto</a></li>
        <li><a href="login.jsp" class="btn-login">Iniciar sesión</a></li>
    </ul>
</div>
</div>

<!-- Cabecera -->
<header class="header">
    <div class="header-content container">
        <div class="header-txt">
            <h1>Encuentra tu estilo perfecto</h1>
            <p>Explora nuestra colección de ropa para todas las ocasiones.</p>
            <a href="#productos" class="bn-1">Ver colección</a>
        </div>
    </div>
</header>

<!-- Ofertas -->
<section class="ofert container">
    <div class="ofert-1">
        <div class="ofert-img">
            <img src="images/oferta1.jpg" alt="Oferta 1">
        </div>
        <div class="ofert-txt">
            <h3>Descuentos en vestidos de verano</h3>
            <a href="#productos" class="btn-2">Comprar ahora</a>
        </div>
    </div>
    <div class="ofert-1">
        <div class="ofert-img">
            <img src="images/oferta2.jpg" alt="Oferta 2">
        </div>
        <div class="ofert-txt">
            <h3>Rebajas en chaquetas de invierno</h3>
            <a href="#productos" class="btn-2">Comprar ahora</a>
        </div>
    </div>
    <div class="ofert-1">
        <div class="ofert-img">
            <img src="images/oferta3.jpg" alt="Oferta 3">
        </div>
        <div class="ofert-txt">
            <h3>Promociones en ropa deportiva</h3>
            <a href="#productos" class="btn-2">Comprar ahora</a>
        </div>
    </div>
</section>

<!-- Productos -->
<section class="products container" id="productos">
    <h2>Nuestros Productos</h2>
    <div class="product-content">
        <div class="product">
            <img src="images/product1.jpg" alt="Producto 1">
            <h3>Vestido de Verano</h3>
            <p>Elegante y fresco</p>
            <div class="stars">
                ★★★★☆
            </div>
            <p class="precio">$49.99</p>
        </div>
        <div class="product">
            <img src="images/product2.jpg" alt="Producto 2">
            <h3>Chaqueta de Invierno</h3>
            <p>Cálida y cómoda</p>
            <div class="stars">
                ★★★★☆
            </div>
            <p class="precio">$89.99</p>
        </div>
        <div class="product">
            <img src="images/product3.jpg" alt="Producto 3">
            <h3>Conjunto Deportivo</h3>
            <p>Ideal para entrenar</p>
            <div class="stars">
                ★★★★☆
            </div>
            <p class="precio">$59.99</p>
        </div>
    </div>
</section>

<!-- Pie de página -->
<footer class="footer">
    <div class="footer-content container">
        <div class="link">
            <h3>Enlaces útiles</h3>
            <a href="politica_privacidad.jsp">Política de privacidad</a>
            <a href="terminos_uso.jsp">Términos de uso</a>
        </div>
        <div class="link">
            <h3>Información</h3>
            <a href="sobre_nosotros.jsp">Sobre Nosotros</a>
        </div>
        <div class="link">
            <h3>Soporte</h3>
            <a href="#">Envío y devoluciones</a>
        </div>
    </div>
</footer>
</body>
</html>
