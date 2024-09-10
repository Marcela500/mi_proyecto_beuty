package com.mycompany.mi_proyecto_beuty.services;

import com.mycompany.mi_proyecto_beuty.models.Usuario;

public interface UsuarioService {
    Usuario registrarUsuario(Usuario usuario);
    Usuario obtenerUsuarioPorNombre(String username);
    Usuario obtenerUsuarioPorCorreo(String correo);
}
