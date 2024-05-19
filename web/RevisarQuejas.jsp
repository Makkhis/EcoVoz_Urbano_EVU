<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Revisar Quejas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 90vh;
            background-image: url('imagenes/catedral.webp');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9); 
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 100px;
            width: 800px;
            text-align: center;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 100px;
            width: 800px;
            text-align: center;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            border: 1px solid #dddddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        form {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        select, input[type="submit"] {
            padding: 10px;
            margin: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .copyright {
            margin-top: 12px;
            font-size: 10px;
            color: #666666;
        }
        .bottom-bar {
            background-color: white;
            width: 100%;
            height: 30px;
            display: flex;
            justify-content: space-around;
            align-items: center;
            color: white;
            position: fixed;
            bottom: 0;
            left: 0;
        }
        .bottom-bar a {
            text-decoration: none;
            color: black;
        }
        /* Botón estilo enlace */
        .button-link {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            text-decoration: none;
            display: inline-block;
            margin: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button-link:hover {
            background-color: #0056b3;
        }
        .copyright {
            margin-top: 12px;
            font-size: 10px;
            color: #666666;
        }
        .bottom-bar {
            background-color: white;
            width: 100%;
            height: 30px;
            display: flex;
            justify-content: space-around;
            align-items: center;
            color: white;
            position: fixed;
            bottom: 0;
            left: 0;
        }
        .bottom-bar a {
            text-decoration: none;
            color: black;
        }
        /* Botón estilo enlace */
        .button-link {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            text-decoration: none;
            display: inline-block;
            margin: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button-link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="content">
    <% if (request.getAttribute("mensajeExito") != null) { %>
        <div class="alert alert-success">
            <%= request.getAttribute("mensajeExito") %>
        </div>
    <% } %>
    
    <h1>Revisar Quejas</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>CURP</th>
            <th>Descripción</th>
            <th>Modificar Estado</th>
        </tr>
        <p class="copyright">Todos los derechos reservados &copy; 2024</p>
    </div>
    <div class="bottom-bar">
        <a href="InicioSesion.jsp">cerrar sesion</a>
        <a href="#">Contacto</a>
        <a href="AvisoPrivacidad.jsp">Aviso de privacidad</a>
    </div>
        <% 
            // Obtener datos de la base de datos y llenar la tabla
            try {
                // Código para establecer la conexión a la base de datos y obtener los datos de la tabla 'quejas'
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;

                // Establecer la conexión a la base de datos
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/Proyecto";
                String usuario = "root";
                String contraseña = "Mybstp3t";
                con = DriverManager.getConnection(url, usuario, contraseña);

                // Consulta SQL para obtener las quejas
                String query = "SELECT * FROM quejas";
                stmt = con.createStatement();
                rs = stmt.executeQuery(query);

                // Iterar sobre el resultado y generar filas de la tabla
                while (rs.next()) {
                    int idQueja = rs.getInt("id");
                    String curp = rs.getString("curp");
                    String queja = rs.getString("queja");
                    int estadoActual = rs.getInt("nuevoEstado");

                    out.println("<tr>");
                    out.println("<td>" + idQueja + "</td>");
                    out.println("<td>" + curp + "</td>");
                    out.println("<td>" + queja + "</td>");
                    out.println("<td>");
                    out.println("<form method=\"post\" action=\"AdminReportes\">");
                    out.println("<input type=\"hidden\" name=\"idQueja\" value=\"" + idQueja + "\">");
                    out.println("<select name=\"nuevoEstado\">");
                    out.println("<option value=\"1\" " + (estadoActual == 1 ? "selected" : "") + ">Denegada</option>");
                    out.println("<option value=\"2\" " + (estadoActual == 2 ? "selected" : "") + ">En Revisión</option>");
                    out.println("<option value=\"3\" " + (estadoActual == 3 ? "selected" : "") + ">En Resolución</option>");
                    out.println("<option value=\"4\" " + (estadoActual == 4 ? "selected" : "") + ">Resuelta</option>");
                    out.println("</select>");
                    out.println("<input type=\"submit\" value=\"Actualizar\">");
                    out.println("</form>");
                    out.println("</td>");
                }

                // Cerrar recursos
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>

