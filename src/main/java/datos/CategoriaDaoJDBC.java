package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Categoria;



public class CategoriaDaoJDBC {
    private static final String SELECT_CATEGORIA_BY_ID = "SELECT nombre_categoria FROM categoria WHERE id_categoria=?";
    private static final String SELECT_CATEGORIA = "SELECT id_categoria, nombre_categoria FROM categoria";
    
    public String getNombreCategoria(int idCategoria){
        Connection conn=null;
        PreparedStatement stmt=null;
        ResultSet rs=null;
        String nombreCategoria=null;
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(SELECT_CATEGORIA_BY_ID);
            stmt.setInt(1, idCategoria);
            rs = stmt.executeQuery();
            rs.next();
            nombreCategoria = rs.getString("nombre_categoria");
                                    
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }finally{
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return nombreCategoria;
    }
        
      public List<Categoria> getListaCategoria(){
        Connection conn=null;
        PreparedStatement stmt=null;
        ResultSet rs=null;
        Categoria categoria=null;
        List<Categoria> categorias=new ArrayList();
        try {
            conn = Conexion.getConexion();
            stmt = conn.prepareStatement(SELECT_CATEGORIA);
            rs = stmt.executeQuery();
            while(rs.next())
            {
                String nombreCategoria = rs.getString("nombre_categoria");
                int idMarca= rs.getInt("id_categoria");
                
                categoria = new Categoria(idMarca,nombreCategoria);
                categorias.add(categoria);
            }
                                    
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }finally{
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return categorias;
    }   
}
