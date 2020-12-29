

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
            <form action="Controlador?accion=actualizar2">
<% String id = request.getParameter("id");

                                        %>
                <div class="card container mt-4 border-success" style="width: 50rem;">
                    <div class="card-header text-white bg-dark mb-3 border-primary">
                        <h3>ACTUALIZAR PRODUCTO</h3>
                    </div>
                    <div class="card-body">

                        <div class="form-group border-success ">
                            <div class="form-group border-success">
                                <label>Id</label>
                                <input type="text" name="txtId" class="form-control border-primary" readonly="readonly"   value="<%=id%>">
                            </div>
                              <div class="form-group border-success">
                                <label>Nombre del Producto</label>
                                <input type="text" name="txtNombre" class="form-control border-primary" value="${pd.nombres}">
                            </div>
                            <div class="form-group">
                                <label>Descripcion</label>
                                <input type="text" name="txtDescripcion" class="form-control border-primary" value="${pd.descripcion}">
                            </div>
                            <div class="form-group">
                                <label>Precio</label>
                                <input type="number" name="txtPrecio" class="form-control border-primary" value="${pd.precio}">
                            </div>
                            <div class="form-group">
                                <label>Stock</label>
                                <input type="number" name="txtStock" class="form-control border-primary" value="${pd.stock}">
                            </div>
                            <div class="form-group">
                                <label>Imagen</label>
                                <input class="form-control border-primary" type="file" name="fileImagen" value="${pd.ruta}">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-white bg-dark mb-3 border-primary">
                        <button type="submit"  value="actualizar2" name="accion" class="btn btn-primary  scroll-click" rel="content-y"  data-toggle="collapse"><i class="fa fa-update-o" aria-hidden="true"></i>Actualizar</button>
                        <a href="Controlador?accion=Listar" class="btn btn-danger"><i class="fa fa-reply-all" aria-hidden="true"></i>Volver<a/>
                    </div>
                </div>

            </form>

        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
