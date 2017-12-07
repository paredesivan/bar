<?php

include("menuLateral.php");
//include("busquedaCategorias.php");

?>

<body>
<div class="login">
    <h1>Crear categoria</h1>
    <form method="POST" action="insertarCategoria.php">
        <input type="text" name="nombre" placeholder="nombre de la categoria" required="required"/>


        <select name='color'>";

            <option value='1'>VERDE</option>";
            <option value='2'>ROJO</option>";
            <option value='3'>GRIS</option>";
            <option value='4'>ROSA</option>";
            <option value='5'>AZUL</option>";

        </select>
        <button type="submit" class="btn btn-primary btn-block btn-large">Crear</button>
        <button onclick="history.go(-1)" class="btn btn-large btn-danger">volver</button>
    </form>
</div>
</body>
