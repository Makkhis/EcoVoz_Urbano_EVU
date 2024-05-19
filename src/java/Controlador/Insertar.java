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

@WebServlet("/Insertar")
public class Insertar extends HttpServlet {

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

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, usuario, contraseña);

            String usu = request.getParameter("usuario");
            String contr = request.getParameter("contrasena");
            String cur = request.getParameter("curp");
            String statusParam = request.getParameter("status");
            String estadoParam = request.getParameter("estado");

            if (
                statusParam != null && !statusParam.isEmpty() &&
                estadoParam != null && !estadoParam.isEmpty()) {
                int status = Integer.parseInt(statusParam);
                int estado = Integer.parseInt(estadoParam);

                // Consulta para verificar si la CURP ya existe
                String checkQuery = "SELECT COUNT(*) FROM Login WHERE curp = ?";
                pstmt = con.prepareStatement(checkQuery);
                pstmt.setString(1, cur);
                ResultSet resultSet = pstmt.executeQuery();
                resultSet.next();
                int existingCURP = resultSet.getInt(1);

                if (existingCURP > 0) {
                    out.println("<h1>La CURP ya existe en la base de datos</h1>");
                } else {
                    // Insertar un nuevo usuario en la base de datos
                    String insertQuery = "INSERT INTO Login (usuario, contrasena, status, curp, estado) VALUES (?, ?, ?, ?, ?)";
                    pstmt = con.prepareStatement(insertQuery);
                    pstmt.setString(1, usu);
                    pstmt.setString(2, contr);
                    pstmt.setInt(3, status);
                    pstmt.setString(4, cur);
                    pstmt.setInt(5, estado);
                    

                    int rowsAffected = pstmt.executeUpdate();

                    if (rowsAffected > 0) {
                        out.println("<h1>Registro exitoso</h1>");
                    } else {
                        out.println("<h1>Error en el registro</h1>");
                    }
                }
            } else {
                out.println("<h1>Los parámetros municipio, status o estado no son válidos</h1>");
            }

        } catch (ClassNotFoundException | SQLException e) {
            out.println("<h1>ERROR: Verifique sus datos</h1>");
            e.printStackTrace(out);
        } catch (NumberFormatException e) {
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
