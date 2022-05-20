
package controlador;

import datos.CategoriaDaoJDBC;
import datos.MarcaDaoJDBC;
import datos.ProductoDaoJDBC;
import java.util.ArrayList;
import java.util.List;
import modelo.Producto;


public class Prueba {
    public static void main(String[] args) {
        String marca=new MarcaDaoJDBC().getNombreMarca(2);
        System.out.println(marca);
        
        String categoria = new CategoriaDaoJDBC().getNombreCategoria(1);
        System.out.println(categoria);
        
        List<Producto> productos= new ProductoDaoJDBC().listar();
        System.out.println(productos);
        List<Producto> listaFiltrada= new ArrayList();
        
        for(Producto producto:productos){
            if(producto.getNombre().contains("ci"))
            {
                listaFiltrada.add(producto);
            }
        }
        Producto producto = new Producto(3,"bici2",2,2,3,50.6);
//        int cont =new ProductoDaoJDBC().insertar(producto);
//        System.out.println(cont);

        int cont =new ProductoDaoJDBC().eliminar(producto);
        System.out.println(listaFiltrada);
        
        System.out.println("caracter".contains("rac"));
        
         
    }
 
}
