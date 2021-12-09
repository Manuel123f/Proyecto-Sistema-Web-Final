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
import Utils.ConexionDB;

@WebServlet(name = "ServletCRUDempleados", urlPatterns = {"/ServletCRUDempleados"})
public class ServletCRUDempleados extends HttpServlet {

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
                request.getRequestDispatcher("empleados.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            String idU = request.getParameter("txtIdU");
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("delete from usuario where idUsuario=?");
                psta.setString(1, idU);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDempleados?txtIdC=A001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {
            String idU = request.getParameter("txtIdU");
            String tiU = request.getParameter("txtTiU");
            String nom = request.getParameter("txtNom");
            String tel = request.getParameter("txtTel");
            String DNI = request.getParameter("txtDNI");
            String dir = request.getParameter("txtDir");
            String pas = request.getParameter("txtPas");
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("insert into usuario values(?,?,?,?,?,?,?)");
                psta.setString(1, idU);
                psta.setString(2, tiU);
                psta.setString(3, nom);
                psta.setString(4, tel);
                psta.setString(5, DNI);
                psta.setString(6, dir);
                psta.setString(7, pas);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDempleados?txtIdC=A001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("editar")) {
            String idU = request.getParameter("txtIdU");
            String tiU = request.getParameter("txtTiU");
            String nom = request.getParameter("txtNom");
            String tel = request.getParameter("txtTel");
            String DNI = request.getParameter("txtDNI");
            String dir = request.getParameter("txtDir");
            String pas = request.getParameter("txtPas");
            
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("update usuario set tipoUsuario=?, nombre=?, telefono=?, DNI=?, direccion =?, password=? where idUsuario=?");
                psta.setString(1, tiU);
                psta.setString(2, nom);
                psta.setString(3, tel);
                psta.setString(4, DNI);
                psta.setString(5, dir);
                psta.setString(6, pas);
                psta.setString(7, idU);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDempleados?txtIdC=A001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("consultaId")) {
            String idU = request.getParameter("txtIdU");
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from usuario where idUsuario=?");
                psta.setString(1, idU);
                ResultSet rs = psta.executeQuery();
                ArrayList<UsuarioBeans> lista2 = new ArrayList<>();
                while (rs.next()) {
                    UsuarioBeans emp2 = new UsuarioBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                    lista2.add(emp2);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista2", lista2);
                request.getRequestDispatcher("ServletCRUDempleados?op=listar").forward(request, response);
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
