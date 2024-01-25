<?php

$SERVER_name="localhost";
$username="root";
$password="";
$databaseName="safety_first";


require 'connection.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $officer_id = $_POST["officer_id"];
    $officer_categories = $_POST["officer_categories"];
    
    
    // Insert data into the database
    $sql = "INSERT INTO location (officer_id, officer_categories) 
    VALUES ('$officer_id', '$officer_categories')";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":officer_id", $officer_id);
    $stmt->bindParam(":officer_categories", $officer_categories);
    
    if ($stmt->execute()) {
        echo "Complaint submitted successfully.";
    } else {
        echo "Error submitting complaint.";
    }
}
?>