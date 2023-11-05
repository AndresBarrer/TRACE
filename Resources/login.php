<?php
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
$sql = "SELECT * FROM cuentas WHERE Usuario='$correo' AND Contrasena='$contrasena'";
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
        echo "No se pudo encontrar la matrícula del alumno.";
        exit;
    }
    // Redirige al usuario a la página de actualización con la matrícula en la URL
    header("Location: ../update.php?matricula=$matricula");
} else {
    // Las credenciales son incorrectas, muestra un mensaje de error
    echo "Credenciales incorrectas. Inténtalo de nuevo.";
    header("Location: ../login.html");
}

$conn->close();
?>