
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <title>PeruDelivery</title>
    </head>
    <body background="img/fondo2.jpg"  >
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Mantenimiento
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="Controlador?accion=Listar">Productos</a>
                        <a class="dropdown-item" href="Controlador?accion=Listarc">Clientes</a>
                    </div>
                </li>
            </ul>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Controlador?accion=home">Home <span class="sr-only">(current)</span></a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="Controlador?accion=home">Seguir Comprando</a>
                    </li>
                </ul>

                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user">   ${usuario.getNombre()}</i>
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdown">
                            <a><img src="img/user.jpg" hight="80" width="80"></a>
                            <a class="dropdown-item" href="#">${usuario.getRol()}</a>
                            <a class="dropdown-item" href="#">${usuario.getCorreo()}</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="ControladorC?accion=Salir">Salir</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container mt-4">
            <h3><font color="White"><strong>Carrito</strong></font></h3>
            <br>
            <div class="row">
                <div class="col-sm-9">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th><font color="White"><strong>ITEM</strong></font></th>
                                <th><font color="White">NOMBRES</strong></font></th>
                                <th><font color="White">DESCRIPCION</strong></font></th>
                                <th><font color="White">IMAGEN</strong></font></th>
                                <th><font color="White">PRECIO</strong></font></th>
                                <th><font color="White">CANT</strong></font></th>
                                <th><font color="White">SUBTOTA</strong></font></th>
                                <th><font color="White">ACCIONES</strong></font></th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="car" items="${carrito}">

                                <tr>
                                    <td><font color="White"><strong>${car.getItem()}</strong></font></td>
                                    <td><font color="White"><strong>${car.getNombres()}</strong></font></td>
                                    <td><font color="White"><strong>${car.getDescripcion()}</strong></font></td>
                                    <td><img src="${car.getRuta()}" width="100" height="100"></td>
                                    <td><font color="White"><strong>${car.getPrecioCompra()}</strong></font></td>
                                    <td width="90">
                                        <font color="White"><strong><input type="hidden" id="idpro" value="${car.getIdProducto()}"></strong></font>
                                        <font color="White"><strong><input type="number" id="Cantidad" value="${car.getCantidad()}" class="form-control text-center" min="1"></strong></font>

                                    </td>
                                    <td><font color="White"><strong>${car.getSubTotal()}</strong></font></td>
                                    <td>
                                        <font color="White"><strong> <input type="hidden" id="idp" value="${car.getIdProducto()}"></strong></font>
                                        <a href="#" id="btnDelete">eliminar</a>
                                 
                                    </td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="col-sm-3">
                    <div class="card-header">
                        <font color="White"><strong><h3>Generar Compras</h3></strong></font>
                    </div>
                    <div class="card-body">
                        <font color="White"><strong><label>Subtotal</label></strong></font>
                        <input type="text" value="S/.${totalPagar}0" readonly="" class="form-control">
                        <font color="White"><strong><label>Descuento</label></strong></font>
                        <input type="text" value="S/.0.00" readonly="" class="form-control">
                        <font color="White"><strong> <label>Total a Pagar</label></strong></font>
                        <input type="text" value="S/.${totalPagar}0" readonly="" class="form-control">

                    </div>
                    <div class="card-footer">
                        <a class="btn btn-info btn-block">Realizar pago</a>
                        <a href="Controlador?accion=GenerarCompras" class="btn btn-danger btn-block">Generar Compra</a>


                    </div>

                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <script src ="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/funciones.js" type="text/javascript"></script>
    </body>
</html>
