<?php
include("cabecera.php");
?>

<body class="fondo">

<div id="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <h1>Listado de Productos</h1>
        </div>
        <div class="col-md-2">
            <button type="button" class="btn btn-primary" onClick="crear()">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"> Agregar Producto
            </button>
        </div>


    </div>
    <br/><br/>

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <table class="table table-striped table-bordered table-hover" id="dataTables-addControls">
                <thead>
                <tr>
                    <th>Editar</th>
                    <th>Nombre</th>
                    <th>Categoria</th>
                    <th>Stock</th>
                    <th>Costo</th>
                    <th>Precio</th>
                    <th>Borrar</th>
                </tr>
                </thead>
                <tbody>
                <?php

                include("busquedaProductos.php");

//                $rs = mysqli_query($db, $sql);
                if ($rs) {
                    while ($r = mysqli_fetch_array($rs)) {
                        ?>
                        <tr>
                            <td>
                                <button type="button" class="btn btn-warning"
                                        onClick="editar('<?php echo $r["nombreProducto"] ?>')">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></button>
                            </td>
                            <td><?php echo $r["nombreProducto"]; ?></td>
                            <td><?php echo $r["nombreCategoria"]; ?></td>
                            <td><?php echo $r["stock"]; ?></td>
                            <td><?php echo "$" . $r["costo"]; ?></td>
                            <td><?php echo "$" .$r["precio"]; ?></td>
                            <td>
                                <button type="button" class="btn btn-danger"
                                        onClick="borrar('<?php echo $r["nombreProducto"] ?>')" >
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

    function borrar(nombre) {
        location.href = "productosBorrar.php?nombre=" + nombre;
    }

    function editar(nombre) {
        location.href = "productosEditar.php?nombre=" + nombre;
    }

    function crear() {
        location.href = "crearProducto.php";
    }

</script>

</body>

<!--</html>-->
