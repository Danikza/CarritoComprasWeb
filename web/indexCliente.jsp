
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

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="ControladorC?accion=home" >Home <span class="sr-only">(current)</span></a>
                    </li>
                  

                    <li class="nav-item">
                        <a class="nav-link" href="ControladorC?accion=Carrito"><i class="fa fa-shopping-cart" aria-hidden="true">(<label style="color:orange">${contador}</label>)</i>Carrito</a>
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
        <div class="container mt-2">
            <div class="row">
                <c:forEach var="p" items="${productos}">
                    <div class="col-sm-4">
                        <div class="card border-primary mb-3" style="max-width: 32rem;">
                            <div class="card-header card text-white bg-dark border-primary">

                                <h5 class="card-title font-weight-bold" >${p.nombres}</h5>
                            </div>

                            <div class="card-body">
                                <i><h3 style="font-family:monospace" class="font-weight-bold">S/${p.getPrecio()}0</h3></i>
                                <img src="${p.ruta}" width="200" height="180">
                            </div>

                            <div class=" tex-center card-footer card text-white bg-dark border-succes border-primary">
                                <label>${p.getDescripcion()}</label>
                                <label><h6>Stock: ${p.getStock()}</h6></label>  
                                <div>
                                    <a href="ControladorC?accion=AgregarCarrito&id=${p.getId()}" class="btn btn-primary">Agregar a carrito</a>
                                    <a href="ControladorC?accion=Comprar&id=${p.getId()}" class="btn btn-danger">Comprar</a>
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>

                </c:forEach>
            </div>
        </div>
       
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
</html>