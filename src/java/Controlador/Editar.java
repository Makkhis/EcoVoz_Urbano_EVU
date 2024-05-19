package Controlador;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author moise
 */
@WebServlet(urlPatterns = {"/Editar"})
public class Editar extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Editar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<form action=\"http://localhost:8084/Loginnnn/Editar\" method=\"post\">");
            out.println("ID a editar: <input type=\"text\" name=\"idEditar\" placeholder=\"ID\" required>");
            out.println("<input type=\"submit\" name=\"submit\" value=\"Editar\">");
            out.println("Usuario: <input type=\"text\" name=\"usuario\" placeholder=\"usuario\" required value=\"\">");
            out.println("Contraseña: <input type=\"password\" name=\"contrasena\" placeholder=\"contraseña\" required value=\"\">");
            out.println("Status: <select name=\"status\" required>");
            out.println("<option value=\"1\">ADMINISTRADOR</option>");
            out.println("<option value=\"2\">USUARIO</option>");
            out.println("</select>");
            out.println("<input type=\"submit\" value=\"APLICAR\">");
            out.println("</form>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String usuario = "root";
        String contraseña = "CUTONALA";
        String url = "jdbc:mariadb://localhost:3306/Proyecto";

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection(url, usuario, contraseña);

            String usu = request.getParameter("usuario");
            String contr = request.getParameter("contrasena");
            int status = Integer.parseInt(request.getParameter("status"));

            String idEditar = request.getParameter("idEditar"); // Obtener el ID a editar

            // Verificar si se proporcionó un ID para editar
            if (idEditar != null && !idEditar.isEmpty()) {
                // Realizar una consulta para obtener los datos del usuario correspondientes al ID proporcionado
                String querySelect = "SELECT usuario, contrasena, status FROM Login WHERE id = ?";
                pstmt = con.prepareStatement(querySelect);
                pstmt.setString(1, idEditar);
                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    // Si se encontraron datos, llenar los campos del formulario con esos datos
                    String usuarioDB = rs.getString("usuario");
                    String contrasenaDB = rs.getString("contrasena");
                    int statusDB = rs.getInt("status");

                    // Llenar los campos del formulario con los datos recuperados
                    out.println("Usuario: <input type=\"text\" name=\"usuario\" value=\"" + usuarioDB + "\" placeholder=\"usuario\" required>");
                    out.println("Contraseña: <input type=\"password\" name=\"contrasena\" value=\"" + contrasenaDB + "\" placeholder=\"contraseña\" required>");
                    out.println("Status: <select name=\"status\" required>");
                    out.println("<option value=\"1\"" + (statusDB == 1 ? " selected" : "") + ">ADMINISTRADOR</option>");
                    out.println("<option value=\"2\"" + (statusDB == 2 ? " selected" : "") + ">USUARIO</option>");
                    out.println("</select>");
                    out.println("<input type=\"hidden\" name=\"idEditar\" value=\"" + idEditar + "\">"); // Mantener el ID original oculto
                    out.println("<input type=\"submit\" value=\"Guardar\">"); // Cambiar el valor del botón a "Guardar"
                } else {
                    out.println("<h1>ID no encontrado</h1>");
                }
            } else {
                out.println("<h1>Error: No se proporcionó un ID para editar</h1>");
            }

        } catch (ClassNotFoundException | SQLException e) {
            out.println("<h1>Error en la conexión</h1>");
        } catch (NumberFormatException e) {
            out.println("<h1>Error/h1>");
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // Manejo de errores de cierre de recursos
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
