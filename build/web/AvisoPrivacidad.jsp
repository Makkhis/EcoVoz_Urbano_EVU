<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aviso de Privacidad</title>
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

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 60px;
            width: 800px; /* Aumentamos el ancho para la tabla */
            text-align: center;
        }

        h1, h2 {
            color: #333333;
        }

        p {
            margin-bottom: 20px;
            line-height: 1.5;
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
        <h1>Aviso de Privacidad</h1>
        <p>En nuestro sitio web, respetamos y protegemos la privacidad de nuestros usuarios. La siguiente declaración de privacidad proporciona una visión general de qué tipo de información se recopila y cómo se utiliza. Al usar nuestro sitio web, aceptas las prácticas descritas en esta política de privacidad.</p>
        <h2>Recopilación de información</h2>
        <p>Recopilamos información de identificación personal, como nombres, direcciones de correo electrónico, etc., solo cuando los usuarios nos la proporcionan voluntariamente a través de formularios de contacto, registros, etc.</p>
        <h2>Uso de la información</h2>
        <p>La información recopilada se utiliza para responder a consultas, procesar pedidos y mejorar nuestros productos y servicios. No compartimos esta información con terceros sin el consentimiento expreso del usuario.</p>
        <h2>Cookies</h2>
        <p>Utilizamos cookies para mejorar la experiencia del usuario. Al utilizar nuestro sitio web, aceptas el uso de cookies de acuerdo con nuestra política de privacidad.</p>
        <h2>Seguridad</h2>
        <p>Implementamos medidas de seguridad para proteger la información personal contra pérdida, uso indebido y acceso no autorizado.</p>
        <h2>Enlaces externos</h2>
        <p>Nuestro sitio web puede contener enlaces a otros sitios externos. No somos responsables de las prácticas de privacidad o el contenido de estos sitios.</p>
        <h2>Cambios en la política de privacidad</h2>
        <p>Podemos actualizar esta política de privacidad periódicamente. Se recomienda revisar esta página regularmente para estar al tanto de los cambios.</p>
    </div>
    <div class="bottom-bar">
        <a href="RevisarQuejas.jsp">Volver a pagina anterior</a>
        <!-- Otros enlaces si es necesario -->
    </div>
</body>
</html>
