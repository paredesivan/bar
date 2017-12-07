<?php

include("conexion.php");


$sql = "SELECT * FROM usuarios where username='" . $_POST['usuario'] . "' and password ='" . $_POST['password'] . "'";

$rs = mysqli_query($db, $sql);

if (!$rs) {
    printf("Error: %s\n", mysqli_error($db));
    exit();
}

$r = mysqli_fetch_array($rs);
if ($r) {
//    echo $r['username'];
    $_SESSION['usuario'] = $r['username'];
//    echo $_SESSION['usuario'];
    include("crearFactura.php");

} else {
    echo "no esta en la bd";
};



