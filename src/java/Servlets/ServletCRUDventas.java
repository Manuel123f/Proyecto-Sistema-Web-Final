package Servlets;

import Beans.ProductoBeans;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.ArrayList;
import Beans.VentaBeans;
import Utils.ConexionDB;

@WebServlet(name = "ServletCRUDventas", urlPatterns = {"/ServletCRUDventas"})
public class ServletCRUDventas extends HttpServlet {

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
                        .prepareStatement("select * from venta");
                ResultSet rs = psta.executeQuery();
                ArrayList<VentaBeans> lista = new ArrayList<>();
                while (rs.next()) {
                    VentaBeans emp = new VentaBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getString(8));
                    lista.add(emp);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("ventas.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("eliminar")) {
            String idV = request.getParameter("txtIdV");
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("delete from venta where idVenta=?");
                psta.setString(1, idV);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDventas?txtIdV=V001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("insertar")) {
            String idV = request.getParameter("txtIdV");
            String idC = request.getParameter("txtIdC");
            String noE = request.getParameter("txtNoE");
            String tiC = request.getParameter("txTic");
            String nuC = request.getParameter("txtNuc");
            String date = request.getParameter("txtDate");
            double mont = Double.parseDouble(request.getParameter("txtMont"));
            String est = request.getParameter("txtEst");

            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("insert into venta values(?,?,?,?,?,?,?,?)");
                psta.setString(1, idV);
                psta.setString(2, idC);
                psta.setString(3, noE);
                psta.setString(4, tiC);
                psta.setString(5, nuC);
                psta.setString(6, date);
                psta.setDouble(7, mont);
                psta.setString(8, est);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDventas?txtIdV=V001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("editar")) {
            String idV = request.getParameter("txtIdV");
            String idC = request.getParameter("txtIdC");
            String noE = request.getParameter("txtNoE");
            String tiC = request.getParameter("txTic");
            String nuC = request.getParameter("txtNuc");
            String date = request.getParameter("txtDate");
            double mont = Double.parseDouble(request.getParameter("txtMont"));
            String est = request.getParameter("txtEst");

            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("update venta set idCliente=?, nomEmp=?, tipoComp=?, numComp=?, fecha=?, monto=?, estado=? where idVenta=?");
                psta.setString(1, idV);
                psta.setString(2, idC);
                psta.setString(3, noE);
                psta.setString(4, tiC);
                psta.setString(5, nuC);
                psta.setString(6, date);
                psta.setDouble(7, mont);
                psta.setString(8, est);
                psta.executeUpdate();
                ConexionDB.getConexion().close();
                request.getRequestDispatcher("ServletCRUDventas?txtIdV=V001&btn=Buscar&op=consultaId").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("consultaId")) {
            String idV = request.getParameter("txtIdV");
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from venta where idVenta=?");
                psta.setString(1, idV);
                ResultSet rs = psta.executeQuery();
                ArrayList<VentaBeans> lista2 = new ArrayList<>();
                while (rs.next()) {
                    VentaBeans emp2 = new VentaBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDouble(7), rs.getString(8));
                    lista2.add(emp2);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista2", lista2);
                request.getRequestDispatcher("ServletCRUDventas?op=consultaP").forward(request, response);
            } catch (Exception e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("consultaP")) {
            String idP = request.getParameter("txtIdP");
            try {
                PreparedStatement psta = ConexionDB.getConexion()
                        .prepareStatement("select * from producto where idProducto=?");
                psta.setString(1, idP);
                ResultSet rs = psta.executeQuery();
                ArrayList<ProductoBeans> lista3 = new ArrayList<>();
                while (rs.next()) {
                    ProductoBeans emp3 = new ProductoBeans(rs.getString(1), rs.getString(2),
                            rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getDouble(8));
                    lista3.add(emp3);
                }
                ConexionDB.getConexion().close();
                request.setAttribute("lista3", lista3);
                request.getRequestDispatcher("ServletCRUDventas?op=listar").forward(request, response);
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
