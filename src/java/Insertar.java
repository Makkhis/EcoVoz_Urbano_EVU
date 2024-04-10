import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/Insertar"})
public class Insertar extends HttpServlet {

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

        // Consulta para verificar si el usuario ya existe
        String checkQuery = "SELECT COUNT(*) FROM Login WHERE usuario = ?";
        pstmt = con.prepareStatement(checkQuery);
        pstmt.setString(1, usu);
        ResultSet resultSet = pstmt.executeQuery();
        resultSet.next();
        int existingUsers = resultSet.getInt(1);

        if (existingUsers > 0) {
            out.println("<h1>El usuario ya existe en la base de datos</h1>");
        } else {
            // Insertar un nuevo usuario en la base de datos
            String insertQuery = "INSERT INTO Login (usuario, contrasena, status) VALUES (?, ?, ?)";
            pstmt = con.prepareStatement(insertQuery);
            pstmt.setString(1, usu);
            pstmt.setString(2, contr);
            pstmt.setInt(3, status);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<h1>Registro exitoso</h1>");
            } else {
                out.println("<h1>Error en el registro</h1>");
            }
        }

    } catch (ClassNotFoundException | SQLException e) {
        out.println("<h1>Error en la conexión o consulta</h1>");
    } catch (NumberFormatException e) {
        out.println("<h1>Error en el formato del estado</h1>");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
        }
    }
}


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
