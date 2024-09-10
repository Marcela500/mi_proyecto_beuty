<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Administración</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }
        .section {
            margin-bottom: 40px;
        }
        .section h3 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #333;
        }
        .section table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .section table, .section th, .section td {
            border: 1px solid #ccc;
        }
        .section th, .section td {
            padding: 10px;
            text-align: left;
        }
        .section th {
            background-color: #f2f2f2;
        }
        .section button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .section button:hover {
            background-color: #0056b3;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group textarea {
            resize: vertical;
        }
        .form-group input[type="submit"] {
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
            padding: 10px;
        }
        .form-group input[type="submit"]:hover {
            background-color: #218838;
        }
        @media (max-width: 600px) {
            .container {
                margin: 20px;
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Administración</h2>

        <!-- Sección de Usuarios -->
        <div class="section">
            <h3>Usuarios</h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Correo Electrónico</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Contraseña</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
                        if (usuarios != null && !usuarios.isEmpty()) {
                            for (Usuario usuario : usuarios) {
                    %>
                        <tr>
                            <td><%= usuario.getId() %></td>
                            <td><%= usuario.getNombre() %></td>
                            <td><%= usuario.getCorreoElectronico() %></td>
                            <td><%= usuario.getTelefono() %></td>
                            <td><%= usuario.getDireccion() %></td>
                            <td><%= usuario.getContrasena() %></td>
                            <td>
                                <button onclick="window.location.href='editarUsuario?id=<%= usuario.getId() %>'">Editar</button>
                                <button onclick="window.location.href='eliminarUsuario?id=<%= usuario.getId() %>'">Eliminar</button>
                            </td>
                        </tr>
                    <% 
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="7">No hay usuarios disponibles.</td>
                        </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Sección de Productos -->
        <div class="section">
            <h3>Productos</h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Marca</th>
                        <th>Precio</th>
                        <th>Color</th>
                        <th>Tipo</th>
                        <th>Descripción</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<Producto> productos = (List<Producto>) request.getAttribute("productos");
                        if (productos != null && !productos.isEmpty()) {
                            for (Producto prod : productos) {
                    %>
                        <tr>
                            <td><%= prod.getId() %></td>
                            <td><%= prod.getNombre() %></td>
                            <td><%= prod.getMarca() %></td>
                            <td><%= prod.getPrecio() %></td>
                            <td><%= prod.getColor() %></td>
                            <td><%= prod.getTipo() %></td>
                            <td><%= prod.getDescripcion() %></td>
                            <td>
                                <a href="editarProducto?id=<%= prod.getId() %>">Editar</a>
                                <a href="eliminarProducto?id=<%= prod.getId() %>">Eliminar</a>
                            </td>
                        </tr>
                    <% 
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="8">No hay productos disponibles.</td>
                        </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Formulario para Agregar Producto -->
        <div class="section">
            <h3>Agregar Producto</h3>
            <form action="producto" method="post">
                <input type="hidden" name="action" value="add"/>
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" required/>
                </div>
                <div class="form-group">
                    <label for="marca">Marca:</label>
                    <input type="text" id="marca" name="marca" required/>
                </div>
                <div class="form-group">
                    <label for="color">Color:</label>
                    <input type="text" id="color" name="color" required/>
                </div>
                <div class="form-group">
                    <label for="tipo">Tipo:</label>
                    <input type="text" id="tipo" name="tipo" required/>
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <textarea id="descripcion" name="descripcion" required></textarea>
                </div>
                <div class="form-group">
                    <label for="precio">Precio:</label>
                    <input type="number" step="0.01" id="precio" name="precio" required/>
                </div>
                <div class="form-group">
                    <input type="submit" value="Agregar Producto"/>
                </div>
            </form>
        </div>

    </div>
</body>
</html>
