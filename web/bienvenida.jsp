<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="Beans.UsuarioBeans" %>
<%@page import="Beans.ClienteBeans" %>
<%@page import="Beans.ProductoBeans"%>
<%@page import="Beans.VentaBeans" %>
<%@page import="java.util.*" %>
<%
    String usuario = "";
    HttpSession sesionOk = request.getSession();
    usuario = (String) sesionOk.getAttribute("Usuarios");
    String perfil = "";
    perfil = (String) sesionOk.getAttribute("Perfiles");
%>
<!DOCTYPE html>
<html>
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
    <title>Bienvenida</title>
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
            col-12 col-md-12
            h-100
            px-5
            py-3
            container_login_imagen
            z-index-pri
            "
            >
            <div class="login_cards d-none d-md-grid">
                <div>
                    <h4>BIENVENIDO</h4>
                    <h3><%=usuario%></h3>
                </div>
                <div>
                    <h4>ENTRO AL PERFIL</h4>
                    <h3><%=perfil%></h3>
                </div>
                <div>
                <a class="active" href="ServletInicio?op=listar">
                    <h4>INGRESAR</h4>
                </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>