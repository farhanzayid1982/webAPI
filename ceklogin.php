<?php
    //echo "'proses':'CEK LOGIN',";

    $sql = "call cekLOGIN('" . $username . "', '" . $password . "');";
    include_once("conn.php");
    
    $result = $conn->query($sql);
    if($result->num_rows >0) {
        //echo "'data':[";
        //$counter = 0;
        // Output data dari setiap baris
        while($row = $result->fetch_assoc()) {
            //$counter++;
            $id_person = $row["id_person"];
            //if($counter>1) {echo ",";};
            //echo "{'username': '" . $row["username"]. "', 'id_person': '" . $row["id_person"]. "'}";
        }
        //echo "],";
        //echo "'status':'SUKSES',";
        //echo "'pesan':'" . $result->num_rows . "'";
    } else {
        header('HTTP/1.1 403 Forbidden');
        echo "'status':'ERROR',";
        echo "'pesan':'Tidak Ada Data'";
        exit;
    }
    $conn->close();
?>