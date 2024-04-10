<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Registro</title>
</head>
<body>
    <div class="container">
        <h2>Registro de Usuario</h2>
        <form action="http://localhost:8084/Loginnnn/Insertar" method="post">
            Nombre de Usuario:<br>
            <input type="text" id="usuario" name="usuario" required><br>

            Contraseña:<br>
            <input type="password" id="contrasena" name="contrasena" required><br>

            Tipo de Usuario:<br>
            <select id="status" name="status" required>
                <!-- comment <option value="1">Administrador</option>-->
                <option value="2">Usuario</option>
            </select><br>
            <br>

            <input type="submit" value="Registrar">
        </form>
    </div>
</body>
</html>
