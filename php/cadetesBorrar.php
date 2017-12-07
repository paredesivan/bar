<?php

include("conexion.php");

$sql = "DELETE FROM cadetes WHERE dni ='" . $_GET["dni"]."'";
$rs = mysqli_query($db, $sql);

header('Location: abmCadetes.php');