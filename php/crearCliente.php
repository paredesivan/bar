<?php

include("menuLateral.php");

?>

<body>
<div class="login">
    <h1>Crear Cliente</h1>
    <form method="POST" action="insertarCliente.php">
        <input type="text" name="nombre" placeholder="nombre" />
        <input type="text" name="apellido" placeholder="apellido" required="required"/>
        <input type="text" name="direccion" placeholder="direccion" required="required"/>
        <input type="text" name="telefono" placeholder="telefono" required="required"/>
        <input type="email" name="email" placeholder="mail" />

        <button type="submit" class="btn btn-primary btn-block btn-large">Crear</button>
    </form>
    <button onclick="history.go(-1)" class="btn btn-large btn-danger">volver</button>
</div>

</body>
