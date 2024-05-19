<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    // Verificar si la sesión contiene la CURP del usuario
    String curp = (String) session.getAttribute("curp");
    String username = "";
    
    // Si la CURP está presente, obtener el nombre de usuario asociado a esa CURP
    if (curp != null) {
        // Realizar la conexión a la base de datos y obtener el nombre de usuario
        String usuario = "root";
        String contraseña = "Mybstp3t";
        String url = "jdbc:mysql://localhost:3306/Proyecto";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection(url, usuario, contraseña);
            
            String query = "SELECT usuario FROM login WHERE curp = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, curp);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                username = rs.getString("usuario");
            }
        } catch (ClassNotFoundException | SQLException e) {
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
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Página de Usuario</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('imagenes/catedral.webp');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .header {
            background-color: rgba(0, 123, 255, 0.8);
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        .container {
            max-width: 800px;
            margin: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .content h4 {
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .content p {
            line-height: 1.6;
            color: #333;
        }
        .content b {
            color: #007bff;
        }
        textarea {
            width: calc(100% - 20px);
            height: 200px;
            padding: 10px;
            box-sizing: border-box;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: none;
        }
        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Bienvenido, <%= username.isEmpty() ? "Usuario" : username %></h1>
    </div>
    <div class="container">
        <div class="content">
            <h4>INDICACIONES</h4>
            <p>EN ESTE ESPACIO PODRÁS PONER TU QUEJA O TU SUGERENCIA. LAS RECOMENDACIONES QUE TENEMOS PARA QUE SU REVISIÓN SEA MÁS ÁGIL SON LAS SIGUIENTES:<br><br>
            <b>1-SER BREVE Y CONCISO CON LAS IDEAS QUE QUIERES TRANSMITIR</b> - AL PONER MUCHO TEXTO NUESTROS ADMINISTRADORES TARDAN MÁS EN REVISAR Y ANALIZAR TU QUEJA O PROPUESTA, POR LO QUE SE TE RECOMIENDA SER BREVE.<br><br>
            <b>2-NO USAR LENGUAJE INAPROPIADO O SERÁS EXPULSADO</b><br><br>
            </p>
            
            <form class="login-form" action="http://localhost:8084/Loginnnn/UserReporte" method="post">
                <textarea name="queja" placeholder="Escribe tu queja o sugerencia aquí"></textarea>
                <button type="submit">Enviar</button>
            </form>

        </div>
    </div>
</body>
</html>