<?php
include_once("conexion.php");

$sql = "select nombreCategoria,color from categorias where usuarios_username='" . $_SESSION['usuario'] . "'";
$rs = mysqli_query($db, $sql);