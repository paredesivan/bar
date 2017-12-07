<?php

include("conexion.php");

$sql = "SELECT * FROM cadetes where usuarios_username='" . $_SESSION['usuario'] . "'";