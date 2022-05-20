
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador de Productos</title>
    </head>
    <body>
        <header>
            <div>
                <img src="#"></img>
            </div>
            <h1>BiciCentro</h1>
        </header>
        <main>
            <section>
                <article>
                    <div>
                        <form action="/BiciCentro/ProductoControlador?accion=buscar" method="POST">
                            <div>
                                <input type="text" name="buscarProducto" />
                            </div>
                            <button type="submit">Buscar</button>
                        </form>
                    </div>
                    <div>
                        <div>
                            <table border="1">
                                <thead>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Descripciónd</th>
                                <th>Precio</th>
                                <th>Acción</th>
                                </thead>
                                <tbody>
                                <c:forEach var="producto" items="${productos}" >
                                    <tr>
                                        <td>${producto.idProducto}</td>
                                        <td>${producto.nombre}</td>
                                        <td>${producto.idMarca} ${producto.idCategoria}</td>
                                        <td>${producto.precio}</td>
                                        <td>
                                            <div>
                                                <a href="${pageContext.request.contextPath}/ProductoControlador?accion=editar&idProducto=${producto.idProducto}">Editar</a>                                                
                                            </div>
                                            <div>
                                                <a href="${pageContext.request.contextPath}/ProductoControlador?accion=eliminar&idProducto=${producto.idProducto}">Eliminar</a>                                                
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div>
                            <form action="${pageContext.request.contextPath}/ProductoControlador?accion=agregarProducto">
                                <div>
                                    <div>
                                        <div>
                                            <div>
                                                <label for="nombre">Nombre</label>
                                                <input type="text" name="nombre"/>
                                            </div>
                                            <div>
                                                <select>
                                                    <c:forEach var="marca" items="${marcas}">
                                                        <option value="${marca.idMarca}">${marca.nombreMarca}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div>
                                                <label for="nombre">Nombre</label>
                                                <input type="image" name="nombre"/>
                                            </div>
                                        </div>
                                        <div>
                                            <div>
                                                <select>
                                                    <c:forEach var="categoria" items="${categorias}">
                                                        <option value="${categoria.idCategoria}">${categoria.nombreCategoria}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div>
                                                <label for="precio">Precio</label>
                                                <input type="number" name="precio"/>
                                            </div>                                                                                        
                                        </div>
                                        <div>
                                            <textarea name="descripcion"></textarea>
                                        </div>
                                    </div>
                                    <div>
                                        <input type="submit" value="Agregar"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </article>
                <article></article>
            </section>
        </main>
    </body>
</html>
