<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <style>
        /* Estilos básicos para el cuerpo de la página */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        /* Contenedor central para el formulario */
        .container {
            width: 90%;
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Estilo para el logo de la empresa */
        .logo {
            display: block;
            margin: 0 auto 20px auto;
            width: 150px;
        }

        /* Estilo del formulario */
        form {
            margin-top: 20px;
        }

        /* Estilo del título del formulario */
        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        /* Estilo para los grupos de entrada */
        .input-group {
            margin-bottom: 20px;
        }

        /* Estilo para las etiquetas de los campos */
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        /* Estilo para los campos de entrada */
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        /* Estilo para el grupo de términos y condiciones */
        .terms {
            display: flex;
            align-items: center;
        }

        /* Estilo para la etiqueta de términos y condiciones */
        .terms label {
            margin-left: 5px;
            font-weight: normal;
        }

        /* Estilo para el botón de envío */
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

        /* Estilo para el botón al pasar el ratón por encima */
        button:hover {
            background-color: #0056b3;
        }

        /* Estilo para los enlaces */
        .links {
            margin-top: 15px;
        }

        /* Estilo para el texto de "ya tienes una cuenta" */
        .already-have-account {
            text-align: center;
            color: #000;
        }

        /* Estilo para el enlace de "ya tienes una cuenta" */
        .already-have-account a {
            color: #007bff;
            text-decoration: none;
        }

        /* Estilo para el enlace al pasar el ratón por encima */
        .already-have-account a:hover {
            text-decoration: underline;
        }

        /* Estilos para mensajes de error y éxito */
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: -15px;
            margin-bottom: 15px;
        }

        .success-message {
            color: green;
            font-size: 14px;
            margin-top: -15px;
            margin-bottom: 15px;
        }

        /* Estilos adicionales para pantallas pequeñas */
        @media (max-width: 600px) {
            .container {
                margin: 20px;
                padding: 15px;
            }

            h2 {
                font-size: 20px;
            }

            input[type="text"],
            input[type="email"],
            input[type="tel"],
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
        <!-- Formulario de registro -->
        <form id="registerForm" action="${pageContext.request.contextPath}/usuario/registro" method="POST" onsubmit="return validateForm()">
            <h2>Regístrate</h2>
            <!-- Campo para el nombre del usuario -->
            <div class="input-group">
                <label for="nombre">Nombre</label>
                <input type="text" id="nombre" name="nombre" required>
            </div>
            <!-- Campo para los apellidos del usuario -->
            <div class="input-group">
                <label for="apellidos">Apellidos</label>
                <input type="text" id="apellidos" name="apellidos" required>
            </div>
            <!-- Campo para el correo electrónico del usuario -->
            <div class="input-group">
                <label for="correo">Correo electrónico</label>
                <input type="email" id="correo" name="correoElectronico" required>
            </div>
            <!-- Campo para el teléfono del usuario -->
            <div class="input-group">
                <label for="telefono">Teléfono</label>
                <input type="tel" id="telefono" name="telefono" required>
            </div>
            <!-- Campo para la dirección del usuario -->
            <div class="input-group">
                <label for="direccion">Dirección</label>
                <input type="text" id="direccion" name="direccion" required>
            </div>
            <!-- Campo para la contraseña del usuario -->
            <div class="input-group">
                <label for="contrasena">Contraseña</label>
                <input type="password" id="contrasena" name="contrasena" required>
            </div>
            <!-- Campo oculto para el rol del usuario -->
            <input type="hidden" id="rol" name="rol" value="usuario">
            <!-- Casilla de verificación para aceptar términos y condiciones -->
            <div class="input-group terms">
                <input type="checkbox" id="terms" name="terms" required>
                <label for="terms">Acepto los términos y condiciones</label>
            </div>
            <!-- Botón de envío del formulario -->
            <button type="submit">Registrarse</button>
            
            <!-- Mensajes de error y éxito mostrados según el resultado del registro -->
            <c:if test="${not empty errorMessage}">
                <div class="error-message"><c:out value="${errorMessage}"/></div>
            </c:if>
            <c:if test="${not empty successMessage}">
                <div class="success-message"><c:out value="${successMessage}"/></div>
            </c:if>

            <!-- Enlace para usuarios que ya tienen una cuenta -->
            <div class="links">
                <p class="already-have-account">¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión</a></p>
            </div>
        </form>
    </div>

    <!-- Script para validar el formulario antes del envío -->
    <script>
        function validateForm() {
            const termsCheckbox = document.getElementById('terms');
            if (!termsCheckbox.checked) {
                alert('Debes aceptar los términos y condiciones.');
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
