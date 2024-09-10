package com.mycompany.mi_proyecto_beuty.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.mycompany.mi_proyecto_beuty.models.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    Usuario findByNombre(String nombre);
    Usuario findByCorreoElectronico(String correoElectronico);
}
