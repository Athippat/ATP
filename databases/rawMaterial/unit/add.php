<?php
header("Content-Type: application/json");

require '../db-connect.php';

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['unit'])) {
    // Sanitize your data
    $unit = filter_input(INPUT_POST, 'unit', FILTER_SANITIZE_STRING);

    try {
        // Insert into the database
        $stmt = $pdo->prepare("INSERT INTO unit (unit) VALUES (?)");
        $stmt->execute([$unit]);

        echo json_encode(["status" => "success", "message" => "You created new unit already."]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Can't create new unit."]);
    }
}

?>
