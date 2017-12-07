<?php

    date_default_timezone_set('America/Argentina/Buenos_Aires');
    setlocale(LC_TIME, "es_AR");


    function mostrarFecha($fecha)
    {
        return date_format(date_create($fecha), 'd/m/Y');
    }

    function mostrarFechaHora($fecha)
    {
        return date_format(date_create($fecha), 'd/m/Y H:m');
    }

    function mostrarHora($fecha)
    {
        return date_format(date_create($fecha), 'H:m');
    }

?>
