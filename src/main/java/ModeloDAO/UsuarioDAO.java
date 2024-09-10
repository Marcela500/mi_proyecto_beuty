package ModeloDAO;

import com.mycompany.mi_proyecto_beuty.models.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class UsuarioDAO {

    private static final Logger logger = LoggerFactory.getLogger(UsuarioDAO.class);

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Método para obtener usuario por correo electrónico
    public Usuario obtenerUsuarioPorCorreo(String correo) {
        String sql = "SELECT * FROM usuarios WHERE correo_electronico = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{correo}, new UsuarioRowMapper());
        } catch (EmptyResultDataAccessException e) {
            logger.warn("Usuario no encontrado con correo: {}", correo);
            return null;
        } catch (Exception e) {
            logger.error("Error obteniendo usuario por correo: {}", correo, e);
            return null;
        }
    }

    // Método para registrar un nuevo usuario
    public void registrarUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nombre, apellidos, telefono, direccion, correo_electronico, contrasena) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            jdbcTemplate.update(sql, usuario.getNombre(), usuario.getApellidos(), usuario.getTelefono(),
                    usuario.getDireccion(), usuario.getCorreoElectronico(), usuario.getContrasena());
            logger.info("Usuario registrado exitosamente: {}", usuario.getCorreoElectronico());
        } catch (Exception e) {
            logger.error("Error registrando usuario: {}", usuario.getCorreoElectronico(), e);
        }
    }

    // Clase interna para mapear las filas de la tabla `usuarios` a objetos `Usuario`
    private static class UsuarioRowMapper implements RowMapper<Usuario> {
        @Override
public Usuario mapRow(ResultSet rs, int rowNum) throws SQLException {
    Usuario usuario = new Usuario();
    
    // Cambiar a obtener como Long
    usuario.setId(rs.getLong("id"));  
    usuario.setNombre(rs.getString("nombre"));
    usuario.setApellidos(rs.getString("apellidos"));
    usuario.setCorreoElectronico(rs.getString("correo_electronico"));
    usuario.setTelefono(rs.getString("telefono"));
    usuario.setDireccion(rs.getString("direccion"));
    usuario.setContrasena(rs.getString("contrasena"));
    usuario.setRol(rs.getString("rol"));
    
    return usuario;
}

    }
}
