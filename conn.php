<?php
    $servername = "localhost";
    $usernamedb = "pl";
    $passworddb = "pl";
    $databasename = "dblokal";
    
    // Create connection
    $conn = new mysqli($servername, $usernamedb, $passworddb, $databasename);
    
    // Check connection
    if (mysqli_connect_error()) {
        die("Database connection failed: " . mysqli_connect_error()); 
    };
?>