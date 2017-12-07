<?php
include("conexion.php");
/*
$sql = "SELECT MAX(nroPedido) FROM pedidos WHERE usuarios_username ='" . $_SESSION['usuario'] . "')";
$rs = mysqli_query($db, $sql);
$r = mysqli_fetch_array($rs);
if (!$rs) {
    $r['nroPedido'] = 0;
}
$numeroPedido = $r['nroPedido'];
$numeroPedido++;
*/
///////////////////////////////////////////////////////////////////////////////////////

$sql = "INSERT INTO pedidos (idCliente,usuarios_username)
VALUES ('" . $_POST["idCliente"] . "','" . $_SESSION['usuario'] . "')";

$rs = mysqli_query($db, $sql);
$numeroPedido = mysqli_insert_id($db);
//////////////////////////////////////////////////////////////////////////////////////
//insercion pedidos_productos
$sql = "INSERT INTO pedidos_productos (nroPedido,nombreProducto,cantidad,username)
VALUES ('" . $numeroPedido . "','" . $_POST["nombreProducto"] . "','" . $_POST["cantidad"] . "','" . $_SESSION['usuario'] . "')";

$rs = mysqli_query($db, $sql);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////
$sql = "SELECT stock FROM productos WHERE nombreProducto ='" . $_POST['nombreProducto'] . "' AND usuarios_username ='" . $_SESSION['usuario'] . "')";
$rs = mysqli_query($db¶, $sql);
$r = mysqli_fetch_array($rs);
$sto = $r['stock'] - $_POST['cantidad'];

$sql = "UPDATE productos SET stock='" . $sto . "' WHERE nombreProducto='" . $_post['nombreProducto'] . "' AND usuarios_username ='" . $_SESSION['usuario'] . "')";
$rs = mysqli_query($db¶, $sql);