package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.DetallePedido;
import modelo.Pedido;

public class PedidoDaoJDBC {

    private static final String INSERT_PEDIDO = "INSERT INTO pedido(numero_pedido,importe_total,tipo_pago,id_usuario,fecha) VALUES(?,?,?,?,?)";
    private static final String SELECT_ID_PEDIDO = "SELECT id_pedido FROM pedido WHERE numero_pedido=?";
    private static final String SELECT_PEDIDO = "SELECT id_pedido,numero_pedido,importe_total,tipo_pago,id_usuario,fecha FROM pedido WHERE id_usuario=?";
    
    
    public int insertar(Pedido pedido) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(INSERT_PEDIDO);
            stmt.setString(1, pedido.getNumeroPedido());
            stmt.setDouble(2, pedido.getImporteTotal());
            stmt.setString(3, pedido.getTipoPago());
            stmt.setInt(4, pedido.getIdUsuario());
            stmt.setString(5, pedido.getFecha().toString());
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {

            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }

    public int obtenerIdPedido(Pedido pedido) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int idPedido = 0;
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(SELECT_ID_PEDIDO);
            stmt.setString(1, pedido.getNumeroPedido());
            rs = stmt.executeQuery();

            while (rs.next()) {
                idPedido = rs.getInt("id_pedido");
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return idPedido;
    }

    public List<Pedido> obtenerPedidos(int idUsuario) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Pedido> pedidos=new ArrayList();
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(SELECT_PEDIDO);
            stmt.setInt(1, idUsuario);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int idPedido = rs.getInt("id_pedido");
                String numeroPedido = rs.getString("numero_pedido");
                double importeTotal = rs.getDouble("importe_total");
                String tipoPago = rs.getString("tipo_pago");
                String fecha = rs.getString("fecha");
                Pedido pedido = new Pedido(idPedido,numeroPedido,importeTotal,tipoPago,idUsuario,fecha);
                pedidos.add(pedido);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return pedidos;
    }
    
    
}
