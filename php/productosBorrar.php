<?php

include("conexion.php");

$sql = "DELETE FROM productos WHERE nombreProducto ='" . $_GET["nombre"]."'";
$rs = mysqli_query($db, $sql);

header('Location: abmProductos.php');
