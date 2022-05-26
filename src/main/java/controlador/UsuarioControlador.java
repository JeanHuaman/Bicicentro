package controlador;

import datos.UsuarioDaoJDBC;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.Usuario;

/**
 *
 * @author JEAN
 */
@WebServlet("/UsuarioControlador")
public class UsuarioControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
//                case "editar":  
//                    this.editarProducto(request, response);
//                    break;
//                case "eliminar":
//                    this.eliminarProducto(request,response);
//                    break;                
//                default:
//                    this.accionDefault(request, response);
//                    break;
            }
        } else {
            this.accionDefault(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "agregarUsuario":
                    this.agregarUsuario(request, response);
                    break;
                case "iniciarSesion":
                    this.iniciarSesion(request, response);
                    break;
                case "actualizarUsuario":
                    this.actualizarUsuario(request, response);
                    break;
//                default:
//                    this.accionDefault(request, response);
//                    break;
            }
        } else {
            this.accionDefault(request, response);
        }
    }

    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        response.sendRedirect("index.jsp");
    }

    private void agregarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("usuario");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Usuario usuario = new Usuario(email, user, password);
        int registrado = new UsuarioDaoJDBC().registrarse(usuario);

        request.setAttribute("idRegistrado", (Object) registrado);
        request.getRequestDispatcher("./vista/registro.jsp").forward(request, response);

    }

    private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Usuario usuario = new UsuarioDaoJDBC().iniciarSesion(email);

        if (usuario.getPassword().equals(password)) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            request.setAttribute("errorLogin", "error");
            request.getRequestDispatcher("./vista/login.jsp").forward(request, response);
        }

    }

    private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        String direccion = request.getParameter("direccion");
        String dni = request.getParameter("dni");
        
        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setCelular(celular);
        usuario.setEmail(email);
        usuario.setDireccion(direccion);
        usuario.setDni(dni);
        
        int actualizado = new UsuarioDaoJDBC().actualizarUsuario(usuario);
        sesion.setAttribute("usuario",usuario);
        request.setAttribute("actualizado",(Object) actualizado);
        request.getRequestDispatcher("./vista/editarUsuario.jsp").forward(request, response);

    }
}
