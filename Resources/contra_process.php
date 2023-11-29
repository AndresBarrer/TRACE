<?php
if(isset($_POST["cambiar-contra"])){
    // Verifica si se han enviado los datos desde el formulario
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Obtiene los valores de los campos del formulario
        $matricula = $_POST['matricula'];
        $contraseña = $_POST['password'];
        $correo = $_POST['correo'];
        $confirm_password = $_POST['confirm_password'];

        if ($contraseña != $confirm_password) {
            // Las contraseñas no coinciden, muestra un mensaje de error y redirige al usuario a la página de cambio de contraseña.
            echo '<div class = "alert alert-danger">Las contraseñas no coinciden</div>';  
            exit;
        } 

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
        $sql = "UPDATE cuentas SET Contrasena='$contraseña', Primer_acceso='1' WHERE Usuario='$correo' AND Tipo_Cuenta='0'";

        if ($conn->query($sql) === false) {
            echo "Error al actualizar los datos: " . $conn->error;
        } else {
            header("Location: update.php?matricula=$matricula");
        }
        // Cierra la conexión a la base de datos
        $conn->close();
    } else {
        echo "No se han enviado datos.";
    }
}
?>
