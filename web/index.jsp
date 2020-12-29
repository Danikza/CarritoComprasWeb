
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link href="css/fondo.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        
        <title>PeruDelivery</title>
    </head>
    <body background="img/fondo2.jpg"  >
    
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Mantenimiento
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Productos</a>
                        <a class="dropdown-item" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Clientes</a>
                    </div>
                </li>
            </ul>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Home <span class="sr-only">(current)</span></a>
                    </li>
                  

                    <li class="nav-item">
                        <a class="nav-link" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"><i class="fa fa-shopping-cart" aria-hidden="true">(<label style="color:orange">${contador}</label>)</i>Carrito</a>
                    </li>
                </ul>
                
                <ul class="navbar-nav ">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user">   ${usuario.getNombre()}</i>
                         
                        </a>
                        <div class="dropdown-menu text-center" aria-labelledby="navbarDropdown">
                            <a><img src="img/user.jpg" hight="80" width="80"></a>
                            <a class="dropdown-item" href="#">${usuario.getRol()}</a>
                            <a class="dropdown-item" href="#">${usuario.getCorreo()}</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="index.jsp">Salir</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center" id="exampleModalLabel">Iniciar Sesion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">

                        <form action="Validar" method="POST" class="form-sign">
                            <div class="mb-3 form-group text-center">
                                <img src="img/user.jpg" hight="100" width="100"/>
                                <p><strong>Carrito de compras-PeruDelivery</strong> </p>
                            </div>
                            <div class="mb-3 form-group">
                                <label class="form-label">Ingrese su correo</label>
                                <input type="email" class="form-control border-primary" name="txtCorreo">
                            </div>
                            <div class="mb-3 form-group">
                                <label  class="form-label">Password</label>
                                <input type="password" name="txtPassword" class="form-control border-primary">
                            </div>
                            <div class="mb-3 form-group">
                                <label  class="form-label">Rol</label>
                                <select name="txtRol" class="form-control border-primary">
                                    <option>Administrador</option> 
                                    <option selected>Cliente</option>
                                </select>
                            </div>

                            <div class="modal-footer">
                                <input type="submit"  value="Ingresar" name="ya" class="btn btn btn-primary " rel="content-y"  data-toggle="collapse">
                                <a class="btn btn-danger" href="RegistrarCliente.jsp">Registrarse</a>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>
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
                                    <a class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Agregar a carrito</a>
                                    <a class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Comprar</a>
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>

                </c:forEach>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    </body>
    
</html>
