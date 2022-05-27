<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="d-flex">
                <div>
                    <img src="${pageContext.request.contextPath}/imagen/logo.png">
                </div>
                <h1>BiciCentro</h1>
                <div>
                    <a href="${pageContext.request.contextPath}/index.jsp">Ir a catálogo</a>
                </div>
            </nav>
        </header>
        <main>
            <h2>HISTORIAL</h2>
            <c:forEach var="pedido"  items="${pedidos}"> 
                <article>
                    <div>
                        <span>Pedido # ${pedido.getNumeroPedido()}</span>
                    </div>
                    <div>
                        <div>
                            <time>${pedido.getFecha()}</time>
                        </div>
                        <p>Despachado por Bicicentro</p>
                        <div>
                            <a href="${pageContext.request.contextPath}/vista/detallePedido.jsp">Ver Detalle</a>
                        </div>
                    </div>
                    <div>
                        <span>$ ${pedido.getImporteTotal()}</span>
                    </div>
                </article>
            </c:forEach>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
