package com.mycompany.mi_proyecto_beuty.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/mitienda"; 
    private static final String USER = "root"; 
    private static final String PASSWORD = ""; 

    private Connection con;

    public Conexion() {
        try {
            // Cargar el driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establecer conexión con la base de datos
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            // Manejo de excepciones para el driver no encontrado
            System.err.println("Driver JDBC no encontrado: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            // Manejo de excepciones para problemas con la conexión
            System.err.println("Error al conectar con la base de datos: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return con;
    }
}
