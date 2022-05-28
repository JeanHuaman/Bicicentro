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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light nav nav-tabs nav nav-pills nav-justified">
            <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">          
                    <li class="nav-item">
                         <img src="${pageContext.request.contextPath}/img/Logo.png" alt="BiciCentro">
                    </li> 
                </ul>
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <h1>BiciCentro</h1> 
                    </ul>                        
                <ul class="nav justify-content-center">
                 <li class="nav-item">
                 <a class="btn btn-primary " aria-current="page" href="${pageContext.request.contextPath}/vista/pedido.jsp">Ver Pedido</a>
                 </li>
                </ul>
                   <%
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                if (usuario != null) {
                    %>
                    <ul class="nav justify-content-center"> 
                        <li class="nav-item dropdown">
                              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false"><%= usuario.getUser()%></a>
                               <ul class="dropdown-menu">
                               <li><a class="dropdown-item" href="${pageContext.request.contextPath}/vista/editarUsuario.jsp">Datos Personales</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/PedidoControlador?accion=historial&idUsuario=<%= usuario.getIdUsuario() %>">Ver Historial</a></li>
                              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/UsuarioControlador?accion=cerrarSesion">Cerrar Sesión</a></li>
                         </ul>
                        </li>
                    </ul>
            <%
            } else {
            %>
              <ul class="nav justify-content-center">
            <li class="nav-item">
                <a class="btn btn-primary col" href="${pageContext.request.contextPath}/vista/login.jsp"><i class="fa-solid fa-arrow-right-to-bracket"></i> Iniciar Sesión</a>
                 </li>
                </ul>   
            <%
                }
            %>
              
            </div>
        </nav>
    <main>
        <c:if test="${comprado}">
            <div class="alert alert-success d-flex align-items-center" role="alert">
                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                <p>Se realizo correctamente la compra de tu pedido</p>
            </div>            
        </c:if>
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
                            <a href="${pageContext.request.contextPath}/UsuarioControlador?accion=agregarCarrito&idProducto=<%= producto.getIdProducto()%>" class="btn btn-primary col">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                            <span class="col-3"><%= producto.getPrecio()%> </span>
                        </div>                         
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </main>
</div>


</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
