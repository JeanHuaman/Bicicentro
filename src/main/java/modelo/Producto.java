package modelo;

public class Producto {
   private int idProducto;
   private String nombre;
   private String imagen;
   private int idMarca;
   private int idCategoria;
   private int cantidad;
   private double precio;
   private String descripcion;

    public Producto(int idProducto, String nombre, String imagen, int idMarca, int idCategoria, int cantidad, double precio, String descripcion) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.imagen = imagen;
        this.idMarca = idMarca;
        this.idCategoria = idCategoria;
        this.cantidad = cantidad;
        this.precio = precio;
        this.descripcion = descripcion;
    }

   
   
   

    public Producto() {
    }

    public Producto(int idProducto) {
        this.idProducto = idProducto;
    }

    public Producto(String nombre, String imagen, int idMarca, int idCategoria, int cantidad, double precio, String descripcion) {
        this.nombre = nombre;
        this.imagen = imagen;
        this.idMarca = idMarca;
        this.idCategoria = idCategoria;
        this.cantidad = cantidad;
        this.precio = precio;
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
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

    
    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", nombre=" + nombre + ", precio=" + precio + ", cantidad=" + cantidad + ", idMarca=" + idMarca + ", idCategoria=" + idCategoria + '}';
    }    
   
}
