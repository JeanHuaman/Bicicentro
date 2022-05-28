package controlador;

import datos.DetallePedidoDaoJDBC;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DetallePedido;

@WebServlet("/DetallePedidoControlador")
public class DetallePedidoControlador extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        String accion = request.getParameter("accion");
        if(accion!=null)
        {
            switch(accion){
                case "detallePedido":  
                    this.detallePedido(request, response);
                    break;
//                case "eliminar":
//                    this.eliminarProducto(request,response);
//                    break;                
                default:
                    this.accionDefault(request, response);
                    break;
            }
        }else{
            this.accionDefault(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        String accion = request.getParameter("accion");
        if(accion!=null)
        {
            switch(accion){
//                case "buscar":  
//                    this.productosFiltrados(request, response);
//                    break;
//                case "modificar":
//                    this.modificarProducto(request,response);
//                    break;
//                case "agregarProducto":
//                    this.agregarProducto(request,response);
//                    break;
                default:
                    this.accionDefault(request, response);
                    break;
            }
        }else{
            this.accionDefault(request, response);
        }
    }
    
    private void accionDefault(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
    {
        
        
                
        response.sendRedirect("index.jsp");
    }
    
    
    private void detallePedido(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        int idPedido = Integer.parseInt(request.getParameter("idPedido"));
        String numeroPedido = request.getParameter("numeroPedido");
        double total = 0.0;
        List<DetallePedido> detalleProductos= new DetallePedidoDaoJDBC().detallePedido(idPedido);
        
        for(DetallePedido p : detalleProductos){
            total+=p.getSubtotal();
        }
        request.setAttribute("detalleProductos", detalleProductos);
        request.setAttribute("total", total);
        request.setAttribute("numeroPedido", numeroPedido);
        request.getRequestDispatcher("./vista/detallePedido.jsp").forward(request, response);
    }
    
}
