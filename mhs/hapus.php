<?php    
    echo "'proses':'HAPUS MAHASISWA',";
    $parameter = "";
    if(isset($od["nim"]) and $od["nim"]!="") {
        $nim = $od["nim"];
        
        $parameter = "'" . $nim . "'";
    }
    $sql = "call hapusMHS(" . $parameter . ");";
    
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