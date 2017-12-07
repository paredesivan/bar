<?php
include("cabecera.php");
$datos = $_POST;

//print_r($_POST);
include("conexion.php");


?>

<body class="fondo">

<div id="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-1">
            <h1>Presupuesto</h1>
        </div>


    </div>
    <br/><br/>

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <table class="table table-striped table-bordered table-hover" id="dataTables-addControls">
                <thead>
                <tr>
                    <th>Nombre</th>
                    <th>precio</th>
                    <th>cantidad</th>
                    <th>Subtotal</th>
                    <th>Borrar</th>
                </tr>
                </thead>
                <tbody>
                <?php
                $total = 0;
                $cantidades = 0;
                foreach ($datos as $clave => $cantidad) {
                    if ($cantidad > 0) {
                        $nombre = str_replace("_", " ", $clave);
                        ?>
                        <tr>
                            <td><?php echo $nombre; ?></td>
                            <?php $sql = "SELECT precio FROM productos WHERE usuarios_username='" . $_SESSION['usuario'] . "' AND nombreProducto ='" . $nombre . "'";
                            $rs = mysqli_query($db, $sql);
                            $r = mysqli_fetch_array($rs);
                            ?>
                            <td><?php echo "$" . $r['precio'] ?></td>
                            <td><?php echo $cantidad ?></td>
                            <td><?php $subtotal = $cantidad * $r['precio'];

                                echo $subtotal ?></td>
                            <td>
                                <button type="button" class="btn btn-danger"
                                        onClick="borrar('<?php echo $nombre ?>')">
                                    Borrar
                                </button>
                            </td>
                        </tr>
                        <?php
                        $total += $subtotal;
                        $cantidades += $cantidad;
                    }
                }

                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="content-fluid">
    <div class="row">
        <div class="col-md-4">
            <label style="float:left; margin-left:130px">cantidades</label>
            <input class="subtotal" value="<?php echo $cantidades ?>">
        </div>
        <div class="col-md-4">
            <label style="float:left; ">total:$</label>
            <input class="subtotal" value="<?php echo $total ?>">
        </div>
        <div class="col-md-2">
            <button class="btn btn-primary btn-large" type="submit">confirmar</button>
        </div>
        <div class="col-md-2">
            <button onclick="history.go(-1)" class="btn btn-large btn-danger">volver</button>
            <a href="crearFactura.php" style="background: red" class="btn btn-large btn-danger">cancelar</a>
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
        location.href = "productosPresupuestoBorrar.php?nombre=" + nombre;
    }

</script>

</body>


