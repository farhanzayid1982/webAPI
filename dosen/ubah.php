<?php
    echo "'proses':'UBAH DOSEN',";
    $parameter = "";
    if(isset($od["id_dosen"]) and $od["id_dosen"]!="") {
        $oldid_dosen = $od["oldid_dosen"];
        $id_dosen = $od["id_dosen"];
        $nama = $od["nama"];
        $tanggal_lahir = $od["tanggal_lahir"];
        $tempat_lahir = $od["tempat_lahir"];
        $jenis_kelamin =  $od["jenis_kelamin"];
        $masuk = $od["masuk"];
        $keluar = $od["keluar"];
        $parameter = "'" . $oldid_dosen . "', '". $id_dosen . "', '" . $nama . "', '" . $tempat_lahir . "', '" . $tanggal_lahir . "', '" . $jenis_kelamin . "', '" . $masuk . "', '" . $keluar . "'";
    }
    $sql = "call updateDOSEN(" . $parameter . ");";
    
    include_once("conn.php");
    
    /*
    //Metode 1
    if($conn->query($sql) === TRUE) {
        //Jika penyimpanan berhasil menampilkan notifikasi penyimpanan berhasil
        echo "'status':'SUKSES','pesan':'Data tersimpan.'";
    } else {
        //Penyimpanan gagal
        echo '{"status":"ERROR", "pesan":"Error: ' . $sql . '<br>' . $conn->error . '"}';
    }
    */
    
    //Metode 2
    $result = $conn->query($sql);
    if($result->num_rows >0) {
        echo "'data':[";
        $counter = 0;
        // Output data dari setiap baris
        while($row = $result->fetch_assoc()) {
            //$counter++;
            //if($counter>1) {echo ",";};
            $status = $row["rstatus"];
            $pesen = $row["rpesan"];
        }
        echo "],";
        echo "'status':'$status',";
        echo "'pesan':'" . $result->num_rows . "'";
    } else {
        echo "'status':'ERROR',";
        echo "'pesan':'Tidak Ada Data'";
    }

    //Tutup koneksi
    $conn->close();
?>