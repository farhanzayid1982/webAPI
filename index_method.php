<?php
    echo "{"; //awal pembentukan data JSON
    switch ($_SERVER['REQUEST_METHOD']) 
    { 
        case 'GET':
            echo "Request Methode GET";
            //include_once('dosen\tampil.php');
            break;
        case 'POST':
            echo "Request Methode POST";
            //include_once('dosen\sisip.php');
            break;
        case 'PUT':
            echo "Request Methode PUT";
            //include_once('dosen\ubah.php');
            break;
        case 'DELETE':
            echo "Request Methode DELETE";
            //include_once('dosen\hapus.php');
            break;
        default:
            echo "'status':'ERROR',";
            echo "'pesan':'Perintah tidak sesuai'";
    }

    echo "}"; //akhir pembentukan data JSON
?>