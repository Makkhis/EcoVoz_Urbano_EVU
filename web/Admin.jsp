<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Administrador</title>
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
            padding: 40px;
            width: 300px;
            text-align: center;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 300px;
            text-align: center;
        }

        .login-box h2 {
            margin-bottom: 20px;
            color: #333333;
        }

        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            outline: none;
        }

        .login-form input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .login-form input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .login-form p {
            margin-top: 15px;
            color: #666666;
        }

        .login-form a {
            color: #007bff;
            text-decoration: none;
        }

        .login-form a:hover {
            text-decoration: underline;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            color: #333333;
            margin-bottom: 20px;
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
    <div class="header">
        <h1></h1>
    </div>
    <div class="container">
        <div class="content">
            <h2>Panel Administrativo</h2>
            <p><a href="http://localhost:8084/Loginnnn/Borrar" class="button-link">BORRAR USUARIOS</a></p>
            <p><a href="http://localhost:8084/Loginnnn/Editar" class="button-link">EDITAR USUARIOS</a></p>
            <p><a href="http://localhost:8084/Loginnnn/RevisarQuejas.jsp" class="button-link">REVISAR QUEJAS</a></p>
            <p><a href="http://localhost:8084/Loginnnn/GenerarReporte.jsp" class="button-link">GENERAR REPORTE</a></p>
            </form>
        </div>
        <p class="copyright">Todos los derechos reservados &copy; 2024</p>
    </div>
    <div class="bottom-bar">
        <a href="InicioSesion.jsp">Cerrar Sesion</a>
        <a href="#">Contacto</a>
        <a href="AvisoPrivacidad.jsp">Aviso de privacidad</a>
    </div>
</body>
</html>
</html>