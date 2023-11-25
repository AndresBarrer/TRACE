<?php
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

// Establece el conjunto de caracteres
$conn->set_charset("utf8mb4");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $csvFile = $_FILES['csv-file']['tmp_name'];

    if (is_uploaded_file($csvFile)) {
        // Procesa el archivo CSV y actualiza la tabla "alumni" en la base de datos
        $file = fopen($csvFile, "r");
        $firstRow = true; // Variable para rastrear si estamos en la primera fila (encabezados)

        while (($data = fgetcsv($file)) !== false) {
            if ($firstRow) {
                $firstRow = false; // Ignora la primera fila (encabezados)
                continue;
            }

            // Utiliza sentencias preparadas para evitar inyecciones SQL
            $sql = "INSERT INTO alumni (Matricula, Nombre, ApellidoP, ApellidoM, CorreoI, CorreoP, FechaIng, FechaEgreso, Compania, Puesto, GeoLocationName, GeoCountryName) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            $stmt = $conn->prepare($sql);
            
            // Vincula los parámetros
            $stmt->bind_param("isssssssssss", $data[0], $data[1], $data[2], $data[3], $data[4], $data[5], $data[6], $data[7], $data[8], $data[9], $data[10], $data[11]);

            // Ejecuta la sentencia
            if ($stmt->execute() === false) {
                echo "Error al actualizar la base de datos: " . $stmt->error;
            }

            // Cierra la sentencia
            $stmt->close();
        }

        fclose($file);

        // Cierra la conexión a la base de datos
        $conn->close();

        // Redirige o muestra un mensaje de éxito
        echo "Actualización exitosa.";
    } else {
        echo "Error al cargar el archivo.";
        header("Location: ../admin.html");
        exit(); // Asegúrate de salir después de la redirección
    }
}
?>
<div style="text-align: center; margin-top: 20px;">
    <button onclick="window.location.href = '../index.html';">Volver al inicio</button>
</div>