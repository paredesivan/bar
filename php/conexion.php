<?php
session_start();
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'flashbd');

$db = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);

if (!$db) {
    echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
    echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
    echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
    exit;
} else {
//         echo "Conexion OK a: " . DB_NAME;
}

