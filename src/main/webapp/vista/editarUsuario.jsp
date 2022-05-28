<%@page import="modelo.Usuario"%>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario.getApellido() == null) {
        usuario.setApellido("");
    }
    if (usuario.getNombre() == null) {
        usuario.setNombre("");
    }
    if (usuario.getCelular() == null) {
        usuario.setCelular("");
    }
    if (usuario.getDireccion() == null) {
        usuario.setDireccion("");
    }
    if (usuario.getDni() == null) {
        usuario.setDni("");
    }


%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Datos del usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/estilos/style.css" rel="stylesheet" type="text/css" />
    </head>
    <body> 
        <header class="bg-light bg-gradient py-2">
            <div class="container mx-auto row">
                <div class="col-12 col-sm-2">
                    <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary">Ir a catálogo</a>
                </div>
                <h1 class=" col-12 col-sm-8 inline text-center">Datos del usuario</h1>
            </div>
        </header>
        <main>            
            <form class="container mt-4" action="${pageContext.request.contextPath}/UsuarioControlador?accion=actualizarUsuario" method="POST">
                <div class="row">
                    <div class="mb-3 col-12 col-sm-6">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" name="nombre" class="form-control" value="<%= usuario.getNombre()%>">
                    </div>
                    <div class="mb-3 col-12 col-sm-6">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="apellido" name="apellido" class="form-control" value="<%= usuario.getApellido()%>">
                    </div>
                    <div class="mb-3 col-12 col-sm-4">
                        <label for="celular" class="form-label">Celular</label>
                        <input type="text" name="celular" class="form-control" value="<%= usuario.getCelular()%>">
                    </div>
                    <div class="mb-3 col-12 col-sm-4">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" name="email" value="<%= usuario.getEmail()%>">
                    </div>
                    <div class="mb-3 col-12 col-sm-4">
                        <label for="dni" class="form-label">DNI</label>
                        <input type="text" class="form-control" name="dni" value="<%= usuario.getDni()%>">
                    </div>
                    <div class="mb-3 col-12">
                        <label for="direccion" class="form-label">Direccion</label>
                        <input type="text" name="direccion" class="form-control" value="<%= usuario.getDireccion()%>">
                    </div>
                </div>                
                <div class="row justify-content-center px-2 my-4">
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
                <%
                    Integer actualizado = (Integer) request.getAttribute("actualizado");
                    if (actualizado != null) {
                        if (actualizado.toString().equals("1")) {
                %> 
                <div class="alert alert-success d-flex justify-content-center" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                    <div>
                        Se actualizó correctamente tus datos. 
                    </div>
                </div>
                <%
                        }
                    }
                %>   
            </form>

        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
