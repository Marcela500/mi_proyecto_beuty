<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .logo {
            display: block;
            margin: 0 auto 20px auto;
            width: 150px;
        }

        form {
            margin-top: 20px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        .input-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .remember-me label {
            margin-left: 5px;
            font-weight: normal;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .recuperarcontraseña-link {
            text-align: center;
            color: #007bff;
            text-decoration: none;
            display: block; 
            margin-top: 10px; 
        }

        .recuperarcontraseña-link:hover {
            text-decoration: underline;
        }

        .or {
            text-align: center;
            margin-bottom: 10px;
            color: #555;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .social-icons a {
            margin: 0 10px;
        }

        .social-icons img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            cursor: pointer;
        }

        .social-icons img:hover {
            opacity: 0.8;
        }

        .no-account {
            text-align: center;
            color: #000;
            margin-top: 20px; 
        }

        .register-link {
            text-align: center;
            color: #007bff;
            text-decoration: none;
            display: block; 
            margin-top: 10px; 
        }

        .register-link:hover {
            text-decoration: underline;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 16px;
            text-align: center;
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 16px;
            text-align: center;
        }

        @media (max-width: 600px) {
            .container {
                margin: 20px;
                padding: 15px;
            }

            h2 {
                font-size: 20px;
            }

            input[type="text"],
            input[type="password"] {
                padding: 8px;
            }

            button {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Logo de la empresa -->
        <img src="images/logo cuadrado.png" alt="Logo de la empresa" class="logo">

        <!-- Mensajes de error o éxito -->
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="error-message">
                <p><%= request.getAttribute("errorMessage") %></p>
            </div>
        <% } else if (request.getAttribute("successMessage") != null) { %>
            <div class="success-message">
                <p><%= request.getAttribute("successMessage") %></p>
            </div>
        <% } %>

        <form id="loginForm" action="/usuario/login" method="POST" onsubmit="showLoadingSpinner()">
            <h2>Iniciar Sesión</h2>
            <div class="input-group">
                <label for="username">Nombre de Usuario</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Contraseña</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="remember-me">
                <input type="checkbox" id="rememberMe" name="rememberMe">
                <label for="rememberMe">Recuérdame</label>
            </div>
            <button type="submit">Iniciar Sesión</button>

            <!-- Indicador de carga -->
            <div id="loadingSpinner" style="display: none; text-align: center; margin-top: 10px;">
                <img src="images/loading_spinner.gif" alt="Cargando...">
            </div>

            <div class="links">
                <a href="recuperarContraseña.jsp" class="recuperarcontraseña-link">¿Olvidaste tu contraseña?</a>
                
                <!-- Sección "¿No tienes una cuenta?" y "Regístrate" -->
                <p class="no-account">¿No tienes una cuenta?</p>
                <a href="registro.jsp" class="register-link">Regístrate</a>
            </div>
        </form>
    </div>

    <script>
        function showLoadingSpinner() {
            document.getElementById('loadingSpinner').style.display = 'block';
        }
    </script>
</body>
</html>
