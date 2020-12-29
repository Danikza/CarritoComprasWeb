/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Configuracion.Fecha;
import Modelo.Carrito;
import Modelo.Cliente;
import Modelo.Compra;
import Modelo.Pago;
import Modelo.Producto;
import ModeloDAO.ClienteDAO;
import ModeloDAO.CompraDAO;
import ModeloDAO.ProductoDAO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class Controlador extends HttpServlet {

    ProductoDAO pdao = new ProductoDAO();
    ClienteDAO cdao = new ClienteDAO();
    Cliente clien = new Cliente();
    Producto p = new Producto();
    List<Producto> productos = new ArrayList<>();
    List<Carrito> listaCarritos = new ArrayList<>();
    List<Cliente> clientes = new ArrayList<>();
    int r;
    int item;
    double totalPagar = 0.0;
    int cantidad = 1;
    int idp;
    Carrito car;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        productos = pdao.listar();

        switch (accion) {
            case "Comprar":
                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarId(idp);
                item = item + 1;
                Carrito car = new Carrito();
                car.setItem(item);
                car.setIdProducto(p.getId());
                car.setNombres(p.getNombres());
                car.setDescripcion(p.getDescripcion());
                car.setRuta(p.getRuta());
                car.setPrecioCompra(p.getPrecio());
                car.setCantidad(cantidad);
                car.setSubTotal(cantidad * p.getPrecio());
                listaCarritos.add(car);
                for (int i = 0; i < listaCarritos.size(); i++) {
                    totalPagar = totalPagar + listaCarritos.get(i).getSubTotal();
                }
                request.setAttribute("carrito", listaCarritos);
                request.setAttribute("contador", listaCarritos.size());
                request.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);

                break;
            case "AgregarCarrito":
                int pos = 0;
                idp = Integer.parseInt(request.getParameter("id"));
                p = pdao.listarId(idp);
                if (listaCarritos.size() > 0) {
                    for (int i = 0; i < listaCarritos.size(); i++) {
                        if (idp == listaCarritos.get(i).getIdProducto()) {
                            pos = i;
                        }
                    }
                    if (idp == listaCarritos.get(pos).getIdProducto()) {
                        cantidad = listaCarritos.get(pos).getCantidad() + cantidad;
                        double subtotal = listaCarritos.get(pos).getPrecioCompra() * cantidad;
                        listaCarritos.get(pos).setCantidad(cantidad);
                        listaCarritos.get(pos).setSubTotal(subtotal);

                    } else {
                        item = item + 1;
                        car = new Carrito();
                        car.setItem(item);
                        car.setIdProducto(p.getId());
                        car.setNombres(p.getNombres());
                        car.setDescripcion(p.getDescripcion());
                        car.setRuta(p.getRuta());
                        car.setPrecioCompra(p.getPrecio());
                        car.setCantidad(cantidad);
                        car.setSubTotal(cantidad * p.getPrecio());
                        listaCarritos.add(car);
                    }

                } else {
                    item = item + 1;
                    car = new Carrito();
                    car.setItem(item);
                    car.setIdProducto(p.getId());
                    car.setNombres(p.getNombres());
                    car.setDescripcion(p.getDescripcion());
                    car.setRuta(p.getRuta());
                    car.setPrecioCompra(p.getPrecio());
                    car.setCantidad(cantidad);
                    car.setSubTotal(cantidad * p.getPrecio());
                    listaCarritos.add(car);
                }

                request.setAttribute("contador", listaCarritos.size());
                request.getRequestDispatcher("Controlador?accion=home").forward(request, response);
                break;

            case "Delete":
                int idproducto = Integer.parseInt(request.getParameter("idp"));
                for (int i = 0; i < listaCarritos.size(); i++) {
                    if (listaCarritos.get(i).getIdProducto() == idproducto) {
                        listaCarritos.remove(i);
                    }
                }

                break;
            case "ActualizarCantidad":
                int idpro = Integer.parseInt(request.getParameter("idp"));
                int cant = Integer.parseInt(request.getParameter("Cantidad"));
                for (int i = 0; i < listaCarritos.size(); i++) {
                    if (listaCarritos.get(i).getIdProducto() == idpro) {
                        listaCarritos.get(i).setCantidad(cant);
                        double st = listaCarritos.get(i).getPrecioCompra() * cant;
                        listaCarritos.get(i).setSubTotal(st);
                    }
                }
                break;

            case "Carrito":
                totalPagar = 0.0;
                request.setAttribute("carrito", listaCarritos);
                for (int i = 0; i < listaCarritos.size(); i++) {
                    totalPagar = totalPagar + listaCarritos.get(i).getSubTotal();
                }

                request.setAttribute("totalPagar", totalPagar);
                request.getRequestDispatcher("carrito.jsp").forward(request, response);

                break;
            case "GenerarCompras":
                for (int i = 0; i < listaCarritos.size(); i++) {
                    Producto pr = new Producto();
                    int can = listaCarritos.get(i).getCantidad();
                    int idprod = listaCarritos.get(i).getIdProducto();
                    ProductoDAO prodao = new ProductoDAO();
                    pr = prodao.buscar(idprod);
                    int act = pr.getStock() - can;
                    prodao.modificarCant(act, idprod);
                }
                HttpSession session = request.getSession();
                Cliente cl = (Cliente) session.getAttribute("usuario");
                CompraDAO dao = new CompraDAO();
                Pago pago = new Pago();
                Compra compra = new Compra(cl, 1, Fecha.FechaBD(), totalPagar, "Cancelado", listaCarritos);
                int res = dao.GenerarCompra(compra);
                if (res != 0 && totalPagar > 0) {
                    request.getRequestDispatcher("mensaje.jsp").forward(request, response);

                } else {
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                break;

            case "Guardar":

                ArrayList<String> lista = new ArrayList<>();
                try {
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem) items.get(i);
                        if (!fileItem.isFormField()) {
                            File f = new File("C:\\xampp\\htdocs\\img\\" + fileItem.getName());
                            fileItem.write(f);
                            p.setRuta("http://localhost/img/" + fileItem.getName());
                        } else {
                            lista.add(fileItem.getString());

                        }

                    }
                    p.setNombres(lista.get(0));
                    p.setDescripcion(lista.get(1));
                    p.setPrecio(Double.valueOf(lista.get(2)));
                    p.setStock(Integer.valueOf(lista.get(3)));
                    pdao.agregar(p);
                } catch (Exception e) {
                }
                request.getRequestDispatcher("AgregarProducto.jsp").forward(request, response);
                break;

            case "Listar":
                List<Producto> producto = pdao.listar();
                request.setAttribute("producto", producto);
                request.getRequestDispatcher("ListarProducto.jsp").forward(request, response);
                break;

            case "Editar":

                int ID = Integer.valueOf(request.getParameter("id"));
                Producto pd = pdao.modificar(ID);
                request.setAttribute("pd", pd);
                request.getRequestDispatcher("EditarProducto.jsp").forward(request, response);
                break;

            case "Editarc":

                int IDc = Integer.valueOf(request.getParameter("id"));
                Cliente c = cdao.buscar(IDc);
                request.setAttribute("c", c);
                request.getRequestDispatcher("EditarCliente.jsp").forward(request, response);
                break;

            case "Actualizar":
                ArrayList<String> lista2 = new ArrayList<>();
                try {
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    List items = fileUpload.parseRequest(request);
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileItem = (FileItem) items.get(i);
                        if (!fileItem.isFormField()) {
                            File f = new File("C:\\xampp\\htdocs\\img\\" + fileItem.getName());
                            fileItem.write(f);
                            p.setRuta("http://localhost/img/" + fileItem.getName());
                        } else {
                            lista2.add(fileItem.getString());

                        }

                    }
                    p.setId(Integer.valueOf(lista2.get(0)));
                    p.setNombres(lista2.get(1));
                    p.setDescripcion(lista2.get(2));
                    p.setPrecio(Double.valueOf(lista2.get(3)));
                    p.setStock(Integer.valueOf(lista2.get(4)));
                    pdao.actualizar(p);
                } catch (Exception e) {
                }
                request.getRequestDispatcher("ListarProducto.jsp").forward(request, response);
                break;
            case "actualizar2":
                int resp = 0;
                int Id = Integer.valueOf(request.getParameter("txtId"));
                String nombres = request.getParameter("txtNombre");
                String Descripcion = request.getParameter("txtDescripcion");
                String pre = request.getParameter("txtPrecio");
                double prec = Double.parseDouble(pre);
                int stock = Integer.valueOf(request.getParameter("txtStock"));
                String ruta = request.getParameter("fileImagen");

                p = new Producto(Id, nombres, "http://localhost/img/" + ruta, Descripcion, prec, stock);

                resp = pdao.actualizar(p);
                if (resp == 0) {

                    request.getRequestDispatcher("mensajea.jsp").forward(request, response);
                } else {

                    request.getRequestDispatcher("errora.jsp").forward(request, response);
                }
                break;
            case "actualizarc":
                int re = 0;
                int Idc = Integer.valueOf(request.getParameter("txtId"));
                String dni2 = request.getParameter("txtDNI");
                String nombre2 = request.getParameter("txtNombres");
                String rol2 = request.getParameter("txtRol");
                String direc = request.getParameter("txtDireccion");
                String cor = request.getParameter("txtCorreo");
                String pass = request.getParameter("txtPassword");

                c = new Cliente(Idc, dni2, nombre2, rol2, direc, cor, pass);

                re = cdao.actualizar(c);
                if (re == 0) {

                    request.getRequestDispatcher("mensaje2.jsp").forward(request, response);
                } else {

                    request.getRequestDispatcher("error2.jsp").forward(request, response);
                }
                break;

            case "Nuevo":

                String dni = request.getParameter("txtDNI");
                String nombre = request.getParameter("txtNombres");
                String rol = request.getParameter("txtRol");
                String direccion = request.getParameter("txtDireccion");
                String correo = request.getParameter("txtCorreo");
                String password = request.getParameter("txtPassword");

                Cliente cli = new Cliente();
                cli.setDni(dni);
                cli.setNombre(nombre);
                cli.setRol(rol);
                cli.setDireccion(direccion);
                cli.setCorreo(correo);
                cli.setPassword(password);

                cdao.agregar(cli);

                request.getRequestDispatcher("AgregarCliente.jsp").forward(request, response);
                break;

            case "Listarc":
                List<Cliente> usuario = cdao.listar();
                request.setAttribute("cliente", usuario);
                request.getRequestDispatcher("ListarCliente.jsp").forward(request, response);
                break;

            case "Entrar":

                request.setAttribute("productos", productos);
                request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
                break;

            case "home":
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
                break;

            case "Salir":
                HttpSession sessio = request.getSession();
                sessio.removeAttribute("usuario");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;

            default:
                request.setAttribute("productos", productos);
                request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
