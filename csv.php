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
                    <a href="login.php"><i class="fa fa-upload"></i>Actualiza tus datos</a>
                </li>
                <li class="active">
                    <a href="admin.php"><i class="fa fa-upload"></i>Admin</a>
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
            <h2>Subir archivo CSV</h2>   
            <h4>Para subir un archivo en formato csv es necesario que el mismo cumpla con un formato especifico el cual debe de seguir lo siguiente:</h4> 
            <h4>Matricula, Nombre, ApellidoP, ApellidoM, CorreoI, FechaIng, FechaEgreso</h4>
            <div id="upload-container" class="form-group inputDnD col-sm-6 offset-sm-3">
                <form id="upload-form" method="post" enctype="multipart/form-data">
                    <input type="file" class="form-control-file text-success font-weight-bold" name="csv-file" accept=".csv"
                        data-title="Arrastra un archivo aqui o da clic" id="inputFile">
                    <br>
                    <input type="submit" value="Subir CSV" class="form-control-button" name="upload-csv">
                    <?php
                        include("Resources/csv_process.php");
                    ?>
                </form>
            </div>
        </section>
        
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Selecciona el elemento inputFile
            var inputFile = document.getElementById("inputFile");

            // Agrega un evento change al inputFile
            inputFile.addEventListener("change", function() {
                // Actualiza el valor del atributo data-title con el nombre del archivo seleccionado
                inputFile.setAttribute("data-title", "Archivo seleccionado: " + this.files[0].name);
            });
        });
    </script>
    <script src="Resources/scripts.js"></script>
</body>

</html>