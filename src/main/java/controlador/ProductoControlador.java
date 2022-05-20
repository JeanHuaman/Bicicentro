/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;


import datos.CategoriaDaoJDBC;
import datos.MarcaDaoJDBC;
import datos.ProductoDaoJDBC;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import modelo.Categoria;
import modelo.Marca;
import modelo.Producto;


@WebServlet("/ProductoControlador")
public class ProductoControlador extends HttpServlet{
    
    
    @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        String accion = request.getParameter("accion");
        if(accion!=null)
        {
            switch(accion){
//                case "buscar":  
//                    this.productosFiltrados(request, response);
//                    break;
//                case "eliminar":
//                    this.eliminarCliente(request,response);
//                    break;
                default:
                    this.accionDefault(request, response);
                    break;
            }
        }else{
            this.accionDefault(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        String accion = request.getParameter("accion");
        if(accion!=null)
        {
            switch(accion){
                case "buscar":  
                    this.productosFiltrados(request, response);
                    break;
//                case "eliminar":
//                    this.eliminarCliente(request,response);
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
        List<Marca> marcas = new MarcaDaoJDBC().getListaMarca();
        List<Categoria> categorias = new CategoriaDaoJDBC().getListaCategoria();
        HttpSession session = request.getSession();
        
        
        
        session.setAttribute("marcas", marcas);
        session.setAttribute("categorias", categorias);
        
        response.sendRedirect("administrador.jsp");
    }
    
    private void productosFiltrados(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        List<Producto> productos= new ProductoDaoJDBC().listar();
        List<Producto> listaFiltrada= new ArrayList();
//        HttpSession sesion = request.getSession();
        String nombreFiltrado = request.getParameter("buscarProducto");
        if(nombreFiltrado!=null && !nombreFiltrado.equals(""))
        {
            for(Producto producto:productos){
                if(producto.getNombre().toLowerCase().contains(nombreFiltrado.toLowerCase()))
                {
                    listaFiltrada.add(producto);
                }
            }
        request.setAttribute("productos",listaFiltrada);
        }
        
        request.getRequestDispatcher("administrador.jsp").forward(request, response);

    }
}


