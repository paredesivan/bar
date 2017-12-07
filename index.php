<?php

include("php/cabecera.php");

?>

<body>
<div class="login">
    <h1>Iniciar Sesion</h1>
    <form method="POST" action="php/login.php">
        <input type="text" name="usuario" placeholder="Usuario" required="required"/>
        <input type="password" name="password" placeholder="Password" required="required"/>
        <button type="submit" class="btn btn-primary btn-block btn-large">Entrar</button>
    </form>
</div>
</body>

