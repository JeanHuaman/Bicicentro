<%-- 
    Document   : detallePedido
    Created on : 26 may. 2022, 20:17:56
    Author     : JEAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Detalle De Pedido</title>
    </head>
    <body>
        <header>
            <nav class="d-flex">                
                <h1>Detalle del Pedido</h1>
                <div>
                    <a href="${pageContext.request.contextPath}/vista/historial.jsp">Regresar</a>
                </div>
            </nav>
        </header>
                <main>
                    <section>
                        <article>
                          <h2>#90423582</h2>
                          <p>Despachado por: BiciCentro</p>
                          <p>Entregado por Delivery</p>
                          <p>Carretera Central S/N Av-Las Anemonas</p>
                          <p>Peña Romero, ALexis A.</p>
                          <p>Correo@gmail.com</p>   
                        </article>
                        <article>
                            <!--ForEach -->
                            <p>
                                <span>BMX</span>
                                <span>$240</span>
                            </p>
                            <span>---------</span>
                            <div>
                                <span>Total : </span>
                                <span>$248</span>
                            </div>
                        </article>
                    </section>
                    
                </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
