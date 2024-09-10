<%-- 
    Document   : Listar
    Created on : 23/07/2024, 6:09:49 p. m.
    Author     : lauma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Productos</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
            text-align: center;
        }
        td {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Lista de Productos</h1>
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
</body>
</html>

