<?php    
    echo "'proses':'HAPUS DOSEN',";
    $parameter = "";
    if(isset($od["id_dosen"]) and $od["id_dosen"]!="") {
        $nim = $od["id_dosen"];
        
        $parameter = "'" . $id_dosen . "'";
    }
    $sql = "call hapusDOSEN(" . $parameter . ");";
    
    include_once("conn.php");
    
    
    //Metode 1
    if($conn->query($sql) === TRUE) {
        //Jika penghapusan berhasil menampilkan notifikasi penghapusan berhasil
        echo "'status':'SUKSES','pesan':'Data terhapus.'";
    } else {
        //Penghapusan gagal
        echo '{"status":"ERROR", "pesan":"Error: ' . $sql . '<br>' . $conn->error . '"}';
    }

    $conn->close();
?>