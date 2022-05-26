<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="./estilos/style.css" rel="stylesheet" >
        <link href="../estilos/style.css" rel="stylesheet" >
        <title>Registro</title>
    </head>
    <body>
        <div class="centrado">
            <main class="contenedor text-center">
                <h1>Registrarse</h1>
                <form action="${pageContext.request.contextPath}/UsuarioControlador?accion=agregarUsuario" method="POST">
                    <div class="mb-3 text-start">
                        <label for="usuario" class="form-label">Usuario</label>
                        <input type="text" class="form-control" id="usuario" name="usuario" aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3 text-start ">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3 text-start">
                        <label for="password" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" id="password" name="password">
                    </div>                                
                    <div>
                        <input type="submit" class="button btn btn-primary" value="Registrarse"/>
                    </div>
                    <div>
                        <a class="button btn btn-primary" href="${pageContext.request.contextPath}/vista/login.jsp" >Iniciar Sesión</a> 
                    </div>
                </form>
                <%
                    Integer idRegistro = (Integer) request.getAttribute("idRegistrado");
                    if (idRegistro!=null) {
                        if(idRegistro.toString().equals("1")){
                %> 
                <div class="alert alert-success d-flex align-items-center" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                    <div>
                        Se registró correctamente. 
                    </div>
                </div>
                <%
                    }}
                %>
            </main>  
        </div>       
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>

</html>
