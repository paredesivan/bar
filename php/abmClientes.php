<?php
include_once("cabecera.php");
?>

<body class="fondo">
<?php include("menuLateral.php"); ?>
<div id="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <h1>Listado de Clientes</h1>
        </div>
        <div class="col-md-2">
            <button type="button" class="btn btn-primary" onClick="crear()"><span class="glyphicon glyphicon-plus"
                                                                                  aria-hidden="true"> Agregar Cliente
            </button>
        </div>


    </div>
    <br/><br/>

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <table class="table table-striped table-bordered table-hover" id="dataTables-addControls">
                <thead>
                <tr><th>Editar</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>eMail</th>
                    <th>Borrar</th>
                </tr>
                </thead>
                <tbody>
                <?php

                include("busquedaClientes.php");

                $rs = mysqli_query($db, $sql);
                if ($rs) {
                    while ($r = mysqli_fetch_array($rs)) {
                        ?>
                        <tr>
                            <td>
                                <button type="button" class="btn btn-warning" onClick="editar(<?php echo $r["idclientes"] ?>)">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></button>
                            </td>
                            <td><?php echo $r["nombre"]; ?></td>
                            <td><?php echo $r["apellido"]; ?></td>
                            <td><?php echo $r["direccion"]; ?></td>
                            <td><?php echo $r["telefono"]; ?></td>
                            <td><?php echo $r["email"]; ?></td>
                            <td>
                                <button type="button" class="btn btn-danger" onClick="borrar(<?php echo $r["idclientes"] ?>)">
                                    Borrar
                                </button>
                            </td>
                        </tr>
                        <?php
                    }
                }
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>


<script src="/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<script>
    $(document).ready(function () {
        $('#dataTables-addControls').dataTable();
    });

    function borrar(id) {
        location.href = "clientesBorrar.php?id=" + id;
    }

    function editar(id) {
        location.href = "clientesEditar.php?id=" + id;
    }

    function crear() {
        location.href = "crearCliente.php";
    }

</script>

</body>

</html>
