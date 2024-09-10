package com.mycompany.mi_proyecto_beuty.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.mi_proyecto_beuty.services.UsuarioService;
import com.mycompany.mi_proyecto_beuty.repositories.UsuarioRepository;
import com.mycompany.mi_proyecto_beuty.models.Usuario;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    public Usuario registrarUsuario(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    @Override
    public Usuario obtenerUsuarioPorNombre(String username) {
        return usuarioRepository.findByNombre(username);
    }

    @Override
    public Usuario obtenerUsuarioPorCorreo(String correo) {
        return usuarioRepository.findByCorreoElectronico(correo);
    }

    // Otros métodos según sea necesario
}
