<%-- 
    Document   : detallePedido
    Created on : 26 may. 2022, 20:17:56
    Author     : JEAN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/estilos/style.css" rel="stylesheet" type="text/css" />
        <title>Detalle De Pedido</title>
    </head>
    <body>
        <header>
            <div class="container mx-auto row my-2">
                <div class="col-12 col-sm-2">
                    <a href="${pageContext.request.contextPath}/vista/historial.jsp" class="btn btn-primary fs-3">Regresar</a>
                </div>
                <h1 class=" col-12 col-sm-8 inline text-center">Detalle del Pedido</h1>
            </div>
        </header>
        <main>
            <section class="row container mx-auto mt-4">
                <article class="col-12 col-sm-6">
                    <h2># ${numeroPedido}</h2>
                    <h3>Datos del Pedido</h3>
                    <p>Despachado por: BiciCentro</p>
                    <p>Entregado por Delivery</p>
                    <p>Carretera Central S/N Av-Las Anemonas</p>
                    <p>Peña Romero, ALexis A.</p>
                    <p>Correo@gmail.com</p>   
                </article>
                <article class="col-12 col-sm-6">
                    <h2 class="text-center">Resumen</h2>
                    <div class="resumen fs-4">
                        <!--ForEach -->
                        <c:forEach var="producto" items="${detalleProductos}">
                            <p class="row justify-content-between">
                                <span class="col-4">${producto.getNombreProducto()}</span>
                                <span class="col-4 text-right">S/. ${producto.getSubtotal()}</span>
                            </p> 
                        </c:forEach>
                    </div>
                    <span class="linea"></span>
                    <div class="row justify-content-between fs-4">
                        <span class="col-4">Total : </span>
                        <span class="col-4 text-right">S/. ${total}</span>
                    </div>
                </article>
            </section>

        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
