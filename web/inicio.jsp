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
        <title>Inicio</title>
    </head>
    <body>
        <!-- navbar -->
        <nav class="navbar d-none d-lg-grid position-fixed col-2 h-100" id="navbar">
            <img src="imgs/Logo.png" alt=""/>
            <div class="navbar_usuario">
                <span class="tipo-usuario text-body-1" id="tipo-usu">
                    Hola
                </span>
                <span class="nombre-usuario text-caption" id="nom-usu">
                    <%=usuario%>
                </span>
            </div>
            <ul class="navbar-links">
                <li>
                    <a class="active" href="ServletInicio?op=listar">
                        <svg class="icon-inicio" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path id="icon-inicio" d="M22.7313 12.3535V12.3536V21.6295C22.7313 21.9926 22.5869 22.3411 22.3295 22.5982C22.0721 22.8553 21.7227 23 21.3582 23H2.37313C2.0086 23 1.65922 22.8553 1.40179 22.5982C1.1444 22.3411 1 21.9926 1 21.6295V12.3536V12.3535C0.999946 11.8444 1.10393 11.3407 1.30563 10.8731C1.50732 10.4055 1.8025 9.98391 2.17312 9.63414L2.17323 9.63403L10.9218 1.37513L10.9219 1.375C11.1768 1.13429 11.5145 1 11.8657 1C12.2169 1 12.5545 1.13429 12.8094 1.375L12.8095 1.37513L21.5581 9.63403L21.5582 9.63414C21.9288 9.98391 22.224 10.4055 22.4257 10.8731C22.6274 11.3407 22.7314 11.8444 22.7313 12.3535Z" stroke="#004D61" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                        <span  class="h6">Inicio</span>
                    </a>
                    <div class="indicador">
                        <span></span>
                        <span></span>
                    </div>
                </li>
                <li>
                    <a href="ServletCRUDventas?txtIdV=V001&btn=Buscar&op=consultaId">
                        <svg class="icon-ventas" width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path id="icon-cash" d="M22.772 12.1688L22.7719 12.1688L22.7791 12.1618C23.0867 11.8623 23.2605 11.4455 23.2605 11.0068V2.4006C23.2605 1.49448 22.516 0.75 21.6099 0.75H13.0037C12.5639 0.75 12.1433 0.924842 11.8417 1.2265L1.243 11.8252C0.585213 12.4829 0.590101 13.5204 1.231 14.1613L9.83715 22.7675C10.4805 23.4108 11.53 23.4108 12.1733 22.7675L22.772 12.1688ZM21.1596 5.40135C21.1596 6.81181 20.0196 7.9518 18.6091 7.9518C17.1987 7.9518 16.0587 6.81181 16.0587 5.40135C16.0587 3.99089 17.1987 2.8509 18.6091 2.8509C20.0196 2.8509 21.1596 3.99089 21.1596 5.40135Z" stroke="white" stroke-width="1.5"/>
                        </svg>
                        <span  class="h6">Ventas</span>
                    </a>
                    <div class="indicador">
                        <span></span>
                        <span></span>
                    </div>
                </li>
                <li>
                    <a href="ServletCRUDclientes?txtIdC=C001&btn=Buscar&op=consultaId">
                        <svg class="icon-cliente" width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle id="Ellipse 1" cx="12.3684" cy="6.31579" r="5.31579" stroke="white" stroke-width="2"/>
                        <path id="Subtract" d="M23.7368 24C23.7368 17.7214 18.647 12.6316 12.3684 12.6316C6.08982 12.6316 1 17.7214 1 24" stroke="white" stroke-width="2"/>
                        </svg>
                        <span class="h6">Clientes</span>
                    </a>
                    <div class="indicador">
                        <span></span>
                        <span></span>
                    </div>
                </li>
                <li>
                    <%if (perfil.equals("Admin")) {%><a href="ServletCRUDproductos?txtIdP=P001&btn=Buscar&op=consultaId">
                        <svg class="icon-pedido" width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path id="icon-pedido" d="M12.3383 1.56188C12.1583 1.48977 11.9575 1.48977 11.7776 1.56188L2.78237 5.15966L6.40577 6.60812L15.6813 2.8988L12.3383 1.56188ZM17.7101 3.71121L8.43452 7.42053L12.0579 8.86898L21.3335 5.15966L17.7101 3.71121ZM22.6086 6.27351L12.8115 10.1923V22.1327L22.6086 18.2139V6.27502V6.27351ZM11.3043 22.1342V10.1908L1.50724 6.27351V18.2154L11.3043 22.1342ZM11.2184 0.161652C11.7573 -0.0538841 12.3585 -0.0538841 12.8975 0.161652L23.6426 4.4603C23.7823 4.51629 23.902 4.61283 23.9864 4.73747C24.0707 4.86211 24.1158 5.00916 24.1159 5.15966V18.2154C24.1157 18.5166 24.0252 18.8108 23.8563 19.0601C23.6873 19.3094 23.4475 19.5024 23.1678 19.6141L12.3383 23.9459C12.1583 24.018 11.9575 24.018 11.7776 23.9459L0.949562 19.6141C0.669594 19.5026 0.429477 19.3097 0.260213 19.0604C0.0909495 18.8111 0.000310988 18.5167 0 18.2154L0 5.15966C3.50282e-05 5.00916 0.0451324 4.86211 0.129483 4.73747C0.213833 4.61283 0.333572 4.51629 0.473274 4.4603L11.2184 0.161652Z" fill="white"/>
                        </svg>
                        <span class="h6">Productos</span>
                    </a><%}%>
                    <div class="indicador">
                        <span></span>
                        <span></span>
                    </div>
                </li>
                <li>
                    <%if (perfil.equals("Admin")) {%><a href="ServletCRUDempleados?txtIdU=A001&btn=Buscar&op=consultaId">
                        <svg class="icon-empleado" width="25" height="24" viewBox="0 0 25 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle id="Ellipse 1" cx="12.3684" cy="6.31579" r="5.31579" stroke="white" stroke-width="2"/>
                        <path id="Subtract" d="M23.7368 24C23.7368 17.7214 18.647 12.6316 12.3684 12.6316C6.08982 12.6316 1 17.7214 1 24" stroke="white" stroke-width="2"/>
                        </svg>
                        <span class="h6">Empleados</span>
                    </a><%}%>
                    <div class="indicador">
                        <span></span>
                        <span></span>
                    </div>
                </li>
            </ul>
            <form>
                <a href="ServletLogin"  class="btn text-light navbar_btn-cerrar_sesion" type="submit">
                    <svg class="icon-cerrarSesion" width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path id="Vector" d="M16 21.3333C15.6464 21.3333 15.3073 21.4738 15.0572 21.7239C14.8072 21.9739 14.6667 22.313 14.6667 22.6667C14.6667 23.0203 14.8072 23.3594 15.0572 23.6095C15.3073 23.8595 15.6464 24 16 24H22.6667C23.3739 24 24.0522 23.719 24.5523 23.219C25.0524 22.7189 25.3334 22.0406 25.3334 21.3333V2.66667C25.3334 1.95942 25.0524 1.28115 24.5523 0.781048C24.0522 0.280951 23.3739 0 22.6667 0H16C15.6464 0 15.3073 0.140476 15.0572 0.390524C14.8072 0.640573 14.6667 0.979711 14.6667 1.33333C14.6667 1.68696 14.8072 2.02609 15.0572 2.27614C15.3073 2.52619 15.6464 2.66667 16 2.66667H22.6667V21.3333H16Z" fill="white"/>
                    <path id="Vector_2" d="M18.2853 12.9333C18.5292 12.6854 18.6661 12.3518 18.6667 12.004V11.996C18.666 11.6437 18.5255 11.3061 18.276 11.0573L12.9427 5.72401C12.8197 5.59666 12.6725 5.49508 12.5099 5.4252C12.3472 5.35533 12.1722 5.31854 11.9952 5.31701C11.8182 5.31547 11.6426 5.3492 11.4787 5.41624C11.3149 5.48329 11.166 5.58229 11.0408 5.70748C10.9156 5.83267 10.8166 5.98154 10.7496 6.1454C10.6825 6.30926 10.6488 6.48484 10.6503 6.66188C10.6519 6.83891 10.6887 7.01387 10.7585 7.17655C10.8284 7.33922 10.93 7.48634 11.0573 7.60934L14.1147 10.6667H1.33333C0.979711 10.6667 0.640573 10.8071 0.390524 11.0572C0.140476 11.3072 0 11.6464 0 12C0 12.3536 0.140476 12.6928 0.390524 12.9428C0.640573 13.1929 0.979711 13.3333 1.33333 13.3333H14.1147L11.0573 16.3907C10.93 16.5137 10.8284 16.6608 10.7585 16.8235C10.6887 16.9861 10.6519 17.1611 10.6503 17.3381C10.6488 17.5152 10.6825 17.6907 10.7496 17.8546C10.8166 18.0185 10.9156 18.1673 11.0408 18.2925C11.166 18.4177 11.3149 18.5167 11.4787 18.5838C11.6426 18.6508 11.8182 18.6845 11.9952 18.683C12.1722 18.6815 12.3472 18.6447 12.5099 18.5748C12.6725 18.5049 12.8197 18.4034 12.9427 18.276L18.276 12.9427L18.2853 12.9333Z" fill="white"/>
                    </svg>
                    Cerrar sesión
                </a>
            </form>
        </nav>
        <div id="navbar-desplegar" onclick="quitarNavbar()" class=" d-lg-none">
            <div class="btn-logo">
                <svg width="19" height="16" viewBox="0 0 19 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path id="Subtract" fill-rule="evenodd" clip-rule="evenodd" d="M1.75453 1.12215C1.88109 0.954967 2.00727 0.77932 2.11206 0.626207C2.94463 1.29742 4.83997 2.4611 5.79641 1.77245C4.91829 1.72456 3.02811 1.30312 2.49126 0.00057892C2.49212 0.000195897 2.49291 0 2.49361 0C2.51001 0 3.39043 0.15858 4.45017 0.352308C6.79276 0.780709 8.16461 1.09949 9.50836 1.52769C11.463 2.15043 12.2363 2.60158 13.6834 3.96348C14.0754 4.33245 14.8125 4.91333 15.3212 5.25447C17.3406 6.60844 18.7643 7.93427 18.8556 8.54604C18.9031 8.86381 18.8715 8.94294 18.6245 9.12519C18.4435 9.25868 18.2393 9.59037 18.0694 10.027C17.6763 11.0367 17.641 11.0845 16.5436 12.0911C15.5708 12.9832 15.262 13.204 14.778 13.3529C14.567 13.4178 14.5489 13.3914 14.5489 13.0209C14.5489 12.7143 14.6214 12.5411 14.8532 12.2935C15.0205 12.1148 15.2102 11.7928 15.2748 11.5777C15.3766 11.2388 15.3621 11.113 15.1658 10.6306C14.5625 9.14754 12.7608 8.02194 10.9996 8.02773C10.1593 8.03047 9.59043 8.27144 9.19106 8.79371C8.92324 9.14389 8.89737 9.25025 8.89737 9.99997C8.89737 10.7281 8.93668 10.9018 9.24023 11.5177C9.64938 12.3474 10.6569 13.419 11.303 13.7115C11.7938 13.9337 12.5095 13.9814 12.6875 13.8039C12.7716 13.7199 12.8308 13.7931 12.9129 14.0832C13.0211 14.4645 13.0132 14.4859 12.6562 14.7898C12.2891 15.1022 11.3562 15.6098 10.6794 15.8653C10.4748 15.9425 9.91089 15.9999 9.35561 16C8.5034 16.0002 8.32764 15.968 7.87908 15.7299C7.08837 15.3101 6.47811 14.5751 6.34858 13.8865L6.27984 13.521L6.97656 13.4908C7.50944 13.4676 7.68041 13.4234 7.70342 13.3027C7.76992 12.9545 6.51049 11.9014 5.27652 11.2733C4.82969 11.0459 4.36351 10.6129 3.71282 9.82057C3.59127 9.67263 3.46929 9.53992 3.37749 9.45274C2.69001 6.36929 4.95236 4.62207 6.23096 4.11976C2.57313 4.57699 2.62149 8.13429 3.10866 9.88588C3.05556 9.95437 2.92268 9.95568 2.59035 9.95568C2.10014 9.95568 1.95901 10.0087 1.3579 10.4193C0.984598 10.6743 0.66587 10.8686 0.649783 10.8511C0.633591 10.8335 0.494796 10.3392 0.341338 9.7525C0.107539 8.85893 0.0549948 8.41377 0.01752 7.00961C-0.0236185 5.47095 -0.00651107 5.25315 0.225659 4.3549C0.529826 3.17799 1.08205 2.01044 1.75453 1.12215ZM12.1038 3.75827C12.3564 3.9203 12.7465 4.24234 12.9706 4.47396L13.3779 4.89505L12.9718 4.72834C12.3673 4.48026 11.6977 4.02535 11.2395 3.55154L10.8321 3.13045L11.2382 3.29716C11.4616 3.38879 11.851 3.59634 12.1038 3.75827Z" fill="white"/>
                </svg>
            </div>
            <button
                type="button"
                class="btn-close btn-close-white"
                aria-label="Close"
                onclick=""
                ></button>
        </div>
        <!-- \navbar -->
        <!-- seccion datos -->
        <section class="container_datos col-12 col-lg-10 offset-lg-2 h-100 px-3 px-lg-5">
            <!-- cards de datos -->
            <div class="container_cards_dashbord">
                <div class="card_dashbord">
                    <div class="cad_dashbord-datos">
                        <span id="cantidad_usuarios" class="h2">
                            <%
                                int CnUsuarios;
                                CnUsuarios = 0;
                                ArrayList<UsuarioBeans> lista
                                        = (ArrayList<UsuarioBeans>) request.getAttribute("lista");
                                for (int i = 0; i < lista.size(); i++) {
                                    CnUsuarios = CnUsuarios + 1;
                            %>
                            <%
                                }
                            %>
                            <%=CnUsuarios%>
                        </span>
                        <!-- icono card-->
                        <svg width="87" height="56" viewBox="0 0 87 56" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path id="Vector" d="M40.4503 39.1113C44.2675 36.5757 47.167 32.8785 48.7196 28.567C50.2723 24.2554 50.3956 19.5585 49.0712 15.1714C47.7469 10.7843 45.0454 6.94009 41.3665 4.20772C37.6875 1.47535 33.2267 0 28.644 0C24.0614 0 19.6005 1.47535 15.9216 4.20772C12.2427 6.94009 9.54113 10.7843 8.21682 15.1714C6.89252 19.5585 7.0158 24.2554 8.56843 28.567C10.1211 32.8785 13.0205 36.5757 16.8378 39.1113C10.3306 41.5117 4.70663 45.8328 0.711154 51.5021C0.493178 51.8074 0.337753 52.1529 0.253827 52.5186C0.169901 52.8843 0.159131 53.2629 0.222137 53.6328C0.285144 54.0026 0.420683 54.3564 0.620951 54.6736C0.821219 54.9909 1.08226 55.2654 1.38905 55.4814C1.69584 55.6973 2.04231 55.8505 2.40853 55.932C2.77475 56.0135 3.15348 56.0218 3.52291 55.9564C3.89234 55.891 4.24519 55.7531 4.56113 55.5508C4.87707 55.3484 5.14987 55.0856 5.36382 54.7774C7.98943 51.0422 11.4753 47.9936 15.527 45.8891C19.5787 43.7845 24.0773 42.6858 28.643 42.6857C33.2086 42.6855 37.7073 43.784 41.7591 45.8883C45.811 47.9926 49.297 51.041 51.9228 54.776C52.1377 55.0819 52.4109 55.3425 52.7265 55.5428C53.0422 55.7431 53.3943 55.8793 53.7627 55.9434C54.131 56.0076 54.5084 55.9985 54.8732 55.9167C55.238 55.8349 55.5832 55.682 55.8889 55.4668C56.1946 55.2515 56.4548 54.9781 56.6548 54.6622C56.8548 54.3462 56.9905 53.994 57.0542 53.6256C57.118 53.2572 57.1085 52.8798 57.0262 52.5151C56.944 52.1503 56.7907 51.8054 56.5751 51.4999C52.5798 45.8317 46.9565 41.5112 40.4503 39.111V39.1113ZM12.9963 21.3485C12.9963 18.2537 13.914 15.2284 15.6334 12.6552C17.3528 10.0819 19.7966 8.07634 22.6558 6.89201C25.515 5.70768 28.6612 5.39781 31.6965 6.00157C34.7319 6.60534 37.52 8.09562 39.7084 10.284C41.8967 12.4723 43.387 15.2605 43.9908 18.2958C44.5945 21.3311 44.2847 24.4773 43.1003 27.3366C41.916 30.1958 39.9104 32.6396 37.3372 34.359C34.764 36.0783 31.7387 36.9961 28.6439 36.9961C24.4953 36.9914 20.518 35.3413 17.5845 32.4078C14.6511 29.4743 13.001 25.497 12.9963 21.3485ZM84.8784 55.4645C84.5729 55.6796 84.2281 55.8325 83.8635 55.9143C83.499 55.9962 83.1219 56.0054 82.7538 55.9415C82.3857 55.8776 82.0337 55.7418 81.7181 55.5419C81.4025 55.342 81.1293 55.0818 80.9142 54.7763C78.2853 51.0447 74.7988 47.9988 70.7478 45.8949C66.6969 43.791 62.2 42.6905 57.6353 42.6861C56.8807 42.6861 56.1571 42.3863 55.6235 41.8528C55.09 41.3193 54.7902 40.5956 54.7902 39.8411C54.7902 39.0865 55.09 38.3629 55.6235 37.8293C56.1571 37.2958 56.8807 36.9961 57.6353 36.9961C59.8697 36.9935 62.0778 36.5125 64.1108 35.5853C66.1438 34.6581 67.9546 33.3062 69.4215 31.6206C70.8884 29.9351 71.9772 27.9549 72.6148 25.8133C73.2524 23.6717 73.4239 21.4184 73.1178 19.205C72.8117 16.9916 72.0351 14.8694 70.8402 12.9812C69.6454 11.093 68.06 9.48266 66.1907 8.25843C64.3215 7.0342 62.2117 6.22452 60.0034 5.88384C57.795 5.54317 55.5393 5.67942 53.388 6.28342C52.6627 6.48459 51.8872 6.3901 51.2313 6.02067C50.5755 5.65123 50.0928 5.03695 49.889 4.31236C49.6851 3.58777 49.7767 2.81192 50.1437 2.15474C50.5108 1.49755 51.1232 1.01259 51.8471 0.80606C56.7412 -0.574771 61.9676 -0.162017 66.5843 1.96993C71.201 4.10188 74.9044 7.81279 77.0269 12.4338C79.1494 17.0549 79.5515 22.2821 78.1607 27.1734C76.7699 32.0647 73.6777 36.2984 69.4414 39.1113C75.9477 41.5114 81.5712 45.8319 85.5665 51.5003C86.001 52.1172 86.1725 52.8815 86.0435 53.6249C85.9144 54.3683 85.4953 55.03 84.8784 55.4645Z" fill="#A9C6DE"/>
                        </svg>
                        <!-- \icono card-->
                    </div>
                    <div class="card_dashbord-titulo text-body-1">
                        Cantidad de usuarios
                    </div>
                </div>
                <div class="card_dashbord">
                    <div class="cad_dashbord-datos">
                        <span id="cantidad_ventas" class="h2">
                            <%
                                int CnVentas;
                                CnVentas = 0;
                                ArrayList<VentaBeans> lista2
                                        = (ArrayList<VentaBeans>) request.getAttribute("lista2");
                                for (int i = 0; i < lista2.size(); i++) {
                                    CnVentas = CnVentas + 1;
                            %>
                            <%
                                }
                            %>
                            <%=CnVentas%>
                        </span>
                        <!-- icono card-->
                        <svg width="64" height="56" viewBox="0 0 64 56" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path id="icon-ventas" d="M60.7545 39.7005H19.4157L21.4913 35.4729L55.9785 35.4104C57.1447 35.4104 58.1443 34.5774 58.3526 33.4251L63.1286 6.69195C63.2535 5.99083 63.0661 5.26887 62.6079 4.72047C62.3815 4.45057 62.0991 4.23316 61.7802 4.08332C61.4613 3.93348 61.1137 3.8548 60.7614 3.85273L16.8888 3.70695L16.514 1.94372C16.278 0.81914 15.2645 0 14.1121 0H3.38692C2.73702 0 2.11373 0.258174 1.65418 0.717728C1.19462 1.17728 0.936447 1.80057 0.936447 2.45048C0.936447 3.10038 1.19462 3.72367 1.65418 4.18323C2.11373 4.64278 2.73702 4.90095 3.38692 4.90095H12.1267L13.765 12.6897L17.7982 32.2172L12.6057 40.6932C12.3361 41.0571 12.1736 41.4893 12.1368 41.9408C12.1 42.3922 12.1903 42.845 12.3975 43.2478C12.814 44.0739 13.6539 44.5945 14.5841 44.5945H18.9436C18.0142 45.8289 17.5123 47.3325 17.5136 48.8776C17.5136 52.8067 20.7069 56 24.636 56C28.5651 56 31.7583 52.8067 31.7583 48.8776C31.7583 47.3296 31.2446 45.8232 30.3283 44.5945H41.5116C40.5822 45.8289 40.0802 47.3325 40.0816 48.8776C40.0816 52.8067 43.2749 56 47.204 56C51.133 56 54.3263 52.8067 54.3263 48.8776C54.3263 47.3296 53.8126 45.8232 52.8963 44.5945H60.7614C62.1081 44.5945 63.2119 43.4977 63.2119 42.144C63.2079 41.4948 62.9472 40.8735 62.4868 40.4158C62.0265 39.958 61.4037 39.7009 60.7545 39.7005ZM17.9093 8.53849L57.8805 8.67038L53.9653 30.5928L22.5673 30.6483L17.9093 8.53849ZM24.636 51.0713C23.4281 51.0713 22.4423 50.0855 22.4423 48.8776C22.4423 47.6698 23.4281 46.684 24.636 46.684C25.8438 46.684 26.8296 47.6698 26.8296 48.8776C26.8296 49.4594 26.5985 50.0174 26.1871 50.4288C25.7757 50.8402 25.2177 51.0713 24.636 51.0713ZM47.204 51.0713C45.9961 51.0713 45.0103 50.0855 45.0103 48.8776C45.0103 47.6698 45.9961 46.684 47.204 46.684C48.4118 46.684 49.3976 47.6698 49.3976 48.8776C49.3976 49.4594 49.1665 50.0174 48.7551 50.4288C48.3437 50.8402 47.7857 51.0713 47.204 51.0713Z" fill="#A9C6DE"/>
                        </svg>
                        <!-- \icono card-->
                    </div>
                    <div class="card_dashbord-titulo text-body-1">
                        Ventas
                    </div>
                </div>
                <div class="card_dashbord">
                    <div class="cad_dashbord-datos">
                        <span id="cantidad_pedidosSE" class="h2">
                            <%
                                int CnPedidos;
                                CnPedidos = 0;
                                ArrayList<VentaBeans> lista4
                                        = (ArrayList<VentaBeans>) request.getAttribute("lista4");
                                for (int i = 0; i < lista4.size(); i++) {
                                    VentaBeans emp = lista4.get(i);
                                    if (emp.getEst().equals("Pendiente")) {
                                        CnPedidos = CnPedidos + 1;
                            %>
                            <%}%>
                            <%
                                }
                            %>
                            <%=CnPedidos%>
                        </span>
                        <!-- icono card-->
                        <svg width="57" height="56" viewBox="0 0 57 56" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path id="icon-pedido" d="M29.1622 3.64439C28.7423 3.47612 28.2738 3.47612 27.8539 3.64439L6.86508 12.0392L15.3197 15.419L36.9627 6.76387L29.1622 3.64439ZM41.6964 8.65948L20.0534 17.3146L28.5081 20.6943L50.151 12.0392L41.6964 8.65948ZM53.1263 14.6382L30.2665 23.7821V51.643L53.1263 42.499V14.6417V14.6382ZM26.7496 51.6465V23.7786L3.88978 14.6382V42.5026L26.7496 51.6465ZM26.5491 0.377189C27.8067 -0.12573 29.2094 -0.12573 30.467 0.377189L55.5389 10.4074C55.8649 10.538 56.1443 10.7633 56.3411 11.0541C56.5379 11.3449 56.6431 11.688 56.6432 12.0392V42.5026C56.6428 43.2053 56.4318 43.8918 56.0375 44.4735C55.6432 45.0553 55.0837 45.5055 54.4311 45.7662L29.1622 55.8738C28.7423 56.0421 28.2738 56.0421 27.8539 55.8738L2.58853 45.7662C1.93527 45.5061 1.375 45.0561 0.980051 44.4743C0.585102 43.8925 0.373612 43.2057 0.372887 42.5026L0.372887 12.0392C0.372968 11.688 0.478196 11.3449 0.675013 11.0541C0.87183 10.7633 1.15122 10.538 1.47719 10.4074L26.5491 0.377189Z" fill="#A9C6DE"/>
                        </svg>
                        <!-- \icono card-->
                    </div>
                    <div class="card_dashbord-titulo text-body-1">
                        Pedidos sin enviar
                    </div>
                </div>
                <div class="card_dashbord">
                    <div class="cad_dashbord-datos">
                        <span id="cantidad_ganancia" class="h2">
                            <%
                                double CnTVentas;
                                CnTVentas = 0;
                                ArrayList<VentaBeans> lista3
                                        = (ArrayList<VentaBeans>) request.getAttribute("lista3");
                                for (int i = 0; i < lista3.size(); i++) {
                                    VentaBeans emp = lista3.get(i);
                                    CnTVentas = CnTVentas + emp.getMonto();
                            %>
                            <%
                                }
                            %>
                            <%=CnTVentas%>
                        </span>
                        <!-- icono card-->
                        <svg width="78" height="62" viewBox="0 0 78 62" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path id="Vector" d="M5.91592 43.7273L72.0977 43.7273C73.5035 43.7273 74.6432 42.5877 74.6432 41.1818V5.54548C74.6432 4.13966 73.5035 3.00003 72.0977 3.00003L5.91592 3.00003C4.51011 3.00003 3.37047 4.13966 3.37047 5.54548V41.1818C3.37047 42.5877 4.51011 43.7273 5.91592 43.7273Z" stroke="#A9C6DE" stroke-width="5.11364" stroke-linejoin="round"/>
                        <path id="Vector_2" d="M8.4614 51.3636H69.5523" stroke="#A9C6DE" stroke-width="5.11364" stroke-linecap="round" stroke-linejoin="round"/>
                        <path id="Vector_3" d="M13.5523 59H64.4614" stroke="#A9C6DE" stroke-width="5.11364" stroke-linecap="round" stroke-linejoin="round"/>
                        <path id="Vector_4" d="M39.0068 36.0909C46.0359 36.0909 51.7341 30.3927 51.7341 23.3636C51.7341 16.3345 46.0359 10.6364 39.0068 10.6364C31.9778 10.6364 26.2796 16.3345 26.2796 23.3636C26.2796 30.3927 31.9778 36.0909 39.0068 36.0909Z" stroke="#A9C6DE" stroke-width="5.11364" stroke-linecap="round" stroke-linejoin="round"/>
                        <path id="Vector_5" d="M74.6432 15.7273C71.2677 15.7273 68.0305 14.3864 65.6437 11.9995C63.2569 9.61271 61.916 6.37548 61.916 3" stroke="#A9C6DE" stroke-width="5.11364" stroke-linecap="round" stroke-linejoin="round"/>
                        <path id="Vector_6" d="M3.37048 15.7273C5.04185 15.7273 6.69686 15.3981 8.241 14.7585C9.78514 14.1189 11.1882 13.1814 12.37 11.9995C13.5519 10.8177 14.4893 9.41466 15.1289 7.87052C15.7686 6.32637 16.0978 4.67137 16.0978 3" stroke="#A9C6DE" stroke-width="5.11364" stroke-linecap="round" stroke-linejoin="round"/>
                        <path id="Vector_7" d="M74.6432 31C71.2677 31 68.0305 32.3409 65.6437 34.7277C63.2569 37.1146 61.916 40.3518 61.916 43.7273" stroke="#A9C6DE" stroke-width="5.11364" stroke-linecap="round" stroke-linejoin="round"/>
                        <path id="Vector_8" d="M3.37048 31C5.04185 31 6.69686 31.3292 8.241 31.9688C9.78514 32.6084 11.1882 33.5459 12.37 34.7277C13.5519 35.9096 14.4893 37.3126 15.1289 38.8568C15.7686 40.4009 16.0978 42.0559 16.0978 43.7273" stroke="#A9C6DE" stroke-width="5.11364" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                        <!-- \icono card-->
                    </div>
                    <div class="card_dashbord-titulo text-body-1">
                        Ganancias
                    </div>
                </div>
            </div>
            <!-- \cards de datos -->
            <!-- container tables  -->
            <div class="container_tables">
                <!-- table pedidos recientes -->
                <div class="container_table--pedidos_recientes">
                    <div class="container_table--pedidos_recientes-head">
                        <h5 class="title-pedidos_recientes">
                            Ventas recientes
                        </h5>
                        <button class="btn--pedidos_recientes button">
                            ver todos
                        </button>
                    </div>
                    <div class="container_table--pedidos_recientes-table">
                        <div class="table-reposible w-100">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Id Venta</th>
                                        <th>Id Cliente</th>
                                        <th>Empleado</th>
                                        <th>Tipo Comp.</th>
                                        <th>Nro Comp.</th>
                                        <th>Fecha</th>
                                        <th>Total</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <%
                                    ArrayList<VentaBeans> lista6
                                            = (ArrayList<VentaBeans>) request.getAttribute("lista6");
                                    for (int i = 0; i < lista6.size(); i++) {
                                        VentaBeans emp = lista6.get(i);
                                %>
                                <tbody>
                                    <tr>
                                        <td><%=emp.getIdV()%></td>
                                        <td><%=emp.getIdCV()%></td>
                                        <td><%=emp.getNoE()%></td>
                                        <td><%=emp.getTiC()%></td>
                                        <td><%=emp.getNuC()%></td>
                                        <td><%=emp.getFecha()%></td>
                                        <td><%=emp.getMonto()%></td>
                                        <td data-estado="estado"><%=emp.getEst()%></td>
                                    </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- \table pedidos recientes -->
                <!-- table ultimos clientes -->
                <div class="container_table--ultimos_clientes">
                    <div class="container_table--ultimos_clientes-head">
                        <h5 class="title-ultimos_clientes">
                            Ultimos clientes
                        </h5>
                    </div>
                    <%
                        ArrayList<ClienteBeans> lista5
                                = (ArrayList<ClienteBeans>) request.getAttribute("lista5");
                        for (int i = 0; i < lista5.size(); i++) {
                            ClienteBeans emp = lista5.get(i);
                    %>
                    <ul class="container_table--ultimos_clientes-list">
                        <li><%=emp.getNom()%></li>
                    </ul>
                    <%
                        }
                    %>
                </div>
                <!-- \table ultimos clientes -->
            </div>
            <!-- \container tables  -->
        </section>
        <!-- \seccion datos -->
        <!-- navbar desplegable -->
        <script src="./js/navbar.js"></script>
        <!-- \navbar desplegable -->
        <!-- transformar dinero -->
        <script src="./js/transDinero.js"></script>
        <!-- \transformar dinero -->
        <!-- añadir estilos a estados -->
        <script src="./js/estiloEstado.js"></script>
        <!-- \añadir estilos a estados -->
    </body>
</html>
