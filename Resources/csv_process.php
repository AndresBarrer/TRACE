<?php
if(isset($_POST["upload-csv"])){
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
                    $expectedHeaders = array("Matricula", "Nombre", "ApellidoP", "ApellidoM", "CorreoI", "FechaIng", "FechaEgreso");
                
                    // Elimina espacios en blanco alrededor de los valores
                    $data = array_map('trim', $data);
                
                    if ($data === $expectedHeaders) {
                        $firstRow = false; // Ignora la primera fila (encabezados)
                        continue;
                    } else {
                        echo '<div class="alert alert-danger">Headers Incorrectos</div>';
                        $conn->close();
                        exit;
                    }
                }
                

                // Utiliza sentencias preparadas para evitar inyecciones SQL
                $sql = "INSERT INTO alumni (Matricula, Nombre, ApellidoP, ApellidoM, CorreoI, FechaIng, FechaEgreso) 
                        VALUES (?, ?, ?, ?, ?, ?, ?)";
                
                $stmt = $conn->prepare($sql);
                
                // Vincula los parámetros
                $stmt->bind_param("issssss", $data[0], $data[1], $data[2], $data[3], $data[4], $data[5], $data[6]);

                // Ejecuta la sentencia
                if ($stmt->execute() === false) {
                    echo '<div class = "alert alert-danger">Error al actualizar la base de datos</div>';
                }

                // Cierra la sentencia
                $stmt->close();
            }

            fclose($file);

            // Cierra la conexión a la base de datos
            $conn->close();

            // Redirige o muestra un mensaje de éxito
            echo '<div class = "alert alert-success">Archivo subido correctamente</div>';
        } else {
            echo '<div class = "alert alert-danger">Error al subir el archivo</div>';
        }
    }
}
?>