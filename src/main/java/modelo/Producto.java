package modelo;

import java.io.InputStream;

public class Producto {
   private int idProducto;
   private String nombre;
   private String imagen;
   private int idMarca;
   private int idCategoria;
   private int cantidad;
   private double precio;
   
   

    public Producto() {
    }

    public Producto(int idProducto) {
        this.idProducto = idProducto;
    }

    public Producto(int idProducto, String nombre, String imagen, int idMarca, int idCategoria, int cantidad, double precio) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.imagen = imagen;
        this.idMarca = idMarca;
        this.idCategoria = idCategoria;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    

    public Producto(String nombre, String imagen, int idMarca, int idCategoria, int cantidad, double precio) {
        this.nombre = nombre;
        this.imagen = imagen;
        this.idMarca = idMarca;
        this.idCategoria = idCategoria;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public Producto(int idProducto, String nombre_producto, int idMarca, int idCategoria, int cantidad, double precio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Producto(String nombre, int idmarca, int idcategoria, int cantidad, double precio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }


    
    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", nombre=" + nombre + ",imagen=" + imagen + " ,precio=" + precio + ", cantidad=" + cantidad + ", idMarca=" + idMarca + ", idCategoria=" + idCategoria + '}';
    }    

    void set(InputStream binaryStream) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   
}
