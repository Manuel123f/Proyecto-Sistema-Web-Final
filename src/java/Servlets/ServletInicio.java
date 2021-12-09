/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.ArrayList;
import Beans.UsuarioBeans;
import Beans.ClienteBeans;
import Beans.ProductoBeans;
import Beans.VentaBeans;
import Utils.ConexionDB;

/**
 *
 * @author Asteror
 */
@WebServlet(name = "ServletInicio", urlPatterns = {"/ServletInicio"})
public class ServletInicio extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

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
        
        String op = request.getParameter("op");
        
        if (op.equals("listar")) {
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from usuario");
                ResultSet rs = psta.executeQuery();
                ArrayList<UsuarioBeans> lista = new ArrayList<>();
                while (rs.next()) {
                    UsuarioBeans emp = new UsuarioBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                    lista.add(emp);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("ServletInicio?op=listar2").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }else if (op.equals("listar2")) {
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from venta");
                ResultSet rs = psta.executeQuery();
                ArrayList<VentaBeans> lista2 = new ArrayList<>();
                while (rs.next()) {
                    VentaBeans emp = new VentaBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getString(8));
                    lista2.add(emp);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista2", lista2);
                request.getRequestDispatcher("ServletInicio?op=listar3").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }else if (op.equals("listar3")) {
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from venta");
                ResultSet rs = psta.executeQuery();
                ArrayList<VentaBeans> lista3 = new ArrayList<>();
                while (rs.next()) {
                    VentaBeans emp = new VentaBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getString(8));
                    lista3.add(emp);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista3", lista3);
                request.getRequestDispatcher("ServletInicio?op=listar4").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }else if (op.equals("listar4")) {
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from venta");
                ResultSet rs = psta.executeQuery();
                ArrayList<VentaBeans> lista4 = new ArrayList<>();
                while (rs.next()) {
                    VentaBeans emp = new VentaBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getString(8));
                    lista4.add(emp);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista4", lista4);
                request.getRequestDispatcher("ServletInicio?op=listar5").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }else if (op.equals("listar5")) {
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from cliente");
                ResultSet rs = psta.executeQuery();
                ArrayList<ClienteBeans> lista5 = new ArrayList<>();
                while (rs.next()) {
                    ClienteBeans emp = new ClienteBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                    lista5.add(emp);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista5", lista5);
                request.getRequestDispatcher("ServletInicio?op=listar6").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }else if (op.equals("listar6")) {
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from venta");
                ResultSet rs = psta.executeQuery();
                ArrayList<VentaBeans> lista6 = new ArrayList<>();
                while (rs.next()) {
                    VentaBeans emp = new VentaBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getString(8));
                    lista6.add(emp);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista6", lista6);
                request.getRequestDispatcher("inicio.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        }
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
