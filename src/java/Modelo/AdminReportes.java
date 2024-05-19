package Modelo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminReportes")
public class AdminReportes extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        int idQueja = Integer.parseInt(request.getParameter("idQueja"));
        int nuevoEstado = Integer.parseInt(request.getParameter("nuevoEstado"));

        // Realizar la actualización en la base de datos
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            // Establecer la conexión a la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/Proyecto";
            String usuario = "root";
            String contraseña = "Mybstp3t";
            con = DriverManager.getConnection(url, usuario, contraseña);

            // Consulta SQL para actualizar el estado de la queja
            String query = "UPDATE quejas SET nuevoEstado = ? WHERE id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, nuevoEstado);
            pstmt.setInt(2, idQueja);

            // Ejecutar la actualización
            int filasActualizadas = pstmt.executeUpdate();
            if (filasActualizadas > 0) {
                // La actualización fue exitosa
                // Establecer atributos de solicitud para mantener el estado seleccionado
                request.setAttribute("idQueja", idQueja);
                request.setAttribute("estadoSeleccionado", nuevoEstado);
                // Enviar respuesta al cliente
                request.getRequestDispatcher("RevisarQuejas.jsp").forward(request, response);
            } else {
                // No se pudo actualizar la queja
                response.sendRedirect("pagina_de_error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Manejar cualquier excepción que pueda ocurrir durante la actualización
            response.sendRedirect("pagina_de_error.jsp");
        } finally {
            // Cerrar recursos
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}

