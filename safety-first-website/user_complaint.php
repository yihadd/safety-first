<?php

$SERVER_name="localhost";
$username="root";
$password="";
$databaseName="safety_first";


require 'connection.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") 
{
    $number_id = $_POST["number_id"];
    $new_location_id = $_POST["new_location_id"];
    $new_complaint_id = $_POST["new_complaint_id"];
    $new_user_id = $_POST["new_user_id"];
    
    
    // Insert data into the database
    $sql = "INSERT INTO user_complaint (number_id, new_location_id, new_complaint_id, new_user_id) 
    VALUES ('$number_id', '$new_location_id', '$new_complaint_id', '$new_user_id')";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":number_id", $number_id);
    $stmt->bindParam(":new_location_id", $new_location_id);
    $stmt->bindParam(":new_complaint_id", $new_complaint_id);
    $stmt->bindParam(":status", $status);
    $stmt->bindParam(":new_user_id", $new_user_id);
    
    if ($stmt->execute()) {
        echo "Complaint submitted successfully.";
    } else {
        echo "Error submitting complaint.";
    }
}
?>