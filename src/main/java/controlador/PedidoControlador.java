package controlador;

import datos.DetallePedidoDaoJDBC;
import datos.PedidoDaoJDBC;
import datos.UsuarioDaoJDBC;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.DetallePedido;
import modelo.Pedido;
import modelo.Producto;
import modelo.Usuario;

@WebServlet("/PedidoControlador")
public class PedidoControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "historial":
                    this.historial(request, response);
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
                case "guardarPedido":
                    this.guardarPedido(request, response);
                    break;
                default:
                    this.accionDefault(request, response);
                    break;
            }
        } else {
            this.accionDefault(request, response);
        }
    }

    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }

    private void guardarPedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();

        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        boolean comprado =false;
        if (usuario != null) {

            List<Producto> carrito = (List<Producto>) sesion.getAttribute("carrito");
            double total = (double) sesion.getAttribute("total");

            String tipoPago = request.getParameter("pago");
            String codigoAleatorio = generarCodigo();
            
            
            String direccion = request.getParameter("direccion");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String dni = request.getParameter("dni");
            String celular = request.getParameter("celular");

            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setCelular(celular);
            usuario.setDni(dni);
            usuario.setDireccion(direccion);

            new UsuarioDaoJDBC().actualizarUsuario(usuario);

            String fecha = new Date().toString();

            Pedido pedido = new Pedido(codigoAleatorio, total, tipoPago, usuario.getIdUsuario(), fecha);

            new PedidoDaoJDBC().insertar(pedido);

            int idPedido = new PedidoDaoJDBC().obtenerIdPedido(pedido);

            for (Producto p : carrito) {
                DetallePedido detalle = new DetallePedido(p.getNombre(), p.getCantidad(), idPedido, p.getIdProducto(), p.getCantidad() * p.getPrecio());
                new DetallePedidoDaoJDBC().insertar(detalle);
            }
            comprado=true;
            request.setAttribute("comprado", comprado);
            sesion.setAttribute("carrito", null);
            sesion.setAttribute("total",0);
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void historial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        HttpSession sesion = request.getSession();
        List<Pedido> pedidos = new PedidoDaoJDBC().obtenerPedidos(idUsuario);

        if (pedidos == null) {
            pedidos = new ArrayList();
        }

        sesion.setAttribute("pedidos", pedidos);
        request.getRequestDispatcher("./vista/historial.jsp").forward(request, response);
    }

    private String generarCodigo() {
        String codigo = "";
        int numeroAleatorio = (int) (Math.random() * (999999999 - 100000000) + 1);
        codigo = numeroAleatorio + "";
        return codigo;
    }
}
