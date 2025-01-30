<?php
    echo "{"; //awal pembentukan data JSON
    switch ($_SERVER['REQUEST_METHOD']) 
    { 
        case 'GET':
            echo "Request Methode GET";
            break;
        case 'POST':
            echo "Request Methode POST";
            break;
        case 'PUT':
            echo "Request Methode PUT";
            break;
        case 'DELETE':
            echo "Request Methode DELETE";
            break;
    }

    echo "}"; //akhir pembentukan data JSON
?>