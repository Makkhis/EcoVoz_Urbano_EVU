package Modelo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserReporte", urlPatterns = {"/UserReporte"})
public class UserReporte extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserReporte</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserReporte at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Obtener la CURP del usuario de la sesión
        HttpSession session = request.getSession();
        String curp = (String) session.getAttribute("curp");

        // Obtener la queja del parámetro de solicitud
        String queja = request.getParameter("queja");

        String usuario = "root";
        String contraseña = "Mybstp3t";
        String url = "jdbc:mysql://localhost:3306/Proyecto";

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, usuario, contraseña);

            // Consulta para insertar la queja en la tabla quejas
            String query = "INSERT INTO quejas (curp, queja) VALUES (?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, curp);
            pstmt.setString(2, queja);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<h1>La queja se ha enviado correctamente</h1>");
            } else {
                out.println("<h1>Error al enviar la queja</h1>");
            }

        } catch (ClassNotFoundException | SQLException e) {
            out.println("<h1>Error en la conexión o consulta</h1>");
            e.printStackTrace(out);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace(out);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
