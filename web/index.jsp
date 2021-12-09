<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="shortcut icon" href="./imgs/icono.png" type="image/x-icon" />
        <!-- fonts google -->
        <!-- Roboto -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;400;500;700&display=swap"
            rel="stylesheet"
            />
        <!-- Rubik -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700;800;900&display=swap"
            rel="stylesheet"
            />
        <!-- boostrap -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
            crossorigin="anonymous"
            />
        <!-- custom css -->
        <link rel="stylesheet" href="./css/styles.css" />
        <title>Login</title>
    </head>
    <style>
        html {
            font-size: 82%;
        }
        body{
            overflow: hidden;
        }
        @media screen and (min-width: 1440px) {
            html {
                font-size: 100%;
            }
        }
    </style>
    <body>
        <div class="container-fluid row container_login p-0 h-100 m-0">
            <div
                class="
                col-12 col-md-5
                h-100
                px-5
                py-3
                container_login_imagen
                z-index-pri
                "
                >
                <img src="imgs/Logo.png" alt="Logo" class="logo"/>
                <div class="login_cards d-none d-md-grid">
                    <div class="login_card">
                        <img src="./imgs/iconos/icon-medicina.svg" alt="medicina" />
                        <h4>Distribuidora farmaceutica</h4>
                    </div>
                    <div class="login_card">
                        <img src="./imgs/iconos/icon-cash.svg" alt="cash" />
                        <h4>Ventas al por mayor y menor</h4>
                    </div>
                </div>
            </div>
            <div
                class="
                col-12
                px-md-5
                h-100
                bottom-0
                start-0
                end-0
                col-md-7
                container_login_formulario
                "
                >
                <img src="./imgs/blob-orange.svg" alt="" class="blob-orange" />
                <div class="subcontainer_login_formulario px-3 px-md-5">
                    <h3 class="title_login h3-rubick f-prin">Bienvenido al sistema</h3>
                    <h5 class="subtitle_login">
                        Inicia sesión para obtener las diferentes utilidades
                    </h5>
                    <form action="ServletLogin" method="post">
                        <table class="table">
                            <tr>
                            <div class="form-floating mb-3">
                                <input
                                    type="text"
                                    name="txtUsu"
                                    class="form-control"
                                    placeholder="Usuario"
                                    />
                                <label for="floatingInput">Usuario</label>
                            </div>
                            </tr>
                            <tr>
                            <div class="form-floating">
                                <input
                                    type="password"
                                    name="txtPas"
                                    class="form-control"
                                    placeholder="Contraseña"
                                    />
                                <label for="floatingPassword">Contraseña</label>
                            </div>
                            </tr>
                            <tr>
                            <input type="submit" name="btn" value="Iniciar Sesion" class="btn_login button">
                            </tr>
                        </table>
                    </form>
                    <%
                        if (request.getAttribute("msg") != null) {
                            String msg = request.getAttribute("msg").toString();
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%=msg%>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
