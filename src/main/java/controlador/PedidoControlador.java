package controlador;

import datos.DetallePedidoDaoJDBC;
import datos.PedidoDaoJDBC;
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "guardarPedido":
                    this.guardarPedido(request, response);
                    break;
//                case "iniciarSesion":
//                    this.iniciarSesion(request, response);
//                    break;
//                case "actualizarUsuario":
//                    this.actualizarUsuario(request, response);
//                    break;
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
        response.sendRedirect("index.jsp");
    }

    private void guardarPedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();

        String codigoAleatorio = generarCodigo();
        double total = (double) sesion.getAttribute("total");
        String tipoPago = request.getParameter("pago");
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        List<Producto> carrito = (List<Producto>) sesion.getAttribute("carrito");
        String fecha = new Date().toString();
        if(carrito==null){
            response.sendRedirect("index.jsp");
        }
        Pedido pedido = new Pedido(codigoAleatorio,total,tipoPago,usuario.getIdUsuario(),fecha);
        int guardar = new PedidoDaoJDBC().insertar(pedido);
        int idPedido = new PedidoDaoJDBC().obtenerIdPedido(pedido);
        for(Producto p : carrito)
        {
            DetallePedido detalle = new DetallePedido(p.getNombre(),p.getCantidad(),idPedido,p.getIdProducto(),p.getCantidad()*p.getPrecio());
            new DetallePedidoDaoJDBC().insertar(detalle);
        }
        request.getRequestDispatcher("./vista/pedido.jsp").forward(request, response);
    }

    private void historial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        List<Pedido> pedidos = new PedidoDaoJDBC().obtenerPedidos(idUsuario);
        
        if(pedidos==null){
            pedidos = new ArrayList();
        }
        
        request.setAttribute("pedidos", pedidos);
        request.getRequestDispatcher("./vista/historial.jsp").forward(request, response);
    }
    
    private String generarCodigo() {
        String codigo = "";
        int numeroAleatorio = (int) (Math.random() * (999999999 - 100000000) + 1);
        codigo = numeroAleatorio + "";
        return codigo;
    }
}
