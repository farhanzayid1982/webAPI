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
    $sql = "call sisipMHS(" . $parameter . ");";
    
    include_once("conn.php");
    
    
    //Metode 1
    if($conn->query($sql) === TRUE) {
        //Jika penyimpanan berhasil menampilkan notifikasi penyimpanan berhasil
        echo "'status':'SUKSES','pesan':'Data tersimpan.'";
    } else {
        //Penyimpanan gagal
        echo '{"status":"ERROR", "pesan":"Error: ' . $sql . '<br>' . $conn->error . '"}';
    }

    /*
    //Metode 2
    $result = $conn->query($sql);
    if($result->num_rows >0) {
        echo "'data':[";
        $counter = 0;
        // Output data dari setiap baris
        while($row = $result->fetch_assoc()) {
            $counter++;
            if($counter>1) {echo ",";};
            $status = $row["status"];
            $pesen = $row["pesan"];
        }
        echo "],";
        echo "'status':'$status',";
        echo "'pesan':'" . $result->num_rows . "'";
    } else {
        echo "'status':'ERROR',";
        echo "'pesan':'Tidak Ada Data'";
    }
    */
    //Tutup koneksi
    $conn->close();
?>