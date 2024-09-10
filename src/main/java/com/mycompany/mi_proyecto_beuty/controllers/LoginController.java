package com.mycompany.mi_proyecto_beuty.controllers;

import com.mycompany.mi_proyecto_beuty.models.Usuario;
import com.mycompany.mi_proyecto_beuty.services.UsuarioService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/usuario/login")
    public String mostrarFormularioDeLogin() {
        return "login"; 
    }

    @PostMapping("/usuario/login")
    public String procesarLogin(@RequestParam("username") String username,
                                @RequestParam("password") String password,
                                Model model,
                                HttpSession session) {
        Usuario usuario = usuarioService.obtenerUsuarioPorNombre(username);

        if (usuario != null && BCrypt.checkpw(password, usuario.getContrasena())) {
            // Si el usuario existe y la contraseña es correcta
            session.setAttribute("usuario", usuario.getNombre());
            session.setAttribute("rol", usuario.getRol());
            session.setAttribute("apellidos", usuario.getApellidos());

            // Redirigir según el rol del usuario
            if ("admin".equals(usuario.getRol())) {
                return "redirect:/admin";
            } else {
                return "redirect:/index"; // Página principal para usuarios normales
            }
        } else {
            // Si las credenciales son incorrectas, enviar un mensaje de error
            model.addAttribute("errorMessage", "Nombre de usuario o contraseña incorrectos.");
            return "login"; // Redirigir nuevamente al formulario de login
        }
    }
}
