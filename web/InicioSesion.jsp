<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
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
            background-color: rgba(255, 255, 255, 0.5); /* Color de fondo del recuadro con transparencia */
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
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">Quejas Comunitarias</h1>
        <div class="login-box">
            <h3>Iniciar Sesión</h3>
            <form class="login-form" action="http://localhost:8084/Loginnnn/DBPG" method="post">
                <input type="text" name="curp" placeholder="Ingresa tu CURP" required><br><br>
                <input type="password" name="contrasena" id="passwordField" placeholder="Contraseña" required><br><br>
                <input type="submit" value="Ingresar">
            </form>
            <p>¿Nuevo por aquí? <a href="http://localhost:8084/Loginnnn/RegistroUser.jsp">Regístrate</a></p>
        </div>
        <p class="copyright">Todos los derechos reservados &copy; 2024</p>
    </div>
    <div class="bottom-bar">
        <a href="#">Acerca de nosotros</a>
        <a href="#">Contacto</a>
        <a href="AvisoPrivacidad,jsp">Aviso de privacidad</a>
    </div>
</body>
</html>
