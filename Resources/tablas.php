<?php
$host = "localhost";
$username = "root";
$password = "";
$database = "trace";

$mysqli = new mysqli($host, $username, $password, $database);

if ($mysqli->connect_error) {
    die("Error de conexión a la base de datos: " . $mysqli->connect_error);
}

$query = "SELECT * FROM alumni"; 

$result = $mysqli->query($query);

$data = array();
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);

$mysqli->close();
?>