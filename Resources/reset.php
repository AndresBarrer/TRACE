<?php
if(isset($_POST["reset-contra"])){
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
    $matricula = $_POST['matricula'];
    $correo = $_POST['correo'];

    // Consulta la base de datos para verificar las credenciales
    $sql = "SELECT * FROM alumni WHERE Matricula='$matricula' AND CorreoI='$correo'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        header("Location: cambiar_contra.php?matricula=$matricula&correo=$correo");
    } else {
        // Las credenciales son incorrectas, muestra un mensaje de error
        echo '<div class = "alert alert-danger">Las credenciales son incorrectas</div>';
        $conn->close();
        exit;
    }

    $conn->close();
}
?>