/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;


import datos.ProductoDaoJDBC;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.Producto;


@WebServlet("/ProductoControlador")
public class ProductoControlador extends HttpServlet{
    
 
    @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        String accion = request.getParameter("accion");
        if(accion!=null)
        {
            switch(accion){
                case "editar":  
                    this.editarProducto(request, response);
                    break;
                case "eliminar":
                    this.eliminarProducto(request,response);
                    break;                
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
                case "buscar":  
                    this.productosFiltrados(request, response);
                    break;
                case "modificar":
                    this.modificarProducto(request,response);
                    break;
                case "agregarProducto":
                    this.agregarProducto(request,response);
                    break;
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
    
    private void productosFiltrados(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        List<Producto> productos= new ProductoDaoJDBC().listar();
        List<Producto> listaFiltrada= new ArrayList();

        String nombreFiltrado = request.getParameter("buscarProducto");
        if(nombreFiltrado!=null && !nombreFiltrado.equals(""))
        {
            for(Producto producto:productos){
                if(producto.getNombre().toLowerCase().contains(nombreFiltrado.toLowerCase()))
                {
                    listaFiltrada.add(producto);
                }
            }           
        
        }
        request.setAttribute("productos",listaFiltrada);
        
        request.getRequestDispatcher("vista/administrador.jsp").forward(request, response);

    }
    
    private void eliminarProducto(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
       Producto producto = new Producto(idProducto);
       int registrosModificados = new ProductoDaoJDBC().eliminar(producto);
       request.getRequestDispatcher("vista/administrador.jsp").forward(request, response);
    }    
    
    private void editarProducto(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        Producto producto = new ProductoDaoJDBC().encontrar(new Producto(idProducto));
        request.setAttribute("producto",producto);
        request.getRequestDispatcher("vista/editarProducto.jsp").forward(request, response);
        
    }
    
    private void modificarProducto(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        String nombre=request.getParameter("nombre");
        int idcategoria=Integer.parseInt(request.getParameter("categoria"));
        int idmarca=Integer.parseInt(request.getParameter("marca"));
        int cantidad=Integer.parseInt(request.getParameter("cantidad"));
        double precio=Double.parseDouble(request.getParameter("precio"));
        String descripcion = request.getParameter("descripcion");
        
        Producto producto = new Producto(idProducto,nombre,idmarca,idcategoria,cantidad,precio,descripcion);

        int registrosModificados = new ProductoDaoJDBC().actualizar(producto);
        request.setAttribute("producto",producto);
         response.sendRedirect("vista/administrador.jsp");
    }
    
    private void agregarProducto(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        String nombre = request.getParameter("nombre");
        int idmarca = Integer.parseInt(request.getParameter("marca"));
        int idcategoria = Integer.parseInt(request.getParameter("categoria"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        String descripcion = request.getParameter("descripcion");
        String imagen = request.getParameter("imagen");
        
        Producto producto = new Producto(nombre,imagen,idmarca,idcategoria,cantidad,precio,descripcion);
        
        int cantidadInserto = new ProductoDaoJDBC().insertar(producto);
        response.sendRedirect("vista/administrador.jsp");
    }
}


