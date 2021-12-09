<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="Beans.ClienteBeans" %>
<%@page import="Beans.UsuarioBeans" %>
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
        <meta charset="UTF-8" />
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
        <title>Cliente</title>
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
                    <a href="ServletInicio?op=listar">
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
                    <a class="active" href="ServletCRUDclientes?txtIdC=C001&btn=Buscar&op=consultaId">
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
                    <%if(perfil.equals("Admin")){%><a href="ServletCRUDempleados?txtIdU=A001&btn=Buscar&op=consultaId">
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
            <form action="ServletLogin">
                <button class="btn text-light navbar_btn-cerrar_sesion">
                    <svg class="icon-cerrarSesion" width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path id="Vector" d="M16 21.3333C15.6464 21.3333 15.3073 21.4738 15.0572 21.7239C14.8072 21.9739 14.6667 22.313 14.6667 22.6667C14.6667 23.0203 14.8072 23.3594 15.0572 23.6095C15.3073 23.8595 15.6464 24 16 24H22.6667C23.3739 24 24.0522 23.719 24.5523 23.219C25.0524 22.7189 25.3334 22.0406 25.3334 21.3333V2.66667C25.3334 1.95942 25.0524 1.28115 24.5523 0.781048C24.0522 0.280951 23.3739 0 22.6667 0H16C15.6464 0 15.3073 0.140476 15.0572 0.390524C14.8072 0.640573 14.6667 0.979711 14.6667 1.33333C14.6667 1.68696 14.8072 2.02609 15.0572 2.27614C15.3073 2.52619 15.6464 2.66667 16 2.66667H22.6667V21.3333H16Z" fill="white"/>
                    <path id="Vector_2" d="M18.2853 12.9333C18.5292 12.6854 18.6661 12.3518 18.6667 12.004V11.996C18.666 11.6437 18.5255 11.3061 18.276 11.0573L12.9427 5.72401C12.8197 5.59666 12.6725 5.49508 12.5099 5.4252C12.3472 5.35533 12.1722 5.31854 11.9952 5.31701C11.8182 5.31547 11.6426 5.3492 11.4787 5.41624C11.3149 5.48329 11.166 5.58229 11.0408 5.70748C10.9156 5.83267 10.8166 5.98154 10.7496 6.1454C10.6825 6.30926 10.6488 6.48484 10.6503 6.66188C10.6519 6.83891 10.6887 7.01387 10.7585 7.17655C10.8284 7.33922 10.93 7.48634 11.0573 7.60934L14.1147 10.6667H1.33333C0.979711 10.6667 0.640573 10.8071 0.390524 11.0572C0.140476 11.3072 0 11.6464 0 12C0 12.3536 0.140476 12.6928 0.390524 12.9428C0.640573 13.1929 0.979711 13.3333 1.33333 13.3333H14.1147L11.0573 16.3907C10.93 16.5137 10.8284 16.6608 10.7585 16.8235C10.6887 16.9861 10.6519 17.1611 10.6503 17.3381C10.6488 17.5152 10.6825 17.6907 10.7496 17.8546C10.8166 18.0185 10.9156 18.1673 11.0408 18.2925C11.166 18.4177 11.3149 18.5167 11.4787 18.5838C11.6426 18.6508 11.8182 18.6845 11.9952 18.683C12.1722 18.6815 12.3472 18.6447 12.5099 18.5748C12.6725 18.5049 12.8197 18.4034 12.9427 18.276L18.276 12.9427L18.2853 12.9333Z" fill="white"/>
                    </svg>
                    Cerrar sesión
                </button>
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
            <form action="ServletCRUDclientes" class="container_datos-input_buscar pt-3 mb-2">
                <div class="col-12 form-floating position-relative">
                    <input
                        placeholder="Id cliente:"
                        type="search"
                        required
                        class="form-control"
                        name="txtIdC"
                        aria-label="Sizing example input"
                        aria-describedby="inputGroup-sizing"
                        />
                    <label for="floatingInput">Ingresa el id del cliente</label>
                    <div class="container_datos-input_buscar-group_buttons d-flex mt-2 pt-1 position-absolute top-0 end-0">
                        <input type="submit" name="btn" value="Buscar"
                               class="button mx-2">
                        <button type="reset" class="button me-2 btn-outline-primary">
                            Limpiar
                        </button>
                    </div>
                </div>
                <input type="hidden" name="op" value="consultaId">
            </form>
            <div class="container_datos-forms">
                <!-- CRUD -->
                <div class="container_datos-forms-crud d-flex justify-content-between position-relative "
                     role="group"
                     aria-label="Basic radio toggle button group"
                     >
                    <!-- radio botones -->
                    <input
                        type="radio"
                        class="btn-check"
                        name="crud"
                        id="btnradio1"
                        autocomplete="off"
                        />
                    <label
                        class="
                        btn
                        fw-bolder
                        shadow-sm
                        text-dark
                        w-100
                        btn-outline-primary--agregar
                        "
                        for="btnradio1"
                        >Agregar</label
                    >
                    <input
                        type="radio"
                        class="btn-check"
                        name="crud"
                        id="btnradio2"
                        autocomplete="off"
                        />
                    <label
                        class="btn fw-bolder shadow-sm w-100 btn-outline--secondary mx-2"
                        for="btnradio2"
                        >Actualizar</label
                    >
                    <input
                        type="radio"
                        class="btn-check"
                        name="crud"
                        id="btnradio3"
                        autocomplete="off"
                        />
                    <label
                        class="btn fw-bolder shadow-sm w-100 btn-outline--danger"
                        for="btnradio3"
                        >Eliminar</label
                    >
                    <!-- /radio botones -->
                    <!-- Formularios -->
                    <div
                        class="
                        d-none
                        shadow
                        rounded
                        sec1
                        position-absolute
                        w-100
                        bg-light
                        pt-3
                        pb-2
                        mt-2
                        "
                        >
                        <button
                            type="button"
                            class="btn-close d-lg-none position-absolute end-0 top-0 mt-2 me-2"
                            aria-label="Close"
                            onclick="quitarChecked()"
                            ></button>
                        <h3 class="text-center">Agregar cliente</h3>
                        <div>
                            <form
                                action="ServletCRUDclientes"
                                method="get"
                                enctype="multipart/form-data"
                                class="d-flex flex-column align-items-center"
                                >
                                <div class="row px-3 g-1">
                                    <div class="col-6 form-floating">
                                        <input
                                            placeholder="Id cliente"
                                            type="text"
                                            required
                                            class="form-control"
                                            name="txtIdC"
                                            aria-label="Sizing example input"
                                            aria-describedby="inputGroup-sizing"
                                            maxlength="4"
                                            />
                                        <label for="floatingInput">Id cliente</label>
                                    </div>
                                    <div class="col-6 form-floating">
                                        <select
                                            class="form-select form-control"
                                            aria-label="Default select example"
                                            name="txtTiC"
                                            required
                                            >
                                            <option selected>Seleccione</option>
                                            <option value="Persona Natural">Persona natural</option>
                                            <option value="Empresa">Empresa</option>
                                        </select>
                                        <label for="floatingInput">Tipo cliente</label>
                                    </div>
                                    <div class="col-12 my-2 form-floating">
                                        <input
                                            placeholder="Nombre"
                                            type="text"
                                            required
                                            class="form-control"
                                            name="txtNom"
                                            aria-label="Sizing example input"
                                            aria-describedby="inputGroup-sizing"
                                            />
                                        <label for="floatingInput">Nombre</label>
                                    </div>
                                    <div class="col-6 form-floating">
                                        <select
                                            class="form-select form-control"
                                            aria-label="Default select example"
                                            name="txtTiD"
                                            required
                                            >
                                            <option selected>Seleccione</option>
                                            <option value="DNI">DNI</option>
                                            <option value="RUC">RUC</option>
                                        </select>
                                        <label for="floatingInput">Tipo documento</label>
                                    </div>
                                    <div class="col-6 form-floating">
                                        <input
                                            placeholder="Tipo documento"
                                            type="text"
                                            required
                                            class="form-control"
                                            name="txtDoc"
                                            aria-label="Sizing example input"
                                            aria-describedby="inputGroup-sizing"
                                            maxlength="8"
                                            />
                                        <label for="floatingInput">Documento</label>
                                    </div>
                                    <div class="col-12 my-2 form-floating">
                                        <input
                                            placeholder="Documento"
                                            type="text"
                                            required
                                            class="form-control"
                                            name="txtDir"
                                            aria-label="Sizing example input"
                                            aria-describedby="inputGroup-sizing"
                                            />
                                        <label for="floatingInput">Dirección</label>
                                    </div>
                                    <div class="col-12 my-2 form-floating">
                                        <input
                                            placeholder="Telefono"
                                            type="tel"
                                            required
                                            class="form-control"
                                            name="txtTel"
                                            aria-label="Sizing example input"
                                            aria-describedby="inputGroup-sizing"
                                            maxlength="9"
                                            />
                                        <label for="floatingInput">Telefono</label>
                                    </div>
                                </div>
                                <input
                                    type="submit"
                                    name="btn"
                                    value="grabar datos"
                                    class="btn btn btn-primary w-75 btn-lg my-2"
                                    />
                                <input type="hidden" name="op" value="insertar">
                            </form>
                        </div>
                    </div>
                    <div
                        class="
                        d-none
                        shadow
                        rounded
                        sec2
                        position-absolute
                        w-100
                        bg-light
                        pt-3
                        pb-2
                        mt-2
                        "
                        >
                        <button
                            type="button"
                            class="btn-close d-lg-none position-absolute end-0 top-0 mt-2 me-2"
                            aria-label="Close"
                            onclick="quitarChecked()"
                            ></button>
                        <h3 class="text-center">Actualizar Cliente</h3>
                        <div>
                            <form
                                action="ServletCRUDclientes"
                                method="get"
                                class="d-flex flex-column align-items-center"
                                >
                                <div class="row px-3 g-1">
                                    <div class="col-6 form-floating">
                                        <input
                                            placeholder="Id cliente"
                                            type="text"
                                            required
                                            class="form-control"
                                            name="txtIdC"
                                            aria-label="Sizing example input"
                                            aria-describedby="inputGroup-sizing"
                                            maxlength="4"
                                            />
                                        <label for="floatingInput">Id cliente</label>
                                    </div>
                                    <div class="col-6 form-floating">
                                        <select
                                            class="form-select form-control"
                                            aria-label="Default select example"
                                            name="txtTiC"
                                            required
                                            >
                                            <option selected>Seleccione</option>
                                            <option value="Persona Natural">Persona natural</option>
                                            <option value="Empresa">Empresa</option>
                                        </select>
                                        <label for="floatingInput">Tipo cliente</label>
                                    </div>
                                    <div class="col-12 my-2 form-floating">
                                        <input
                                            placeholder="Nombre"
                                            type="text"
                                            required
                                            class="form-control"
                                            name="txtNom"
                                            aria-label="Sizing example input"
                                            aria-describedby="inputGroup-sizing"
                                            />
                                        <label for="floatingInput">Nombre</label>
                                    </div>
                                    <div class="col-6 form-floating">
                                        <select
                                            class="form-select form-control"
                                            aria-label="Default select example"
                                            name="txtTiD"
                                            required
                                            >
                                            <option selected>Seleccione</option>
                                            <option value="DNI">DNI</option>
                                            <option value="RUC">RUC</option>
                                        </select>
                                        <label for="floatingInput">Tipo documento</label>
                                    </div>
                                    <div class="col-6 form-floating">
                                        <input
                                            placeholder="documento"
                                            type="text"
                                            required
                                            class="form-control"
                                            name="txtDoc"
                                            aria-label="Sizing example input"
                                            aria-describedby="inputGroup-sizing"
                                            maxlength="8"
                                            />
                                        <label for="floatingInput">Documento</label>
                                    </div>
                                    <div class="col-12 my-2 form-floating">
                                        <input
                                            placeholder="Dirección"
                                            type="text"
                                            required
                                            class="form-control"
                                            name="txtDir"
                                            aria-label="Sizing example input"
                                            aria-describedby="inputGroup-sizing"
                                            />
                                        <label for="floatingInput">Dirección</label>
                                    </div>
                                    <div class="col-12 my-2 form-floating">
                                        <input
                                            placeholder="Telefono"
                                            type="tel"
                                            required
                                            class="form-control"
                                            name="txtTel"
                                            aria-label="Sizing example input"
                                            aria-describedby="inputGroup-sizing"
                                            maxlength="9"
                                            />
                                        <label for="floatingInput">Telefono</label>
                                    </div>
                                </div>
                                <input
                                    type="submit"
                                    class="btn btn btn-secondary w-75 my-2 btn-lg"
                                    name="btn"
                                    value="actualizar datos"
                                    />
                                <input type="hidden" name="op" value="editar">
                            </form>
                        </div>
                    </div>
                    <div
                        class="
                        d-none
                        shadow
                        rounded
                        sec3
                        position-absolute
                        w-100
                        bg-light
                        pt-3
                        pb-2
                        mt-2
                        "
                        >
                        <button
                            type="button"
                            class="btn-close d-lg-none position-absolute end-0 top-0 mt-2 me-2"
                            aria-label="Close"
                            onclick="quitarChecked()"
                            ></button>
                        <h3 class="text-center">Eliminar Cliente</h3>
                        <div>
                            <form
                                action="ServletCRUDclientes"
                                method="get"
                                class="d-flex flex-column align-items-center px-3"
                                >
                                <div class="col-9 col-md-7 mt-2 form-floating">
                                    <input
                                        placeholder="Id cliente"
                                        name="txtIdC"
                                        required
                                        type="text"
                                        class="form-control"
                                        maxlength="4"
                                        />
                                    <label for="floatingInput">Id cliente</label>
                                </div>
                                <input
                                    type="submit"
                                    class="btn btn btn-danger w-75 m-3 btn-lg"
                                    name="btn"
                                    value="eliminar datos"
                                    />
                                <input type="hidden" name="op" value="eliminar">
                            </form>
                        </div>
                    </div>
                    <!-- /Formularios -->
                </div>
                <!-- \CRUD -->
                <!-- detalles -->
                <div class="container_datos-vista_detalles">
                    <div class="container_datos-vista_detalles-head pt-4">
                        <h4>
                            Detalle cliente
                        </h4>
                    </div>
                    <div class="container_datos-vista_detalles-vista">
                        <div class="row g-1">
                            <%
                                ArrayList<ClienteBeans> lista2
                                        = (ArrayList<ClienteBeans>) request.getAttribute("lista2");
                                for (int i = 0; i < lista2.size(); i++) {
                                    ClienteBeans emp = lista2.get(i);
                            %>
                            <div class="col-6 form-floating">
                                <input
                                    placeholder="Id cliente"
                                    type="text"
                                    required
                                    class="form-control"
                                    name="txtIdC"
                                    value="<%=emp.getIdC()%>"
                                    aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing"
                                    disabled/>
                                <label for="floatingInput">Id cliente</label>
                            </div>
                            <div class="col-6 form-floating">
                                <input
                                    placeholder="Tipo cliente"
                                    type="text"
                                    required
                                    class="form-control"
                                    name="txtTiC"
                                    value="<%=emp.getTiC()%>"
                                    aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing"
                                    disabled/>
                                <label for="floatingInput">Tipo cliente</label>
                            </div>
                            <div class="col-12 my-2 form-floating">
                                <input
                                    placeholder="Nombre"
                                    type="text"
                                    required
                                    class="form-control"
                                    name="txtNom"
                                    value="<%=emp.getNom()%>"
                                    aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing"
                                    disabled
                                    />
                                <label for="floatingInput">Nombre</label>
                            </div>
                            <div class="col-6 form-floating">
                                <input
                                    placeholder="Tipo documento"
                                    type="text"
                                    required
                                    class="form-control"
                                    name="txtTiD"
                                    value="<%=emp.getTiD()%>"
                                    aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing"
                                    disabled
                                    />
                                <label for="floatingInput">Tipo documento</label>
                            </div>
                            <div class="col-6 form-floating">
                                <input
                                    placeholder="Documento"
                                    type="text"
                                    required disabled
                                    class="form-control"
                                    name="txtDoc"
                                    value="<%=emp.getDoc()%>"
                                    aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing"
                                    />
                                <label for="floatingInput">Documento</label>
                            </div>
                            <div class="col-12 my-2 form-floating">
                                <input
                                    placeholder="Dirección"
                                    type="text"
                                    required disabled
                                    class="form-control"
                                    name="txtDir"
                                    value="<%=emp.getDir()%>"
                                    aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing"
                                    />
                                <label for="floatingInput">Dirección</label>
                            </div>
                            <div class="col-12 my-2 form-floating">
                                <input
                                    placeholder="Telefono"
                                    type="tel"
                                    required disabled
                                    class="form-control"
                                    name="txtTel"
                                    value="<%=emp.getTel()%>"
                                    aria-label="Sizing example input"
                                    aria-describedby="inputGroup-sizing"
                                    />
                                <label for="floatingInput">Telefono</label>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <a href="#tablas" class="btn button">
                        ver mas clientes
                    </a>
                </div>
                <!-- \detalles -->
            </div>
            <!-- seccion tabla -->
            <div id="tablas" class="container_datos-tabla pt-5 mt-5 pb-3">
                <h3>
                    Lista de clientes
                </h3>
                <div class="container_datos-tabla_tabla overflow-auto">
                    <div class="table-reposible w-100">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Id Cliente</th>
                                    <th>Tipo Cliente</th>
                                    <th>Nombre</th>
                                    <th>Tipo Doc</th>
                                    <th>Documento</th>
                                    <th>Dirección</th>
                                    <th>Telefono</th>
                                </tr>
                            </thead>
                            <%
                                ArrayList<ClienteBeans> lista
                                        = (ArrayList<ClienteBeans>) request.getAttribute("lista");
                                for (int i = 0; i < lista.size(); i++) {
                                    ClienteBeans emp = lista.get(i);
                            %>
                            <tbody>
                                <tr>
                                    <td><%=emp.getIdC()%></td>
                                    <td><%=emp.getTiC()%></td>
                                    <td><%=emp.getNom()%></td>
                                    <td><%=emp.getTiD()%></td>
                                    <td><%=emp.getDoc()%></td>
                                    <td><%=emp.getDir()%></td>
                                    <td><%=emp.getTel()%></td>
                                </tr>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
            <!-- \seccion tabla -->
        </section>
        <!-- \seccion datos -->
        <!-- funcion de radio buttons -->
        <script src="./js/radiobuttons.js"></script>
        <!-- \funcion de radio buttons -->
        <!-- navbar desplegable -->
        <script src="./js/navbar.js"></script>
        <!-- \navbar desplegable -->
    </body>
</html>
