<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modelo.Usuario"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario.getApellido() == null) {
        usuario.setApellido("");
    }
    if (usuario.getNombre() == null) {
        usuario.setNombre("");
    }
    if (usuario.getCelular() == null) {
        usuario.setCelular("");
    }
    if (usuario.getDireccion() == null) {
        usuario.setDireccion("");
    }
    if (usuario.getDni() == null) {
        usuario.setDni("");
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resumen de Pedido</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <header class="p-3">
            <div>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/index.jsp">Ir al catálogo</a>
            </div>
        </header>
        <main>
            <section>
                <form class="row justify-content-around" action="${pageContext.request.contextPath}/PedidoControlador?accion=guardarPedido" method="POST">
                    <article class="col-5">
                        <div><h2>Ya casi terminas</h2></div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">¿En dónde enviamos el pedido?</label>
                            <input type="text" name="celular" class="form-control" value="<%= usuario.getDireccion()%>">
                        </div>
                        <div class="mb-3">
                            <label for="celular" class="form-label">Nombre completo</label>
                            <input type="text" name="celular" class="form-control" value="<%= usuario.getNombre()%> <%= usuario.getApellido()%>">
                        </div>
                        <div class="mb-3">
                            <label for="celular" class="form-label">Documento de identidad</label>
                            <input type="text" name="celular" class="form-control" value="<%= usuario.getDni()%>">
                        </div>
                        <div class="mb-3">
                            <label for="celular" class="form-label">Celular</label>
                            <input type="text" name="celular" class="form-control" value="<%= usuario.getCelular()%>">
                        </div>
                        <div class="mb-3 row justify-content-between">
                            <label for="celular" class="form-label col-4">Tipo de Pago</label>
                            <div class="col-5">
                                <select class="form-select" name="pago">           
                                    <option value="efectivo">Efectivo</option>
                                    <option value="tarjeta">Tarjeta</option>
                                </select>
                            </div>                            
                        </div>
                    </article>
                    <article class="col-5">
                        <div><h1>Resumen del Pedido</h1></div>
                        <div>
                            <div>
                                <table>
                                    <thead>
                                    <th>Nombre del producto</th>
                                    <th>Cantidad</th>
                                    <th>SubTotal</th>
                                    </thead>
                                    <tbody>
                                        <!-- Aquí es el foreach-->
                                        <c:forEach var="producto" items="${carrito}">
                                            <tr>
                                                <td>${producto.getNombre()}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/UsuarioControlador?accion=actualizarCantidad&motivo=aumentar&idProducto=${producto.getIdProducto()}">+</a>
                                                    <input type="text" min="1" id="cantidad" value="${producto.getCantidad()}" />
                                                    <a href="${pageContext.request.contextPath}/UsuarioControlador?accion=actualizarCantidad&motivo=disminuir&idProducto=${producto.getIdProducto()}">-</a>
                                                </td>
                                                <td>$ ${producto.getPrecio() * producto.getCantidad()}</td>
                                            </tr> 
                                        </c:forEach>                                        
                                    </tbody>
                                </table>
                            </div>
                            <div>
                                <div>
                                    <span>Total a Pagar</span>
                                </div>
                                <div>
                                    <span>${total}</span>
                                </div>
                            </div>
                            <div>
                                <button type="submit">Finalizar Compra</button>
                            </div>
                        </div>
                    </article>
                </form>
            </section>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
