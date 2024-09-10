package com.mycompany.mi_proyecto_beuty.servlets;

import com.mycompany.mi_proyecto_beuty.models.Usuario;
import com.mycompany.mi_proyecto_beuty.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet(name = "RegistroServlet", urlPatterns = {"/usuario/registro"})
public class RegistroServlet extends HttpServlet {

    @Autowired
    private UsuarioService usuarioService;

    @Override
    public void init() throws ServletException {
        super.init();
        // Habilita la inyección de dependencias de Spring en servlets
        SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtén los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos"); // Obtener apellidos
        String correo = request.getParameter("correoElectronico");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String contrasena = request.getParameter("contrasena");

        // Verifica que todos los campos no estén vacíos
        if (nombre != null && apellidos != null && correo != null && telefono != null && direccion != null && contrasena != null &&
            !nombre.isEmpty() && !apellidos.isEmpty() && !correo.isEmpty() && !telefono.isEmpty() && !direccion.isEmpty() && !contrasena.isEmpty()) {
            
            // Verifica si el usuario ya está registrado
            Usuario existingUser = usuarioService.obtenerUsuarioPorCorreo(correo);
            
            if (existingUser != null) {
                // Si el usuario ya existe, muestra un mensaje de error
                request.setAttribute("errorMessage", "El correo electrónico ya está registrado.");
                request.getRequestDispatcher("/registro.jsp").forward(request, response);
            } else {
                // Encripta la contraseña usando BCrypt
                String hashedPassword = BCrypt.hashpw(contrasena, BCrypt.gensalt());

                // Crea un nuevo usuario y lo registra
                Usuario newUser = new Usuario();
                newUser.setNombre(nombre);
                newUser.setApellidos(apellidos); // Guardar los apellidos
                newUser.setCorreoElectronico(correo);
                newUser.setTelefono(telefono);
                newUser.setDireccion(direccion);
                newUser.setContrasena(hashedPassword); // Guardar la contraseña encriptada
                newUser.setRol("usuario");

                try {
                    usuarioService.registrarUsuario(newUser);
                    // Redirige a la página de inicio de sesión con un mensaje de éxito
                    response.sendRedirect(request.getContextPath() + "/login.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("errorMessage", "Ocurrió un error al registrar el usuario.");
                    request.getRequestDispatcher("/error.jsp").forward(request, response);
                }
            }
        } else {
            // Si algún campo está vacío, muestra un mensaje de error
            request.setAttribute("errorMessage", "Por favor complete todos los campos del formulario.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
        }
    }
}
