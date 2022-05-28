<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/estilos/style.css" rel="stylesheet" type="text/css" />
        <title>Historial</title>
    </head>
    <body>
        <header>
            <nav class="navbar-expand-lg navbar-light bg-light nav-tabs nav-pills nav-justified py-2">
                <div class="row " id="navbarTogglerDemo03">
                    <div class="col-12 container mx-auto row justify-content-between">
                        <div class="col-12 col-sm-6 col-lg-2">
                            <img src="${pageContext.request.contextPath}/img/Logo.png" alt="BiciCentro">
                        </div>
                        <h1 class=" col-12 col-sm-6 col-lg-7 inline text-center text-md-right text-lg-center ">BiciCentro</h1>
                        <div class="d-flex align-items-center col-12 justify-content-between col-lg-2 justify-content-lg-end ">
                            <div class="col-5 col-lg-12 text-right">
                                <a class="btn btn-primary px-1" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Ir a catálogo</a>
                            </div>                    
                        </div>
                    </div>        
                </div>
            </nav>
        </header>
        <main>
            <h2 class="text-center">HISTORIAL</h2>
            <section class="container">
                <c:forEach var="pedido"  items="${pedidos}"> 
                    <article class="fs-4 row border border-dark align-items-center my-4 py-4">
                        <div class="col-12 row col-sm-10 align-items-center">
                            <div class="col-12 col-lg-6">
                                <h3 >Pedido # ${pedido.getNumeroPedido()}</h3>
                                <div>
                                    <time>${pedido.getFecha()}</time>
                                </div>
                                <div class="col-12 px-0">
                                <span>$ ${pedido.getImporteTotal()}</span>
                            </div>
                            </div>                            
                            <p class="col-12 col-lg-6 mb-0">Despachado por Bicicentro</p>
                            
                        </div>
                        <div class="col-12 col-sm-2 text-sm-right">
                            <a href="${pageContext.request.contextPath}/DetallePedidoControlador?accion=detallePedido&numeroPedido=${pedido.getNumeroPedido()}&idPedido=${pedido.getIdPedido()}">Ver Detalle</a>
                        </div>

                    </article>
                </c:forEach>
            </section>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
