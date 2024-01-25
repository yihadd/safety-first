<?php

$SERVER_name="localhost";
$username="root";
$password="";
$databaseName="safety_first";


require 'connection.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") 
{
    $complaint_id = $_POST["complaint_id"];
    $complaint = $_POST["complaint"];
    $location_id = $_POST["location_id"];
    $status = $_POST["status"];
    $officer_id = $_POST["officer_id"];
    
    // Insert data into the database
    $sql = "INSERT INTO complaint (complaint_id, complaint, location_id, status, officer_id) 
    VALUES ('$complaint_id', '$complaint', '$location_id', '$status', '$officer_id')";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":complaint_id", $complaint_id);
    $stmt->bindParam(":complaint", $complaint);
    $stmt->bindParam(":location_id", $location_id);
    $stmt->bindParam(":status", $status);
    $stmt->bindParam(":officer_id", $officer_id);
    
    if ($stmt->execute()) {
        echo "Complaint submitted successfully.";
    } else {
        echo "Error submitting complaint.";
    }
}
?>