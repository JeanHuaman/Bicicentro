package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Marca;


public class MarcaDaoJDBC {
    private static final String SELECT_MARCA_BY_ID = "SELECT nombre_marca FROM marca WHERE id_marca=?";
    private static final String SELECT_MARCA = "SELECT id_marca, nombre_marca FROM marca";

    
    
    public String getNombreMarca(int idMarca){
        Connection conn=null;
        PreparedStatement stmt=null;
        ResultSet rs=null;
        String nombreMarca=null;
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(SELECT_MARCA_BY_ID);
            stmt.setInt(1, idMarca);
            rs = stmt.executeQuery();
            rs.next();
            nombreMarca = rs.getString("nombre_marca");
                                    
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }finally{
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return nombreMarca;
    }
    
    public List<Marca> getListaMarca(){
        Connection conn=null;
        PreparedStatement stmt=null;
        ResultSet rs=null;
        Marca marca=null;
        List<Marca> marcas=new ArrayList();
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(SELECT_MARCA);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                String nombreMarca = rs.getString("nombre_marca");
                int idMarca= rs.getInt("id_marca");
                
                marca = new Marca(idMarca,nombreMarca);
                marcas.add(marca);
            }
                                    
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }finally{
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return marcas;
    }
    
    
}
