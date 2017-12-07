<?php
include("conexion.php");

$selectOption = $_POST['productoElegido'];

$sql = "INSERT INTO productos (nombreProducto, stock, costo, precio, nombreCategoria, usuarios_username)
VALUES ('" . $_POST["nombre"] . "','" . $_POST["stock"] . "','" . $_POST['costo'] . "','" . $_POST["precio"] . "','" . $_POST["productoElegido"] . "','" . $_SESSION['usuario'] . "')";

$rs = mysqli_query($db, $sql);

if (!$rs) {
    printf("Error: %s\n", mysqli_error($db));
    echo "la consulta fue: " . $sql;
    exit();
} else {
    header('Location: abmProductos.php');
}







