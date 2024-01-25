<?php

$SERVER_name="localhost";
$username="root";
$password="";
$databaseName="safety_first";

require 'connection.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $complaint_categories_timeline = $_POST["complaint_categories_timeline"];
    $user_id = $_POST["user_id "];
    $complaint_id = $_POST["complaint_id"];
    $complaint_date = $_POST["complaint_date"];
    
    
    // Insert data into the database
    $sql = "INSERT INTO complaint_timeline (Complaint_ID, Complaint, Status, Officer_ID, Location_ID) 
    VALUES ('$complaintID', '$complaintText', '$status', '$officerID', '$locationID');";

    $stmt = $conn->prepare($sql);
    $stmt->bindParam(":complaint_categories_timeline", $complaint_categories_timeline);
    $stmt->bindParam(":user_id", $user_id );
    $stmt->bindParam(":status", $complaint_id );
    $stmt->bindParam(":complaint_date",  $complaint_date);
   
    
    if ($stmt->execute()) {
        echo "Complaint submitted successfully.";
    } else {
        echo "Error submitting complaint.";
    }
}
?>