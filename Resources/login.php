<?php
if(isset($_POST["login-process"])){
    // Establece la conexión a la base de datos
    $host = "localhost";
    $username = "root";
    $password = "";
    $database = "trace";
    $conn = new mysqli($host, $username, $password, $database);

    if ($conn->connect_error) {
        die("Error de conexión a la base de datos: " . $conn->connect_error);
    }

    // Obtiene las credenciales del formulario
    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena'];

    // Consulta la base de datos para verificar las credenciales
    $sql = "SELECT * FROM cuentas WHERE Usuario='$correo' AND Contrasena='$contrasena' AND Tipo_Cuenta='0'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        // Las credenciales son válidas, obtén la matrícula del alumno
        $row = $result->fetch_assoc();
        $correo = $row['Usuario'];

        // Consulta la tabla alumni para obtener la matrícula
        $sql_alumni = "SELECT Matricula FROM alumni WHERE CorreoI='$correo'";
        $result_alumni = $conn->query($sql_alumni);

        if ($result_alumni->num_rows == 1) {
            $row_alumni = $result_alumni->fetch_assoc();
            $matricula = $row_alumni['Matricula'];
        } else {
            // No se encontró la matrícula en la tabla alumni
            echo '<div class = "alert alert-danger">No hay un alumno registrado con esa matricula</div>';
            exit;
        }

        // Consulta la tabla cuenta para obtener el primer acceso
        $sql_acceso = "SELECT Primer_acceso FROM cuentas WHERE Usuario='$correo'";
        $result_acceso = $conn->query($sql_acceso);

        if ($result_acceso->num_rows == 1) {
            $row_acceso = $result_acceso->fetch_assoc();
            $acceso = $row_acceso['Primer_acceso'];
            if ($acceso == 0) {
                // El Primer_acceso es igual a 0, redirige al usuario a cambiar_contra.php
                header("Location: cambiar_contra.php?matricula=$matricula&correo=$correo");
            } else {
                // El Primer_acceso no es igual a 0, puedes redirigir a otra página o mostrar un mensaje de error.
                // Por ejemplo:
                echo "Tu primer acceso no es igual a 0, no puedes acceder a cambiar_contra.php.";
                // Redirige al usuario a la página de actualización con la matrícula en la URL
                header("Location: update.php?matricula=$matricula");
            }
        }

        
    } else {
        // Las credenciales son incorrectas, muestra un mensaje de error
        echo '<div class = "alert alert-danger">Credenciales Incorrrectas</div>';    
    }

    $conn->close();
}
?>