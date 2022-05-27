package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.DetallePedido;

public class DetallePedidoDaoJDBC {
    
    private static final String INSERT_DETALLE_PEDIDO = "INSERT INTO detalle_pedido(nombre_producto,cantidad,id_pedido,id_producto,subtotal) VALUES(?,?,?,?,?)";
    private static final String SELECT_PEDIDO = "SELECT id_producto,nombre_producto,id_marca,id_categoria,cantidad,precio,descripcion,imagen FROM producto";

    
    public int insertar(DetallePedido detalle){
         Connection conn=null;
         PreparedStatement stmt=null;
         int rows = 0;
         try{
             conn = Conexion.getConexion();
             stmt = conn.prepareStatement(INSERT_DETALLE_PEDIDO);
             stmt.setString(1,detalle.getNombreProducto());
             stmt.setInt(2,detalle.getCantidad());
             stmt.setInt(3,detalle.getIdPedido());
             stmt.setInt(4,detalle.getIdProducto());
             stmt.setDouble(5,detalle.getSubtotal());
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
