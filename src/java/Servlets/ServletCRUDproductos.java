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
import Beans.ProductoBeans;
import Utils.ConexionDB;

@WebServlet(name = "ServletCRUDproductos", urlPatterns = {"/ServletCRUDproductos"})
public class ServletCRUDproductos extends HttpServlet {

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
                        .prepareStatement("select * from producto");
                ResultSet rs = psta.executeQuery();
                ArrayList<ProductoBeans> lista = new ArrayList<>();
                while (rs.next()) {
                    ProductoBeans emp = new ProductoBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getDouble(8));
                    lista.add(emp);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("productos.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            String idP = request.getParameter("txtIdP");
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("delete from producto where idProducto=?");
                psta.setString(1, idP);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDproductos?txtIdP=P001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {
            String idP = request.getParameter("txtIdP");
            String nom = request.getParameter("txtNom");
            String tiP = request.getParameter("txtTiP");
            String pro = request.getParameter("txtPro");
            String des = request.getParameter("txtDes");
            String img = request.getParameter("txtImg");
            int sto = Integer.parseInt(request.getParameter("txtSto"));
            double pre = Double.parseDouble(request.getParameter("txtPre"));

            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("insert into producto values(?,?,?,?,?,?,?,?)");
                psta.setString(1, idP);
                psta.setString(2, nom);
                psta.setString(3, tiP);
                psta.setString(4, pro);
                psta.setString(5, des);
                psta.setString(6, img);
                psta.setInt(7, sto);
                psta.setDouble(8, pre);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDproductos?txtIdP=P001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("editar")) {
            String idP = request.getParameter("txtIdP");
            String nom = request.getParameter("txtNom");
            String tiP = request.getParameter("txtTiP");
            String pro = request.getParameter("txtPro");
            String des = request.getParameter("txtDes");
            String img = request.getParameter("txtImg");
            int sto = Integer.parseInt(request.getParameter("txtSto"));
            double pre = Double.parseDouble(request.getParameter("txtPre"));

            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("update producto set nombre=?, tipoProducto=?, proveedor=?, descripcion=?, imagen=?, stock=?, precio=? where idProducto=?");
                psta.setString(1, nom);
                psta.setString(2, tiP);
                psta.setString(3, pro);
                psta.setString(4, des);
                psta.setString(5, img);
                psta.setInt(6, sto);
                psta.setDouble(7, pre);
                psta.setString(8, idP);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDproductos?txtIdP=P001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("consultaId")) {
            String idP = request.getParameter("txtIdP");
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from producto where idProducto=?");
                psta.setString(1, idP);
                ResultSet rs = psta.executeQuery();
                ArrayList<ProductoBeans> lista2 = new ArrayList<>();
                while (rs.next()) {
                    ProductoBeans emp2 = new ProductoBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getDouble(8));
                    lista2.add(emp2);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista2", lista2);
                request.getRequestDispatcher("ServletCRUDproductos?op=listar").forward(request, response);
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
