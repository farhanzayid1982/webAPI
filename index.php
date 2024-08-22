<?php
    echo "{"; //awal pembentukan data JSON
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        //echo "Request Methode POST";
        $json_params = file_get_contents("php://input");

        $data = json_decode(file_get_contents('php://input'), true);
        //var_dump($data);
        $perintah = $data["data"]["perintah"];
        //echo $perintah;
        if(isset($data["data"])) {
            $od = $data["data"]; //Object Data
            //echo $data["kunci"]; //Bisa dilakukan pemeriksaan kunci untuk keamanan lebih lanjut
            switch($od["perintah"]) {
                case 'sisip':
                    include_once('mhs\sisip.php');
                    break;
                case 'ubah':
                    include_once('mhs\ubah.php');
                    break;
                case 'hapus';
                    include_once('mhs\hapus.php');
                    break;
                case 'tampil':
                    include_once('mhs\tampil.php');
                    break;
                default:
                    echo "'status':'ERROR',";
                    echo "'pesan':'Perintah tidak sesuai'";
            };
        } else {
            //echo "NOT Set";
            echo "'status':'ERROR',";
            echo "'pesan':'Tidak ada data yang dikirimkan'";
        }
    } else {
        echo "'status':'ERROR',";
        echo "'pesan':'Request Methode Not Valid'";
    }

    echo "}"; //akhir pembentukan data JSON
?>