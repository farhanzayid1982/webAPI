<?php
    echo "{"; //awal pembentukan data JSON
    switch ($_SERVER['REQUEST_METHOD']) 
    { 
        case 'GET':
            echo "Request Methode GET";
            if(isset($_GET['pfilter'])) {
                $filter=$_GET['pfilter'];
            } else {
                $filter="";
            }
            include_once('dosen\tampil.php');
            break;
        case 'POST':
            echo "Request Methode POST";
            $json_params = file_get_contents("php://input");
            $data = json_decode(file_get_contents('php://input'), true);
            $od = $data["data"]; //Object Data
            include_once('dosen\sisip.php');
            break;
        case 'PUT':
            echo "Request Methode PUT";
            $json_params = file_get_contents("php://input");
            $data = json_decode(file_get_contents('php://input'), true);
            $od = $data["data"]; //Object Data
            include_once('dosen\ubah.php');
            break;
        case 'DELETE':
            echo "Request Methode DELETE";
            if(isset($_GET['pid'])) {
                $pid=$_GET['pid'];
            } else {
                $pid="";
            }
            include_once('dosen\hapus.php');
            break;
        default:
            echo "'status':'ERROR',";
            echo "'pesan':'Perintah tidak sesuai'";
    }

    echo "}"; //akhir pembentukan data JSON
?>