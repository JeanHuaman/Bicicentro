
package controlador;

import datos.CategoriaDaoJDBC;
import datos.MarcaDaoJDBC;
import datos.ProductoDaoJDBC;
import datos.UsuarioDaoJDBC;
import java.util.ArrayList;
import java.util.List;
import modelo.Producto;
import modelo.Usuario;


public class Prueba {
    public static void main(String[] args) {
//        String marca=new MarcaDaoJDBC().getNombreMarca(2);
//        System.out.println(marca);
//        
//        String categoria = new CategoriaDaoJDBC().getNombreCategoria(1);
//        System.out.println(categoria);
//        
//        List<Producto> productos= new ProductoDaoJDBC().listar();
//        System.out.println(productos);
//        List<Producto> listaFiltrada= new ArrayList();
//        
//        for(Producto producto:productos){
//            if(producto.getNombre().contains("ci"))
//            {
//                listaFiltrada.add(producto);
//            }
//        }
//        Producto producto = new Producto(4,"bici2",2,2,3,50.6,"descripcion");
////        int cont =new ProductoDaoJDBC().insertar(producto);
////        
//
//        int cont =new ProductoDaoJDBC().actualizar(producto);
//        System.out.println(cont);
//        System.out.println(listaFiltrada);
//        
//        System.out.println("caracter".contains("rac"));
//        

//          Usuario usuario = new Usuario("juan@hotmail.com","juan","12345");
//          
//          int registrado = new UsuarioDaoJDBC().registrarse(usuario);

//            System.out.println(registrado);

            Usuario usuario = new Usuario("jean","huaman","987654321","jean@hotmail.com","87451263","Niño jesus 2da etapa","jean","123456");
            
            int actualizado = new UsuarioDaoJDBC().actualizarUsuario(usuario);
            
            System.out.println(actualizado);
          
//          String logeado = new UsuarioDaoJDBC().iniciarSesion(usuario);
//          if(logeado.equals(usuario.getPassword())){
//              System.out.println("Inicio de Sesión correctamente");
//          }else{
//              System.out.println("NO inicio de sesión");
//          }
         
    }
 
}
