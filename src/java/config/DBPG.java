
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/DBPG"})
public class DBPG extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String usuario = "root";
        String contraseña = "Mybstp3t";
        String url = "jdbc:mysql://localhost:3306/Proyecto";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, usuario, contraseña);

            // Consulta para obtener la CURP y el estado del usuario
            String query = "SELECT curp, status FROM login WHERE curp = ? AND contrasena = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, request.getParameter("curp"));
            pstmt.setString(2, request.getParameter("contrasena"));
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Obtener la CURP del usuario
                String curp = rs.getString("curp");

                // Establecer la CURP como atributo de sesión
                request.getSession().setAttribute("curp", curp);

                // Obtener el estado del usuario
                int status = rs.getInt("status");
                if (status == 1) {
                    // Redireccionar al enlace para administradores
                    response.sendRedirect("http://localhost:8084/Loginnnn/Admin.jsp");
                } else if (status == 2) {
                    // Redireccionar al enlace para usuarios normales
                    response.sendRedirect("http://localhost:8084/Loginnnn/Usuario.jsp");
                } else {
                    out.println("<h1>Estado de usuario desconocido</h1>");
                }
            } else {
                out.println("<h1>Usuario o contraseña incorrecta</h1>");
            }

        } catch (ClassNotFoundException | SQLException e) {
            out.println("<h1>Error en la conexión o consulta</h1>");
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
