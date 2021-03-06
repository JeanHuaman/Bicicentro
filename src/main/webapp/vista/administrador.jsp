<%@page import="modelo.Categoria"%>
<%@page import="modelo.Marca"%>
<%@page import="datos.MarcaDaoJDBC"%>
<%@page import="datos.CategoriaDaoJDBC"%>
<%@page import="modelo.Producto"%>
<%@page import="java.util.List"%>

<%
    List<Marca> marcas = new MarcaDaoJDBC().getListaMarca();
    List<Categoria> categorias = new CategoriaDaoJDBC().getListaCategoria();
%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Administrador de Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/estilos/style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <header class="bg-success bg-gradient py-2">
            <div class="container mx-auto row">
                <div class="col-12 col-sm-2">
                    <img src="${pageContext.request.contextPath}/img/Logo.png" alt="logo" class="logo">
                </div>
                <h1 class=" col-12 col-sm-8 inline text-center">BiciCentro</h1>
            </div>
        </header>
        <main>
            <section class="container mt-3">
                <h2 class="text-center">Buscar Producto</h2>
                <article>
                    <div class="py-3">
                        <form class="row justify-content-center align-items-center" action="${pageContext.request.contextPath}/ProductoControlador?accion=buscar" method="POST">
                            <div class="col-6 col-sm-4 d-flex flex-column">
                                <input type="text" name="buscarProducto" />
                            </div>
                            <div class="col-2">
                                <button class="bg-primary btn btn-primary" type="submit">Buscar</button>
                            </div>
                        </form>
                    </div>
                    <div>
                        <div class="container">
                            <table class="table">
                                <thead>
                                    <tr >
                                        <th >Codigo</th>
                                        <th>Nombre</th>
                                        <th >Categoria</th>
                                        <th>Marca</th>
                                        <th >Precio</th>
                                        <th >Acci?n</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<Producto> listaProductos = (List<Producto>) request.getAttribute("productos");
                                        if (listaProductos != null) {
                                            for (Producto producto : listaProductos) {
                                    %>
                                    <tr>
                                        <td><%= producto.getIdProducto()%></td>
                                        <td><%= producto.getNombre()%></td>
                                        <td><%= new CategoriaDaoJDBC().getNombreCategoria(producto.getIdCategoria())%></td>
                                        <td><%= new MarcaDaoJDBC().getNombreMarca(producto.getIdMarca())%></td>
                                        <td>$<%= producto.getPrecio()%></td>
                                        <td class="row">
                                            <div class="col-4">
                                                <a class="btn btn-success" href="${pageContext.request.contextPath}/ProductoControlador?accion=editar&idProducto=<%= producto.getIdProducto()%>">Editar</a>
                                            </div>
                                            <div class="col-4">
                                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/ProductoControlador?accion=eliminar&idProducto=<%= producto.getIdProducto()%>">Eliminar</a>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>                                
                                </tbody>
                            </table>
                        </div>
                        <div>
                            <h2 class="text-center">Agregar Producto</h2>
                            <form action="${pageContext.request.contextPath}/ProductoControlador?accion=agregarProducto" method="POST">
                                <div>
                                    <div class="container-fluid">
                                        <div class="row justify-content-between my-4">
                                            <div class="mb-3 col-12 col-md-4">
                                                <label class="form-label" for="nombre">Nombre</label>
                                                <input class="form-control" type="text" name="nombre"/>
                                            </div>
                                            <div class="mb-3 col-12 col-md-4"> 
                                                <label class="form-label" for="marca">Marca</label>
                                                <select class="form-select" name="marca">
                                                    <%
                                                        for (Marca marca : marcas) {
                                                    %>
                                                    <option value="<%= marca.getIdMarca()%>"><%= marca.getNombreMarca()%> </option>
                                                    <%
                                                        }
                                                    %>                                                    
                                                </select>
                                            </div> 
                                            <div class="mb-3 col-12 col-md-4">
                                                <label class="form-label" for="imagen">Imagen</label>
                                                <select class="form-select" name="imagen">
                                                    <option value="img/biciGras.jpg">Monta?era</option>
                                                    <option value="img/biciNaranja.jpg">Bmx</option>
                                                    <option value="img/biciNegroRojo.jpg">Bicicleta Plegable</option>
                                                    <option value="img/biciRojo.jpg">Triatl?n</option>
                                                    <option value="img/biciVerdeAzul.jpg">paseo</option>
                                                </select>
                                            </div>
                                            <div class="col-12 col-md-4">
                                                <label class="form-label" for="imagen">Categoria</label>
                                                <select class="form-select" name="categoria">
                                                    <%
                                                        for (Categoria categoria : categorias) {
                                                    %>
                                                    <option value="<%= categoria.getIdCategoria()%>" selected="<%= new CategoriaDaoJDBC().getNombreCategoria(categoria.getIdCategoria())%>"><%= categoria.getNombreCategoria()%> </option>
                                                    <%
                                                        }
                                                    %> 
                                                </select>
                                            </div>
                                            <div class="col-12 col-md-4">
                                                <label class="form-label" for="precio">Precio</label>
                                                <input class="form-control" type="number" name="precio" step="any"/>
                                            </div >
                                            <div class="col-12 col-md-4">
                                                <label class="form-label" for="cantidad">Cantidad</label>
                                                <input class="form-control" type="number" name="cantidad"/>
                                            </div> 
                                        </div>
                                        <div >
                                            <textarea class="col-12" name="descripcion" placeholder="Escribe una descripci?n"></textarea>                                            
                                        </div>
                                        <div class="mb-3">
                                            <input class="btn btn-primary col-12 mx-auto" type="submit" value="Agregar"/>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                </article>
            </section>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
