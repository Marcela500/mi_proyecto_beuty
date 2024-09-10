package com.mycompany.mi_proyecto_beuty.servlets;

import com.mycompany.mi_proyecto_beuty.models.Usuario;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "LoginServlet", urlPatterns = {"/usuario/login"})
public class LoginServlet extends HttpServlet {

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            Context ctx = new InitialContext();
            dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/mitienda");
        } catch (NamingException ex) {
            throw new ServletException("Error en la configuración del recurso JDBC", ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username"); // Cambiado de email a username
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        String errorMessage = null;

        try {
            Usuario user = authenticateUser(username, password); // Cambiado de email a username
            if (user != null) {
                session.setAttribute("user", user.getNombre());
                session.setAttribute("role", user.getRol());
                session.setAttribute("apellidos", user.getApellidos());

                if ("admin".equals(user.getRol())) {
                    response.sendRedirect("admin.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                errorMessage = "Nombre de usuario o contraseña incorrectos.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging the exception
            errorMessage = "Se ha producido un error. Por favor, inténtelo de nuevo más tarde.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private Usuario authenticateUser(String username, String password) {
        Usuario user = null;
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT nombre, apellidos, contrasena, rol FROM usuarios WHERE nombre = ?")) { // Cambiado de correo_electronico a nombre
            pstmt.setString(1, username); // Cambiado de email a username
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String storedPasswordHash = rs.getString("contrasena");
                    String role = rs.getString("rol");
                    // Verifica la contraseña utilizando BCrypt
                    if (BCrypt.checkpw(password, storedPasswordHash)) {
                        user = new Usuario();
                        user.setNombre(rs.getString("nombre"));
                        user.setApellidos(rs.getString("apellidos"));
                        user.setRol(role);
                    }
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace(); // Consider logging the exception
        }
        return user;
    }
}
