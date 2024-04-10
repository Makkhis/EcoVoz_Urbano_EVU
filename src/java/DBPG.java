import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.PrintWriter;
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
        String contraseña = "CUTONALA";
        String url = "jdbc:mariadb://localhost:3306/Proyecto";
        
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection(url, usuario, contraseña);
            
            // Consulta para obtener el estado del usuario
            String query = "SELECT status FROM login WHERE usuario = ? AND contrasena = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, request.getParameter("usuario"));
            pstmt.setString(2, request.getParameter("contrasena"));
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
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
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
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
