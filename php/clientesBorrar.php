<?php

include("conexion.php");

$sql = "DELETE FROM clientes WHERE idclientes ='" . $_GET["id"]."'";
$rs = mysqli_query($db, $sql);

header('Location: abmClientes.php');
