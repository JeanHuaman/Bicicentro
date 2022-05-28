<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modelo.Usuario"%>
<%
    /*  Usuario usuario = (Usuario) session.getAttribute("usuario");
    
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
    }*/


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resumen de Pedido</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <header class="p-3">
            <nav>
                <div>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/index.jsp">Ir al catálogo</a>
                </div>
                <%                Usuario usuario = (Usuario) session.getAttribute("usuario");
                    if (usuario != null) {
                %>            
                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <%= usuario.getUser()%>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/vista/editarUsuario.jsp">Datos Personales</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/PedidoControlador?accion=historial&idUsuario=<%= usuario.getIdUsuario()%>">Ver Historial</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/UsuarioControlador?accion=cerrarSesion">Cerrar Sesión</a></li>
                    </ul>
                </div>
                <%
                } else {
                %>
                <div>
                    <a href="${pageContext.request.contextPath}/vista/login.jsp">Iniciar Sesión</a>
                </div>
                <%
                    }
                %>
            </nav>
        </header>
        <main>
            <section>
                <form class="row justify-content-around" action="${pageContext.request.contextPath}/PedidoControlador?accion=guardarPedido" method="POST">
                    <article class="col-5">
                        <div><h2>Ya casi terminas</h2></div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">¿En dónde enviamos el pedido?</label>
                            <input type="text" name="direccion" class="form-control" value="${usuario.getDireccion()}">
                        </div>
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre completo</label>
                            <input type="text" name="nombre" class="form-control" value="${usuario.getNombre()}">
                        </div>
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellido completo</label>
                            <input type="text" name="apellido" class="form-control" value="${usuario.getApellido()}">
                        </div>
                        <div class="mb-3">
                            <label for="dni" class="form-label">Documento de identidad</label>
                            <input type="text" name="dni" class="form-control" value="${usuario.getDni()}">
                        </div>
                        <div class="mb-3">
                            <label for="celular" class="form-label">Celular</label>
                            <input type="text" name="celular" class="form-control" value="${usuario.getCelular()}">
                        </div>
                        <div class="mb-3 row justify-content-between">
                            <label for="pago" class="form-label col-4">Tipo de Pago</label>
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
                                                    <a href="${pageContext.request.contextPath}/UsuarioControlador?accion=retirarProducto&idProducto=${producto.getIdProducto()}">Eliminar</a>
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
                            <c:if test="${usuario==null}">
                                <div>
                                    <p>Necesita Iniciar sesión para realizar la compra</p>
                                </div>  
                            </c:if>
                            <c:if test="${comprado}">
                                <div>
                                    <p>Se realizo correctamente la compra</p>
                                </div>  
                            </c:if>

                        </div>
                    </article>
                </form>
            </section>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
