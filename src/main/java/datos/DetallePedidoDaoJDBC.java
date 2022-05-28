package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.DetallePedido;

public class DetallePedidoDaoJDBC {
    
    private static final String INSERT_DETALLE_PEDIDO = "INSERT INTO detalle_pedido(nombre_producto,cantidad,id_pedido,id_producto,subtotal) VALUES(?,?,?,?,?)";
    private static final String SELECT_TODO_DETALLE = "SELECT id_detalle,nombre_producto,cantidad,id_producto,subtotal FROM detalle_pedido WHERE id_pedido=?";

    
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
    
    public List<DetallePedido> detallePedido(int idPedido){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<DetallePedido> detalleProductos=new ArrayList();
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(SELECT_TODO_DETALLE);
            stmt.setInt(1, idPedido);
            rs = stmt.executeQuery();
            while (rs.next()) {
                int idDetalle = rs.getInt("id_detalle");
                String nombreProducto = rs.getString("nombre_producto");
                int cantidad = rs.getInt("cantidad");
                int idProducto = rs.getInt("id_producto");
                double subtotal = rs.getDouble("subtotal");
                DetallePedido pedido = new DetallePedido(idDetalle,nombreProducto,cantidad,idPedido,idProducto,subtotal);
                detalleProductos.add(pedido);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return detalleProductos;
    }
    
}
