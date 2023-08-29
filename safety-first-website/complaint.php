<?php

require 'connection';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
  $role = $_POST["role"];
  $complaint = $_POST["complaint"];
  $place = $_POST["place"];

// Insert data into the database
$sql = "INSERT INTO complaints (role, complaint, place) VALUES (:role, :complaint, :place)";
$stmt = $conn->prepare($sql);
$stmt->bindParam(":role", $role);
$stmt->bindParam(":complaint", $complaint);
$stmt->bindParam(":place", $place);

if ($stmt->execute()) {
    echo "Complaint submitted successfully.";
} else {
    echo "Error submitting complaint.";
}

}

?>
