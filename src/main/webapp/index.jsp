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
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div>
                <a class="navbar-link" href="./Controlador?accion=Nuevo"> <img src="img/Logo.png" alt="BiciCentro"></a>
            </div>
            <div>
                <h1>BiciCentro</h1>     
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/vista/login.jsp">Iniciar Sesi�n</a>
            </div>


        </nav>
        <div class="container mt-4">
            <div class="row">
                <%
                    for (Producto producto : productos) {
                %>
                <div class="card col-4">
                    <div class="card-header">
                        <label class="col-sm-12"><%= producto.getNombre() %></label>                                    
                    </div>
                    <div class="card-body text-center d-flex">
                        <label><i class="fas fa-dollar-sign"><%= new CategoriaDaoJDBC().getNombreCategoria(producto.getIdCategoria()) %></i></label>
                        <img src="#" width="200" height="170">
                    </div>
                    <div class="card-footer">
                        <div class="col-sm-12">
                            <label><%= new MarcaDaoJDBC().getNombreMarca(producto.getIdMarca()) %></label>                                   
                        </div>
                        <div class=" col-sm-12 text-center">                                
                            <a href="Controlador?accion=AgregarCarrito&id=#" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                            <a href="Controlador?accion=Comprar&id=#" class="btn btn-danger">Comprar</a>
                        </div>                         
                    </div>
                </div>
                <% 
                    }  
                %>
                <c:forEach var="p" items="${productos}">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <div class="card">
                                <div class="card-header">
                                    <label class="col-sm-12">${p.getNombres()}</label>                                    
                                </div>
                                <div class="card-body text-center d-flex">
                                    <label><i class="fas fa-dollar-sign">${p.getPrecio()}</i></label>
                                    <img src="${p.getImagen()}" width="200" height="170">
                                </div>
                                <div class="card-footer">
                                    <div class="col-sm-12">
                                        <label>${p.getDescripcion()}</label>                                   
                                    </div>
                                    <div class=" col-sm-12 text-center">                                
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                    </div>                         
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Modal Iniciar Session o Registrarse -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="container col-lg-9">                   
                    <div class="modal-content">                   
                        <div class="pr-2 pt-1">                         
                            <button type="button" class="close" data-dismiss="modal">
                                <span aria-hidden="true">&times;</span>
                            </button>                    
                        </div>
                        <div class="text-center">                         
                            <img src="img/user.png" width="100" height="100">                         
                        </div>
                        <div class="modal-header text-center">                      
                            <ul class="nav nav-pills">                           
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="pill" href="#pills-iniciar">Iniciar Sesion</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="pill" href="#pills-registrar">Registrarse</a>
                                </li>                          
                            </ul>  
                        </div>
                        <div class="modal-body"> 
                            <div class="tab-content" id="pills-tabContent">
                                <!-- Iniciar Session -->
                                <div class="tab-pane fade show active" id="pills-iniciar" role="tabpanel">
                                    <form action="Controlador">
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                   
                                        <button type="submit" name="accion" value="Validar" class="btn btn-outline-danger btn-block">Iniciar</button>
                                    </form>
                                </div>
                                <!-- Registrarse -->
                                <div class="tab-pane fade" id="pills-registrar" role="tabpanel">
                                    <form action="Controlador">                               
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtnom" class="form-control" placeholder="Leo Perez">
                                        </div>
                                        <div class="form-group">
                                            <label>Dni</label>
                                            <input type="text" maxlength="8" name="txtdni" class="form-control" placeholder="01245678">
                                        </div>
                                        <div class="form-group">
                                            <label>Direccion</label>
                                            <input type="text" name="txtdire" class="form-control" placeholder="Chiclayo - La Victoria">
                                        </div>
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="txtemail" class="form-control" placeholder="email@example.com">
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpass" class="form-control" placeholder="Password">
                                        </div>                                  
                                        <button type="submit" name="accion" value="Registrar" class="btn btn-outline-danger btn-block">Crear Cuenta</button>
                                    </form>
                                </div>                          
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
