<?php
    //credential di bawah di buat hardcode (Seharusnya menggunakan database)
    $api_credentials = array(
        'userAPI' => 'passAPI',
        'user2' => 'userLain'
    );

    if (!isset($_SERVER['PHP_AUTH_USER'])) {
        header('WWW-Authenticate: Basic realm="EAI API"');
        header('HTTP/1.1 401 Unauthorized');
        exit;
    } else {
        $username = $_SERVER['PHP_AUTH_USER'];
        $password = $_SERVER['PHP_AUTH_PW'];
        include('ceklogin.php');
        echo $username;
        if (!array_key_exists($username, $api_credentials)) {
            header('HTTP/1.1 403 Forbidden');
            exit;
        }
        if ($password != $api_credentials[$username]) {
            header('HTTP/1.1 403 Forbidden');
            exit;
        }
    }



    echo "{"; //awal pembentukan data JSON
    switch ($_SERVER['REQUEST_METHOD']) 
    { 
        case 'GET':
            //echo "Request Methode GET";
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