<?php
// Iniciar la sesión (asegúrate de hacerlo antes de cualquier salida)
session_start();

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
$usuario = $_POST['usuario'];
$contrasena = $_POST['contrasena'];

// Consulta la base de datos para verificar las credenciales
$sql = "SELECT * FROM cuentas_admin WHERE Usuario='$usuario' AND Contrasena='$contrasena'";
$result = $conn->query($sql);

if ($result->num_rows == 1) {
    // Las credenciales son válidas, establecer la variable de sesión
    $_SESSION['autenticado'] = true;

    // Redirigir al usuario a la página deseada (csv.html)
    header("Location: ../csv.php");
    exit(); // Asegúrate de salir después de la redirección
} else {
    // Las credenciales son incorrectas, muestra un mensaje de error
    echo "Credenciales incorrectas. Inténtalo de nuevo.";
    header("Location: ../admin.html");
    exit(); // Asegúrate de salir después de la redirección
}

$conn->close();
?>