<?php
include("conexion.php");


$sql = "INSERT INTO clientes (nombre,apellido, email, telefono, direccion, usuarios_username) 
VALUES ('" . $_POST["nombre"] . "','" . $_POST["apellido"] . "','" . $_POST["email"] . "','" . $_POST["telefono"] . "','" . $_POST["direccion"] . "','" . $_SESSION['usuario'] . "')";

$rs = mysqli_query($db, $sql);

if (!$rs) {
    printf("Error: %s\n", mysqli_error($db));
    echo "la consulta fue: " . $sql;
    exit();
} else {
    header('Location: crearCliente.php');
}







