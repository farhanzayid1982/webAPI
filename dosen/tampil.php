<?php
    echo "'proses':'TAMPIL DOSEN',";
    $filter = "";
    if(isset($od["filter"]) and $od["filter"]!="") {
        $key = $od["filter"];
        $filter = " WHERE nama like '%$key%'";
    }
    $sql = "call tampilDOSEN('" . $filter . "');";
    include_once("conn.php");
    
    $result = $conn->query($sql);
    if($result->num_rows >0) {
        echo "'data':[";
        $counter = 0;
        // Output data dari setiap baris
        while($row = $result->fetch_assoc()) {
            $counter++;
            if($counter>1) {echo ",";};
            echo "{'id_dosen': '" . $row["id_dosen"]. "', 'nama': '" . $row["nama"]. "', 'tanggal_lahir' : '" . $row["tempat_lahir"]. "', 'Tanggal_Lahir' : '" . $row["tanggal_lahir"]. "', 'jenis_kelamin : " . $row["jenis_kelamin"] . ", 'masuk' : '" . $row["masuk"] . "', 'keluar' : '" . $row["keluar"] . "'}";
        }
        echo "],";
        echo "'status':'SUKSES',";
        echo "'pesan':'" . $result->num_rows . "'";
    } else {
        echo "'status':'ERROR',";
        echo "'pesan':'Tidak Ada Data'";
    }
    $conn->close();
?>