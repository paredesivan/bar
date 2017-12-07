<?php
include_once("barraArriba.php");
include_once("conexion.php");
//include_once("menuLateral.php");

//if (!$rs) {
//    printf("Error: %s\n", mysqli_error($db));
//    exit();
//}
?>
<body>


<form method="post" action="presupuesto.php">


    <?php include("menuLateral.php");


    $sql = "SELECT nombreCategoria, color FROM categorias";
    $rsCat = mysqli_query($db, $sql);

    $cat1 = "";
    while ($rC = mysqli_fetch_array($rsCat)) {
        $sql = "SELECT nombreProducto,precio FROM productos WHERE nombreCategoria='" . $rC['nombreCategoria'] . "' AND usuarios_username ='" . $_SESSION['usuario'] . "'";
        $rs = mysqli_query($db, $sql);
        if ($cat1 == "") {
            $cat1 = $rC['nombreCategoria'];
        }
        ?>

        <div class="bloque" id="<?php echo $rC['nombreCategoria']; ?>" style="visibility: hidden; display: none;">

            <div class="column">

                <?php
                $i = 0;
                while ($r = mysqli_fetch_array($rs)) {
                    $i++;
                    ?>
                    <div id="fila" style="height: 45px;">
                        <label id="nombre" class="fila" style="float:left;"><?php echo $r['nombreProducto']; ?></label>
                        <input class="cant" type="number" style="float:right;"
                               name="<?php echo $r['nombreProducto']; ?>">
                        <label id="precio" style="float:right;" class="fila"><?php echo "$" . $r['precio']; ?></label>
                        <!--                <button id="subir" class="botonMasYmenos"> +</button>-->

                    </div>
                    <div style="clear: both"></div>
                    <br>
                    <?php
                }

                if (($i % 2) != 0) {
                    ?>
                    <div id="fila" style="height: 45px;">
                        <label id="nombre" style="float:left; visibility: hidden; display: block;">&nbsp;</label>
                        <input class="cant" type="number" style="float:right;visibility: hidden; display: block;">
                        <label id="precio" style="float:right;visibility: hidden; display: block;">&nbsp;</label>
                        <!--                <button id="subir" class="botonMasYmenos"> +</button>-->

                    </div>
                    <div style="clear: both"></div>
                    <br>
                    <?php
                }

                ?>

            </div>

        </div>


        <?php
    }
    ?>

    <input type="submit" value="Confirmar">

</form>


</body>


<script>
    function ver(cat) {
        <?php

        $sql = "SELECT nombreCategoria, color FROM categorias";
        $rsCat = mysqli_query($db, $sql);
        while ($rC = mysqli_fetch_array($rsCat)) { ?>
        document.getElementById('<?php echo $rC['nombreCategoria']; ?>').style.visibility = "hidden";
        document.getElementById('<?php echo $rC['nombreCategoria']; ?>').style.display = "none";
        <?php } ?>

        document.getElementById(cat).style.visibility = "visible";
        document.getElementById(cat).style.display = "block";
    }

    ver('<?php echo $cat1; ?>');
</script>

<footer>


</footer>


