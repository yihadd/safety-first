<?php

$SERVER_name="localhost";
$username="root";
$password="";
$databaseName="safety_first";


require 'connection.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $user_id = $_POST["user_id"];
    $user_categories = $_POST["user_categories"];
    
    
    // Insert data into the database
    $sql = "INSERT INTO location (user_id, user_categories) 
    VALUES ('$user_id', '$user_categories')";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":user_id", $user_id);
    $stmt->bindParam(":user_categories", $user_categories);
    
    if ($stmt->execute()) {
        echo "Complaint submitted successfully.";
    } else {
        echo "Error submitting complaint.";
    }
}
?>