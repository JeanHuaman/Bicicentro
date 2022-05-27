package controlador;

import datos.ProductoDaoJDBC;
import datos.UsuarioDaoJDBC;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.Producto;
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
                case "agregarCarrito":
                    this.agregarCarrito(request, response);
                    break;
                case "actualizarCantidad":
                    this.actualizarCantidad(request, response);
                    break;
                default:
                    this.accionDefault(request, response);
                    break;
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
//                case "actualizarCantidad":
//                    this.actualizarCantidad(request, response);
//                    break;
                default:
                    this.accionDefault(request, response);
                    break;
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
        sesion.setAttribute("usuario", usuario);
        request.setAttribute("actualizado", (Object) actualizado);
        request.getRequestDispatcher("./vista/editarUsuario.jsp").forward(request, response);

    }

    private void agregarCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        double total = 0;
        List<Producto> carrito = (List<Producto>) sesion.getAttribute("carrito");
        int id = Integer.parseInt(request.getParameter("idProducto"));
        Producto producto = new ProductoDaoJDBC().encontrar(new Producto(id));
        int cantidad = 1;
        boolean encontrado = false;

        if (carrito == null) {
            carrito = new ArrayList();
            sesion.setAttribute("carrito", carrito);
            producto.setCantidad(cantidad);
            carrito.add(producto);
            total = producto.getPrecio() * producto.getCantidad();
        } else {
            for (Producto p : carrito) {
                if (id == p.getIdProducto()) {
                    cantidad = p.getCantidad() + 1;
                    p.setCantidad(cantidad);
                    encontrado = true;
                }
            }
            if (!encontrado) {
                producto.setCantidad(cantidad);
                carrito.add(producto);
            }
            for (Producto p : carrito) {
                total = p.getPrecio() * p.getCantidad() + total;
            }
        }
        sesion.setAttribute("total", total);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void actualizarCantidad(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        String motivo = request.getParameter("motivo");
        double total = 0;
        int cantidad = 0;
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));

        List<Producto> carrito = (List<Producto>) sesion.getAttribute("carrito");

        if (motivo.equals("aumentar")) {
            for (Producto p : carrito) {
                if (p.getIdProducto() == idProducto) {
                    cantidad = p.getCantidad() + 1;
                    p.setCantidad(cantidad);
                }
                total = p.getPrecio() * p.getCantidad() + total;
            }
        }

        if (motivo.equals("disminuir")) {
            for (Producto p : carrito) {
                if (p.getIdProducto() == idProducto) {
                    if (!(p.getCantidad() == 1)) {
                        cantidad = p.getCantidad() - 1;
                        p.setCantidad(cantidad);
                    }
                }
                total = p.getPrecio() * p.getCantidad() + total;
            }
        }
        sesion.setAttribute("total", total);

        response.sendRedirect("./vista/pedido.jsp");
    }
}
