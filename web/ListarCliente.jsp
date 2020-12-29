
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
            <form action="EditarCliente.jsp" method="POST">
                <div class="card-box pd-20 height-100-p mb-30">
                    <br>
                    <h2 class="h3 pd-20"><font color="White">Lista de Clientes</font> <a href="AgregarCliente.jsp" class="btn btn-primary">Agregar nuevo</a></h2>
                    <br>
                    <table class="table table-striped table table-sm table border-succes ">
                        <thead class="thead-dark">
                            <tr class="text-center">
                                <th scope="col">ID</th>
                                <th scope="col">DNI</th>
                                <th scope="col">NOMBRES</th>
                                <th scope="col">FUNCION</th>
                                <th scope="col">DIRECCION</th>
                                <th scope="col">EMAIL</th>
                                <th scope="col">PASSWORD</th>
                                <th scope="col">ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${cliente}">
                            <tr class="text-center">
                                <td><font color="White"><strong>${c.id}</strong></font></td>
                                <td><font color="White"><strong>${c.dni}</strong></font></td>
                                <td><font size=4 color="White"><strong>${c.nombre}</strong></font></td>
                                <td><font color="White"><strong>${c.rol}</strong></font></td>
                                <td><font color="White"><strong>${c.direccion}</strong></font></td>
                                <td><font color="White"><strong>${c.correo}</strong></font></td>
                                <td><font color="White"><strong>${c.password}</strong></font></td>
                                <td>
                                    <div class="dropdown">
                                        <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                            <i class="dw dw-more"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                            <a class="dropdown-item" href="Controlador?accion=Editarc&id=${c.id}"><i class="dw dw-edit2"></i> Editar</a>
                                           
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>                    
                        </tbody>
                    </table>  
                    <% String id = request.getParameter("id");

                                        %>
                </div>


            </form>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>