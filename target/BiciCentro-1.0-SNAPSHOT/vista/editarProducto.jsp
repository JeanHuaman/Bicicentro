<%@page import="modelo.Producto"%>
<%@page import="modelo.Categoria"%>
<%@page import="datos.CategoriaDaoJDBC"%>
<%@page import="modelo.Marca"%>
<%@page import="datos.MarcaDaoJDBC"%>
<%@page import="java.util.List"%>
<%
    List<Marca> marcas = new MarcaDaoJDBC().getListaMarca();
    List<Categoria> categorias = new CategoriaDaoJDBC().getListaCategoria();
    
    
%>
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
       <%
         Producto producto = (Producto)request.getAttribute("producto");  
       %>
        <main class="container mt-3">
            <form action="${pageContext.request.contextPath}/ProductoControlador?accion=modificar&idProducto=<%= producto.getIdProducto() %>" method="POST">
                <div>
                    <div class="mb-3">
                        <label  for="nombre">Nombre</label>
                        <input class="form-control" type="text" name="nombre" value="<%= producto.getNombre() %>"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="imagen">Categoria</label>
                        <select class="form-select" name="categoria">
                            <%
                                for (Categoria categoria : categorias) {
                                    if(categoria.getIdCategoria() == producto.getIdCategoria())
                                    {
                            %>
                            <option value="<%= categoria.getIdCategoria()%>" selected><%= categoria.getNombreCategoria()%> </option>
                            <%
                                }else{
                            %>
                            <option value="<%= categoria.getIdCategoria()%>"><%= categoria.getNombreCategoria()%> </option>
                            <%
                                }}
                            %> 
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="marca">Marca</label>
                        <select class="form-select" name="marca">
                            <%
                                for (Marca marca : marcas) {
                                    if(marca.getIdMarca() == producto.getIdCategoria())
                                    {
                            %>
                            <option value="<%= marca.getIdMarca()%>" selected><%= marca.getNombreMarca() %> </option>
                            <%
                                }else{
                            %>
                            <option value="<%= marca.getIdMarca()%>"><%= marca.getNombreMarca()%> </option>
                            <%
                                }}
                            %>                                                    
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="cantidad">Cantidad</label>
                        <input class="form-control" type="number" name="cantidad" value="<%= producto.getCantidad() %>"/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="precio">Precio</label>
                        <input class="form-control" type="number" name="precio" value="<%= producto.getPrecio() %>" step="any"/>
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
