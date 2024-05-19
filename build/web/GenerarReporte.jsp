<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generar Reporte</title>
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

        .container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            outline: none;
            resize: none;
        }

        .container input[type="submit"] {
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

        .container input[type="submit"]:hover {
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Generar Reporte de Estado de Quejas</h1>
        <form action="GuardarReporte.jsp" method="post">
            <textarea name="reporte" rows="10" cols="50" placeholder="Escribe aquí tu reporte..."></textarea>
            <br>
            <input type="submit" value="Guardar Reporte">
        </form>
        <p class="copyright">Todos los derechos reservados &copy; 2024</p>
    </div>
    <div class="bottom-bar">
        <a href="#">Acerca de nosotros</a>
        <a href="#">Contacto</a>
        <a href="AvisoPrivacidad,jsp">Aviso de privacidad</a>
    </div>
</body>
</html>