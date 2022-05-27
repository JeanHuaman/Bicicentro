<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modelo.Usuario"%>
<%@page import="datos.MarcaDaoJDBC"%>
<%@page import="datos.CategoriaDaoJDBC"%>
<%@page import="modelo.Producto"%>
<%@page import="java.util.List"%>
<%@page import="datos.ProductoDaoJDBC"%>
<%
    List<Producto> productos = new ProductoDaoJDBC().listar();
%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catalogo de Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light nav nav-tabs" >
            <div>
                <img src="${pageContext.request.contextPath}/img/Logo.png" alt="BiciCentro">
            </div>
            <div>
                <h1>BiciCentro</h1>     
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/vista/pedido.jsp" >Ver Pedido</a>  
            </div>
            <%
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                if (usuario != null) {
            %>            
            <div class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <%= usuario.getUser()%>
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/vista/editarUsuario.jsp">Datos Personales</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/PedidoControlador?accion=historial&idUsuario=<%= usuario.getIdUsuario() %>">Ver Historial</a></li>
                    <li><a class="dropdown-item" href="#">Cerrar Sesión</a></li>
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
        <div class="container mt-4 g-3">
            <div class="d-flex flex-wrap gap-4">
                <%for (Producto producto : productos) {
                %>
                <div class="card col-3">
                    <div class="card-header">
                        <label class="col-sm-12"><%= producto.getNombre()%></label>                                    
                    </div>
                    <div class="card-body text-center d-flex">                        
                        <img src="${pageContext.request.contextPath}/<%= producto.getImagen()%>" width="200" height="170">
                    </div>
                    <div class="card-footer">
                        <div class="col-sm-12 my-2">
                            <label><%= producto.getDescripcion()%></label>                                   
                        </div>
                        <div class=" col-sm-12 row align-items-center">                                
                            <a href="${pageContext.request.contextPath}/UsuarioControlador?accion=agregarCarrito&idProducto=<%= producto.getIdProducto() %>" class="btn btn-primary col">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                            <span class="col-3"><%= producto.getPrecio()%> </span>
                        </div>                         
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>


</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
