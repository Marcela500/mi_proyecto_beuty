<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beautè boutique</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Poppins:wght@400;500;600;700;800&display=swap');

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

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Menú */
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

        .menu .navbar {
            display: flex;
            align-items: center;
        }

        .menu .navbar ul {
            display: flex;
            align-items: center;
        }

        .menu .navbar ul li {
            margin: 0 10px;
        }

        .menu .navbar ul li a {
            font-size: 18px;
            padding: 10px 20px;
            color: #111111;
        }

        .btn-login {
            background-color: #5E456B;
            color: #FFFFFF;
            border-radius: 5px;
            padding: 10px 20px;
            text-transform: uppercase;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        .btn-login:hover {
            background-color: #333333;
        }

        /* Ocultar el checkbox y el ícono de menú en pantallas grandes */
        input[type="checkbox"] {
            display: none;
        }

        .menu-icono {
            display: none;
        }

        /* Mostrar el ícono de menú en pantallas pequeñas */
        @media (max-width: 768px) {
            .menu .navbar {
                display: none;
            }

            .menu-icono {
                display: block;
                cursor: pointer;
            }

            .menu .navbar ul {
                display: block;
                position: absolute;
                top: 60px;
                left: 0;
                right: 0;
                background-color: #fff;
                text-align: center;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .menu .navbar ul li {
                margin: 10px 0;
            }

            .menu .navbar ul li a {
                font-size: 18px;
                padding: 10px;
                display: block;
                width: 100%;
            }

            /* Cuando el checkbox esté seleccionado, mostrar el menú */
            input[type="checkbox"]:checked ~ .navbar {
                display: block;
            }
        }

        /* Cabecera */
        .header {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 88vh;
            background-color: #F5F5F5;
            padding: 70px 20px;
            position: relative;
        }

        .header-content {
            text-align: center;
            background-color: #FFFFFF;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin-top: -50px;
            z-index: 1;
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

        /* Pie de página */
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
    </style>
</head>

<body>
    <!-- Menú -->
    <div class="menu">
        <div class="logo">Beautè boutique</div>
        <input type="checkbox" id="menu-checkbox">
        <label for="menu-checkbox" class="menu-icono"><img src="images/menu.png" alt="menu icono" width="25"></label>
        <div class="navbar">
            <ul>
                <li><a href="index.jsp">Inicio</a></li>
                <li><a href="productos.jsp">Productos</a></li>
                <li><a href="contacto.jsp">Contacto</a></li>
                <li><a href="login.jsp" class="btn-login">Iniciar sesión</a></li>
                <li><a href="registro.jsp" class="btn-login">Regístrate</a></li>
            </ul>
        </div>
    </div>

    <!-- Cabecera -->
    <header class="header">
        <div class="header-content container">
            <div class="header-txt">
                <h1>Bienvenido a Beautè boutique</h1>
                <p>Explora nuestra colección de ropa para todas las ocasiones.</p>
                <a href="productos.jsp" class="bn-1">Ver colección</a>
            </div>
        </div>
    </header>

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
        </div>
    </footer>
</body>
</html>
