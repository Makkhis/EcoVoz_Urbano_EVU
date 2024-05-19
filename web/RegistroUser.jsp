<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Registro</title>
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
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 300px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333333;
        }

        form input[type="text"],
        form input[type="password"],
        form select {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            outline: none;
        }

        form input[type="submit"] {
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

        form input[type="submit"]:hover {
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
    <h2>Registro de Usuario</h2>
    <form action="Insertar" method="post">
        Nombre Completo:<br>
        <input type="text" id="usuario" name="usuario" required><br>

        CURP:<br>
        <input type="text" id="curp" name="curp" required><br>

        Estado:<br>
        <select id="estado" name="estado" required>
            <option value="1">Jalisco</option>
        </select><br>
        
        <!-- comment Municipio:<br>
        <select id="municipio" name="Munucipio" required>
            <option value="1">Guadalajara</option>
            <option value="2">Tonala</option>
            <option value="3">Tlaquepaque</option>
            <option value="3">Zapopan</option>
        </select><br>-->

        

        Contraseña:<br>
        <input type="password" id="contrasena" name="contrasena" required><br>

        Sexo:<br>
        <select id="status" name="status" required>
            <option value="2">Hombre</option>
            <option value="2">Mujer</option>
            <option value="2">Prefiero no decirlo</option>
        </select><br>
        <br>

        <input type="submit" value="Registrar">
    </form>
    <p class="copyright">Todos los derechos reservados &copy; 2024</p>
</div>
    <div class="bottom-bar">
        <a href="#">Acerca de nosotros</a>
        <a href="#">Contacto</a>
        <a href="#">Aviso de privacidad</a>
    </div>
</body>
</html>

