<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <header class="bg-success bg-gradient py-2">
            <h1 class="text-center container">Editar Producto</h1>
        </header>
        <main class="container mt-3">
            <form action="${pageContext.request.contextPath}/ProductoControlador?accion=modificar&idProducto=${producto.idProducto}" method="POST">
                <div>
                    <div class="mb-3">
                        <label  for="nombre">Nombre</label>
                        <input class="form-control" type="text" name="nombre" value="${producto.nombre}"/>
                    </div>
                    <div class="mb-3">
                        <label  class="form-label" for="categoria">Categoria</label>
                        <input class="form-control" type="text" name="categoria" value="${producto.idCategoria}"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="marca">Marca</label>
                        <input class="form-control" type="text" name="marca" value="${producto.idMarca}"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="cantidad">Cantidad</label>
                        <input class="form-control" type="number" name="cantidad" value="${producto.cantidad}"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="precio">Precio</label>
                        <input class="form-control" type="number" name="precio" value="${producto.precio}" step="any"/>
                    </div>
                </div>
                <div class="d-grid">
                    <button class="btn btn-primary " type="submit">Guardar</button>
                </div>

            </form>
        </main>  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
