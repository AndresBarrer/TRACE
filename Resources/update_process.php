<?php
if(isset($_POST["update-alumni"])){
    // Verifica si se han enviado los datos desde el formulario
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Obtiene los valores de los campos del formulario
        $matricula = $_POST['matricula'];
        $empresa = $_POST['empresa'];
        $correoPersonal = $_POST['correoPersonal'];
        $puesto = $_POST['puesto'];
        $pais = $_POST['pais'];
        $ciudad = $_POST['ciudad'];

        // Realiza la actualización en la tabla alumni
        $host = "localhost";
        $username = "root";
        $password = "";
        $database = "trace";

        // Establece la conexión a la base de datos
        $conn = new mysqli($host, $username, $password, $database);

        // Verifica la conexión
        if ($conn->connect_error) {
            die("Error de conexión a la base de datos: " . $conn->connect_error);
        }

        // Actualiza los valores en la tabla alumni
        $sql = "UPDATE alumni SET Compania='$empresa', CorreoP='$correoPersonal', Puesto='$puesto', GeoLocationName='$ciudad', GeoCountryName='$pais' WHERE Matricula='$matricula'";

        if ($conn->query($sql) === false) {
            echo "Error al actualizar los datos: " . $conn->error;
            exit();
        } else {
            echo '<div class = "alert alert-success">Los datos se actualizaron correctamente</div>';
            exit();
        }
        // Cierra la conexión a la base de datos
        $conn->close();
    } else {
        echo '<div class="alert alert-danger">No se enviaron los datos</div>';
        exit(); // Asegúrate de salir después de la redirección
    }
}
?>
