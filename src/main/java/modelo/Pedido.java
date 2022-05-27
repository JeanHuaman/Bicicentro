
package modelo;



public class Pedido {
    private int idPedido;
    private String numeroPedido;
    private double importeTotal;
    private String tipoPago;
    private int idUsuario;
    private String fecha;

    public Pedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public Pedido(int idPedido, String numeroPedido, double importeTotal, String tipoPago, int idUsuario, String fecha) {
        this.idPedido = idPedido;
        this.numeroPedido = numeroPedido;
        this.importeTotal = importeTotal;
        this.tipoPago = tipoPago;
        this.idUsuario = idUsuario;
        this.fecha = fecha;
    }

    public Pedido(String numeroPedido, double importeTotal, String tipoPago, int idUsuario, String fecha) {
        this.numeroPedido = numeroPedido;
        this.importeTotal = importeTotal;
        this.tipoPago = tipoPago;
        this.idUsuario = idUsuario;
        this.fecha = fecha;
    }

    

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public String getNumeroPedido() {
        return numeroPedido;
    }

    public void setNumeroPedido(String numeroPedido) {
        this.numeroPedido = numeroPedido;
    }

    public double getImporteTotal() {
        return importeTotal;
    }

    public void setImporteTotal(double importeTotal) {
        this.importeTotal = importeTotal;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    
}
