package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Producto;
import modelo.Usuario;

public class UsuarioDaoJDBC {

    private static final String REGISTRAR_USUARIO = "INSERT INTO usuario(email,user,password) VALUES(?,?,?)";
    private static final String SESION_USUARIO = "SELECT id_usuario,nombre,apellido,dni,celular,email,direccion,password,user FROM usuario WHERE email=? limit 1";
    private static final String UPDATE_USUARIO = "UPDATE usuario SET nombre=?,apellido=?,dni=?,celular=?,email=?,direccion=? WHERE id_usuario=?";

    public int registrarse(Usuario usuario) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int isRegistrado = 0;
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(REGISTRAR_USUARIO);
            stmt.setString(1, usuario.getEmail());
            stmt.setString(2, usuario.getUser());
            stmt.setString(3, usuario.getPassword());
            isRegistrado = stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return isRegistrado;
    }

    public Usuario iniciarSesion(String email) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Usuario usuario = null;
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(SESION_USUARIO);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString("id_usuario"));
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String dni = rs.getString("dni");
                String celular = rs.getString("celular");
                String direccion = rs.getString("direccion");
                String password = rs.getString("password");
                String user = rs.getString("user");

                usuario = new Usuario(id, nombre, apellido, celular, email, dni, direccion, user, password);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return usuario;
    }

    public int actualizarUsuario(Usuario usuario) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int actualizado = 0;
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(UPDATE_USUARIO);
            stmt.setString(1, usuario.getNombre());
            stmt.setString(2, usuario.getApellido());
            stmt.setString(3, usuario.getDni());
            stmt.setString(4, usuario.getCelular());
            stmt.setString(5, usuario.getEmail());
            stmt.setString(6, usuario.getDireccion());
            stmt.setInt(7, usuario.getIdUsuario());

            actualizado = stmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return actualizado;
    }
}
