<?php
include("conexion.php");

$sql = "INSERT INTO categorias (nombreCategoria,color,usuarios_username) 
VALUES ('" . $_POST["nombre"] . "',' " . $_POST["color"] . "','" . $_SESSION['usuario'] . "')";

$rs = mysqli_query($db, $sql);

if (!$rs) {
    printf("Error: %s\n", mysqli_error($db));
    echo "la consulta fue: " . $sql;
    exit();
} else {
    header('Location: crearCategoria.php');
}
