<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesión</title>
    </head>
    <body>
        <div class="container">
            <div class="login-box">
                <h2>Iniciar Sesión</h2>
                <form class="login-form" action="http://localhost:8084/Loginnnn/DBPG" method="post">
                    <input type="text" name="usuario" placeholder="usuario" required><br>
                    <br>
                    <input type="password" name="contrasena" id="passwordField" placeholder="Contraseña" required>
                    <br>
                    <br>
                    <input type="submit" value="Ingresar">
                </form>
                <p> <a href="http://localhost:8084/Loginnnn/RegistroUser.jsp">Registrate</a></p>
            </div>
        </div>
    </body>
</html>
