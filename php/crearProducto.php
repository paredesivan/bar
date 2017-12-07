<?php

include("menuLateral.php");

?>

<body>
<div class="login">
    <h1>Crear Producto</h1>

    <form method="POST" action="insertarProducto.php">
        <input type="text" name="nombre" placeholder="nombre" required="required"/>
        <input type="text" name="stock" placeholder="stock" required="required"/>
        <input type="text" name="costo" placeholder="costo" required="required"/>
        <input type="text" name="precio" placeholder="precio" required="required"/>

        <?php

        include("conexion.php");
        include("busquedaCategorias.php");

        echo "<select name='productoElegido'>";
        while ($fila = mysqli_fetch_array($rs)) {
            echo "<option value='" . $fila['nombreCategoria'] . "'>" . $fila['nombreCategoria'] . "</option>";
        }
        echo "</select>";

        ?>
        <button type="submit" class="btn btn-primary btn-block btn-large">Crear</button>
    </form>
    <button onclick="history.go(-1)" class="btn btn-large btn-danger">volver</button>
</div>


</body>
