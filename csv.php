<?php
// Iniciar la sesión (asegúrate de hacerlo antes de cualquier salida)
session_start();

// Verificar si el usuario está autenticado
if (!isset($_SESSION['autenticado']) || !$_SESSION['autenticado']) {
    // Si no está autenticado, redirigir a la página de autenticación
    header("Location: admin.html");
    exit(); // Asegúrate de salir después de la redirección
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel='stylesheet' href='Resources/styles.css'>
</head>

<body>
    <style>
        body,
        html {
            margin: 0;
            padding: 0;
        }
    </style>
    <div id="wrapper">
        <aside id="sidebar-wrapper">
            <div class="sidebar-brand">
                <h2>TRACE</h2>
            </div>
            <ul class="sidebar-nav">
                <li>
                    <a href="index.html"><i class="fa fa-home"></i>Inicio</a>
                </li>
                <li>
                    <a href="tablas.html"><i class="fa fa-linkedin"></i>Tablas</a>
                </li>
                <li>
                    <a href="howitworks.html"><i class="fa fa-book"></i>Como funciona</a>
                </li>
                <li>
                    <a href="aboutus.html"><i class="fa fa-institution"></i>Acerca de nosotros</a>
                </li>
                <li>
                    <a href="faq.html"><i class="fa fa-question"></i>FAQ</a>
                </li>
                <li>
                    <a href="login.html"><i class="fa fa-upload"></i>Actualiza tus datos</a>
                </li>
                <li class="active">
                    <a href="admin.html"><i class="fa fa-upload"></i>Admin</a>
                </li>
            </ul>
        </aside>

        <div id="navbar-wrapper">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a href="#" class="navbar-brand" id="sidebar-toggle"><i class="fa fa-bars"></i></a>
                    </div>
                </div>
            </nav>
        </div>

        <section id="content-wrapper">
            <div id="upload-container">
                <h2>Subir archivo CSV</h2>
                <form id="upload-form" action="Resources/csv_process.php" method="post" enctype="multipart/form-data">
                    <input type="file" name="csv-file" accept=".csv">
                    <br>
                    <input type="submit" value="Subir CSV" class="btn btn-primary">
                </form>
            </div>
        </section>
        
    </div>
    <script src="Resources/scripts.js"></script>
</body>

</html>