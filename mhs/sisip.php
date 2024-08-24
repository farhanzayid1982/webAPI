<?php
    echo "'proses':'SISIP',";
    $parameter = "";
    if(isset($od["nim"]) and $od["nim"]!="") {
        $nim = $od["nim"];
        $nama = $od["nama"];
        $tanggal_lahir = $od["tanggal_lahir"];
        $tempat_lahir = $od["tempat_lahir"];
        $jenis_kelamin =  $od["jenis_kelamin"];
        $masuk = $od["masuk"];
        $keluar = $od["keluar"];
        $parameter = "'" . $nim . "', '" . $nama . "', '" . $tempat_lahir . "', '" . $tanggal_lahir . "', '" . $jenis_kelamin . "', '" . $masuk . "', '" . $keluar . "'";
    }
    $sql = "call insertMHS(" . $parameter . ");";
    
    include_once("conn.php");
    
    if($conn->query($sql) === TRUE) {
        //Jika penyimpanan berhasil menampilkan notifikasi penyimpanan berhasil
        echo "'status':'SUKSES','pesan':'Data tersimpan.'";
    } else {
        //Penyimpanan gagal
        echo '{"status":"ERROR", "pesan":"Error: ' . $sql . '<br>' . $conn->error . '"}';
    }
    $conn->close();
?>