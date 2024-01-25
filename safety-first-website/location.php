<?php

$SERVER_name="localhost";
$username="root";
$password="";
$databaseName="safety_first";


require 'connection.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $location_id = $_POST["location_id"];
    $location_name = $_POST["location_name"];
    
    
    // Insert data into the database
    $sql = "INSERT INTO location (location_id, location_name) 
    VALUES ('$location_id', '$location_name')";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":location_id", $location_id);
    $stmt->bindParam(":location_name", $location_name);
    
    if ($stmt->execute()) {
        echo "Complaint submitted successfully.";
    } else {
        echo "Error submitting complaint.";
    }
}
?>