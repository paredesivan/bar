
<?php

include("conexion.php");

$sql = "SELECT precio FROM productos where usuarios_username='" . $_SESSION['usuario'] . "' and nombre";
$rs = mysqli_query($db, $sql);

