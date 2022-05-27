<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="../estilos/style.css" rel="stylesheet" >
        <link href="./estilos/style.css" rel="stylesheet" >
        <title>Login de usuario</title>
    </head>
    <body>
        <div class="centrado">
            <main class="contenedor text-center">
                <h1>Login</h1>
                <div>
                    <img class="login-img" src="${pageContext.request.contextPath}/img/user.png">    
                </div>
                <form action="${pageContext.request.contextPath}/UsuarioControlador?accion=iniciarSesion" method="POST">
                    <div class="mb-3 text-start">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="password" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>                
                    <button type="submit" class="button btn btn-primary">Ingresar</button>
                    <div>
                        <a class="button btn btn-primary" href="${pageContext.request.contextPath}/vista/registro.jsp">Registrarse</a> 
                    </div>
                </form>
                <%
                    String isLogeado = (String) request.getAttribute("errorLogin");
                    if (isLogeado != null) {
                        if (isLogeado.toString().equals("error")) {
                %> 
                <div class="alert alert-success d-flex align-items-center" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                    <div>
                        Email o contraseña inválidos.
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
