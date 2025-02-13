<?php
    echo "{"; //awal pembentukan data JSON
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        //echo "Request Methode POST";
        $json_params = file_get_contents("php://input");

        $data = json_decode(file_get_contents('php://input'), true);
        //var_dump($data);
        //$perintah = $data["data"]["perintah"];
        //echo $perintah;
        if(isset($data["data"])) {
            $od = $data["data"]; //Object Data
            //echo $data["kunci"]; //Bisa dilakukan pemeriksaan kunci untuk keamanan lebih lanjut
            switch($od["perintah"]) {
                case 'sisipMHS':
                    include_once('mhs\sisip.php');
                    break;
                case 'ubahMHS':
                    include_once('mhs\ubah.php');
                    break;
                case 'hapusMHS';
                    include_once('mhs\hapus.php');
                    break;
                case 'tampilMHS':
                    include_once('mhs\tampil.php');
                    break;
                case 'sisipDOSEN':
                    include_once('dosen\sisip.php');
                    break;
                case 'ubahDOSEN':
                    include_once('dosen\ubah.php');
                    break;
                case 'hapusDOSEN';
                    include_once('dosen\hapus.php');
                    break;
                case 'tampilDOSEN':
                    include_once('dosen\tampil.php');
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