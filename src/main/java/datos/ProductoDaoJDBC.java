package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import modelo.Producto;

public class ProductoDaoJDBC {
    private static final String SELECT_PRODUCTO="SELECT id_producto,nombre_producto,id_marca,id_categoria,cantidad,precio,descripcion,imagen FROM producto";
    private static final String SELECT_PRODUCTO_BY_ID="SELECT id_producto,nombre_producto,imagen,id_marca,id_categoria,cantidad,precio,descripcion FROM producto WHERE id_producto=?";
    private static final String INSERT_PRODUCTO = "INSERT INTO producto(nombre_producto,id_marca,id_categoria,cantidad,precio,descripcion,imagen) VALUES(?,?,?,?,?,?,?)";
    private static final String UPDATE_PRODUCTO = "UPDATE producto SET nombre_producto=?,id_marca=?,id_categoria=?,cantidad=?,precio=?,descripcion=?,imagen=? WHERE id_producto=?";
    private static final String DELETE_PRODUCTO = "DELETE FROM producto WHERE id_producto=?";
    
    public List<Producto> listar()
    {
        Connection conn=null;
        PreparedStatement stmt=null;
        ResultSet rs=null;
        Producto producto=null;
        List<Producto> productos=new ArrayList();
        
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(SELECT_PRODUCTO);
            rs = stmt.executeQuery();
            
            while(rs.next()){
                int idProducto = rs.getInt("id_producto");
                String nombre_producto = rs.getString("nombre_producto");
                int idMarca = rs.getInt("id_marca");
                int idCategoria = rs.getInt("id_categoria");
                int cantidad = rs.getInt("cantidad");
                double precio = rs.getDouble("precio");
                String decripcion = rs.getString("descripcion");
                String imagen = rs.getString("imagen");
                
            producto = new Producto(idProducto,nombre_producto,imagen,idMarca,idCategoria,cantidad,precio,decripcion);
            productos.add(producto);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }finally{
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return productos;
    }
    
    public Producto encontrar(Producto producto){
        Connection conn=null;
            PreparedStatement stmt=null;
            ResultSet rs=null;
            
            
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(SELECT_PRODUCTO_BY_ID);
            stmt.setInt(1, producto.getIdProducto());
            rs = stmt.executeQuery();
            rs.next();
            String nombre_producto = rs.getString("nombre_producto");
            int idMarca = rs.getInt("id_marca");
            int idCategoria = rs.getInt("id_categoria");
            int cantidad = rs.getInt("cantidad");
            double precio = rs.getDouble("precio");
            String descripcion = rs.getString("descripcion");
            
            producto.setNombre(nombre_producto);
            producto.setIdMarca(idMarca);
            producto.setIdCategoria(idCategoria);
            producto.setCantidad(cantidad);
            producto.setPrecio(precio);
            producto.setDescripcion(descripcion);
            
            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }finally{
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
            return producto;
    }
    
     public int insertar(Producto producto){
         Connection conn=null;
         PreparedStatement stmt=null;
         int rows = 0;
         try{
             conn = Conexion.getConexion();
             stmt = conn.prepareStatement(INSERT_PRODUCTO);
             stmt.setString(1,producto.getNombre());
             stmt.setInt(2,producto.getIdMarca());
             stmt.setInt(3,producto.getIdCategoria());
             stmt.setInt(4,producto.getCantidad());
             stmt.setDouble(5,producto.getPrecio());
             stmt.setString(6, producto.getDescripcion());
             stmt.setString(7, producto.getImagen());
             rows = stmt.executeUpdate();
         }catch(SQLException ex){
             ex.printStackTrace(System.out);
         }finally{
            
            Conexion.close(stmt);
            Conexion.close(conn);
        }
       return rows;
    }
     
      public int actualizar(Producto producto)
    {
        Connection conn = null;
        PreparedStatement stmt=null;
        int rows=0;
        try{
             conn = Conexion.getConexion();
             stmt = conn.prepareStatement(UPDATE_PRODUCTO);
             stmt.setString(1,producto.getNombre());
             stmt.setInt(2,producto.getIdMarca());
             stmt.setInt(3,producto.getIdCategoria());
             stmt.setInt(4,producto.getCantidad());
             stmt.setDouble(5,producto.getPrecio());
             stmt.setString(6, producto.getDescripcion());
             stmt.setString(7, producto.getImagen());
             stmt.setInt(8,producto.getIdProducto());
             rows = stmt.executeUpdate();
         }catch(SQLException ex){
             ex.printStackTrace(System.out);
         }finally{
            
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }
      
     public int eliminar(Producto producto){
        Connection conn=null;
        PreparedStatement stmt=null;
        int rows=0;
        
        try{
             conn = Conexion.getConexion();
             stmt = conn.prepareStatement(DELETE_PRODUCTO);
             stmt.setInt(1, producto.getIdProducto());
             rows = stmt.executeUpdate();
         }catch(SQLException ex){
             ex.printStackTrace(System.out);
         }finally{
            
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        
        return rows;
    }
}
