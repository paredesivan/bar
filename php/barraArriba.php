<?php
include_once("busquedaCategorias.php");
//include_once("conexion.php");
?>

<ul id="navbar1" class="navbar">

    <?php
    while ($fila = mysqli_fetch_array($rs)) {

        echo "<li id='btn" . $fila['color'] . "' class='btn2 border-right'>";

        echo "<a href='#' onclick=ver('" . $fila['nombreCategoria'] . "') >";
        echo "<span class='title'>" . $fila['nombreCategoria'] . "</span >";

        echo "<div class='arrow' ></div >";
        echo "</a>";
        echo "</li >";
    } ?>
</ul>




