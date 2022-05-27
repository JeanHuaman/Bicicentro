
package modelo;


public class DetallePedido {
    private int idDetalle;
    private String nombreProducto;
    private int cantidad;
    private int idPedido;
    private int idProducto;
    private double subtotal;

    public DetallePedido(int idDetalle) {
        this.idDetalle = idDetalle;
    }

    public DetallePedido(int idDetalle, String nombreProducto, int cantidad, int idPedido, int idProducto, double subtotal) {
        this.idDetalle = idDetalle;
        this.nombreProducto = nombreProducto;
        this.cantidad = cantidad;
        this.idPedido = idPedido;
        this.idProducto = idProducto;
        this.subtotal = subtotal;
    }

    public DetallePedido(String nombreProducto, int cantidad, int idPedido, int idProducto, double subtotal) {
        this.nombreProducto = nombreProducto;
        this.cantidad = cantidad;
        this.idPedido = idPedido;
        this.idProducto = idProducto;
        this.subtotal = subtotal;
    }

    public int getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(int idDetalle) {
        this.idDetalle = idDetalle;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }
    
    
    
}


