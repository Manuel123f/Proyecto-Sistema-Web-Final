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
import Beans.ClienteBeans;
import Utils.ConexionDB;

@WebServlet(name = "ServletCRUDclientes", urlPatterns = {"/ServletCRUDclientes"})
public class ServletCRUDclientes extends HttpServlet {

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
                        .prepareStatement("select * from cliente");
                ResultSet rs = psta.executeQuery();
                ArrayList<ClienteBeans> lista = new ArrayList<>();
                while (rs.next()) {
                    ClienteBeans emp = new ClienteBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                    lista.add(emp);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("clientes.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            String idC = request.getParameter("txtIdC");
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("delete from cliente where idCliente=?");
                psta.setString(1, idC);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDclientes?txtIdC=C001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {
            String idC = request.getParameter("txtIdC");
            String tiC = request.getParameter("txtTiC");
            String nom = request.getParameter("txtNom");
            String tiD = request.getParameter("txtTiD");
            String doc = request.getParameter("txtDoc");
            String dir = request.getParameter("txtDir");
            String tel = request.getParameter("txtTel");
            
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("insert into cliente values(?,?,?,?,?,?,?)");
                psta.setString(1, idC);
                psta.setString(2, tiC);
                psta.setString(3, nom);
                psta.setString(4, tiD);
                psta.setString(5, doc);
                psta.setString(6, dir);
                psta.setString(7, tel);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDclientes?txtIdC=C001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("editar")) {
            String idC = request.getParameter("txtIdC");
            String tiC = request.getParameter("txtTiC");
            String nom = request.getParameter("txtNom");
            String tiD = request.getParameter("txtTiD");
            String doc = request.getParameter("txtDoc");
            String dir = request.getParameter("txtDir");
            String tel = request.getParameter("txtTel");
            
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("update cliente set tipoCliente=?, nombre=?, tipoDocumento=?, documento=?, direccion =?, telefono=? where idCliente=?");
                psta.setString(1, tiC);
                psta.setString(2, nom);
                psta.setString(3, tiD);
                psta.setString(4, doc);
                psta.setString(5, dir);
                psta.setString(6, tel);
                psta.setString(7, idC);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDclientes?txtIdC=C001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("consultaId")) {
            String idC = request.getParameter("txtIdC");
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from cliente where idCliente=?");
                psta.setString(1, idC);
                ResultSet rs = psta.executeQuery();
                ArrayList<ClienteBeans> lista2 = new ArrayList<>();
                while (rs.next()) {
                    ClienteBeans emp2 = new ClienteBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                    lista2.add(emp2);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista2", lista2);
                request.getRequestDispatcher("ServletCRUDclientes?op=listar").forward(request, response);
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
