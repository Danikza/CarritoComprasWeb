/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Configuracion.Conexion;
import Modelo.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ClienteDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    public int agregar(Cliente c) {
        Conexion cn = new Conexion();
        String sql = "insert into cliente(Dni,Nombres,rol,Direccion,Correo,Password)values(?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getDni());
            ps.setString(2, c.getNombre());
            ps.setString(3, c.getRol());
            ps.setString(4, c.getDireccion());
            ps.setString(5, c.getCorreo());
            ps.setString(6, c.getPassword());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public List listar() {
        List<Cliente> clientes = new ArrayList();
        String sql = "select * from cliente";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId(rs.getInt(1));
                c.setDni(rs.getString(2));
                c.setNombre(rs.getString(3));
                c.setRol(rs.getString(4));
                c.setDireccion(rs.getString(5));
                c.setCorreo(rs.getString(6));
                c.setPassword(rs.getString(7));
                clientes.add(c);
            }
        } catch (Exception e) {
        }
        return clientes;
    }

    public Cliente buscar(int id) {
        Cliente c = new Cliente();
        String sql = "select * from cliente where idCliente=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                c.setId(rs.getInt(1));
                c.setDni(rs.getString(2));
                c.setNombre(rs.getString(3));
                c.setRol(rs.getString(4));
                c.setDireccion(rs.getString(5));
                c.setCorreo(rs.getString(6));
                c.setPassword(rs.getString(7));

            }
        } catch (Exception e) {
        }
        return c;

    }

    public int actualizar(Cliente c) {
        int resultado = 0;
        String sql = "update cliente set Dni=?,Nombres=?,rol=?,Direccion=?,Correo=?,Password=? where idCliente =?";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getDni());
            ps.setString(2, c.getNombre());
            ps.setString(3, c.getRol());
            ps.setString(4, c.getDireccion());
            ps.setString(5, c.getCorreo());
            ps.setString(6, c.getPassword());
            ps.setInt(7, c.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error para actualizar base de datos" + e);

        }
        return resultado;
    }

    public Cliente validar(String cor, String pass, String rol) {
        Cliente clien = new Cliente();
        String sql = "select * from cliente where Correo=? and Password=? and Rol=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cor);
            ps.setString(2, pass);
            ps.setString(3, rol);
            rs = ps.executeQuery();
            while (rs.next()) {
                clien.setId(rs.getInt("idCliente"));
                clien.setDni(rs.getString("Dni"));
                clien.setNombre(rs.getString("Nombres"));
                clien.setRol(rs.getString("rol"));
                clien.setDireccion(rs.getString("Direccion"));
                clien.setCorreo(rs.getString("Correo"));
                clien.setPassword(rs.getString("Password"));
            }

        } catch (Exception e) {

        }
        return clien;
    }
}
