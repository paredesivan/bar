<?php

include("menuLateral.php");

?>

<body>
<div class="login">
    <h1>Crear Cadete</h1>
    <form method="POST" action="insertarCadete.php">
        <input type="text" name="nombre" placeholder="nombre" required="required"/>
        <input type="number" name="dni" placeholder="dni" required="required"/>
        <input type="text" name="apellido" placeholder="apellido" required="required"/>
        <input type="text" name="direccion" placeholder="direccion" required="required"/>
        <input type="number" name="telefono" placeholder="telefono"/>
        <input type="email" name="email" placeholder="mail"/>

        <button type="submit" class="btn btn-primary btn-block btn-large">Crear</button>
        <button onclick="history.go(-1)" class="btn btn-large btn-danger">volver</button>
    </form>
</div>
</body>
