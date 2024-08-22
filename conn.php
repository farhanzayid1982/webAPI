<?php
    $servername = "localhost";
    $username = "pl";
    $password = "pl";
    $databasename = "dblokal";
    
    // Create connection
    $conn = new mysqli($servername, $username, $password, $databasename);
    
    // Check connection
    if (mysqli_connect_error()) {
        die("Database connection failed: " . mysqli_connect_error()); 
    };
?>