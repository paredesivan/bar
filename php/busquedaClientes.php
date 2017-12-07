<?php

include("conexion.php");

$sql = "SELECT * FROM clientes where usuarios_username='" . $_SESSION['usuario'] . "'";