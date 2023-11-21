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

            $matricula = $data[0]; 
            $nombre = $data[1];
            $apellidoP = $data[2];
            $apellidoM = $data[3];
            $correoI = $data[4];
            $correoP = $data[5];
            $fechaIng = $data[6];
            $fechaEgreso = $data[7];
            $compania = $data[8];
            $puesto = $data[9];
            $geoLocationName = $data[10];
            $geoCountryName = $data[11];

            // Realiza la inserción en la tabla "alumni"
            $sql = "INSERT INTO alumni (Matricula, Nombre, ApellidoP, ApellidoM, CorreoI, CorreoP, FechaIng, FechaEgreso, Compania, Puesto, GeoLocationName, GeoCountryName) 
            VALUES ('$matricula', '$nombre', '$apellidoP', '$apellidoM', '$correoI', '$correoP', '$fechaIng', '$fechaEgreso', '$compania', '$puesto', '$geoLocationName', '$geoCountryName')";

            if ($conn->query($sql) === false) {
                echo "Error al actualizar la base de datos: " . $conn->error;
            }
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