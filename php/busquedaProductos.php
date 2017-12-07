
<?php

include("conexion.php");

$sql = "SELECT * FROM productos where usuarios_username='" . $_SESSION['usuario'] . "'";
$rs = mysqli_query($db, $sql);



