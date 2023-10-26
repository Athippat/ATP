<?php
header("Content-Type: application/json");

require '../../db-connect.php';

if (isset($_POST['type']) && isset($_POST['colorChoice'])) {
    $type = $_POST['type'];
    $color = $_POST['colorChoice'];

    try {
        $stmt = $pdo->prepare("INSERT INTO type (type, color) VALUES (:type, :color)");
        $stmt->execute([':type' => $type, ':color' => $color]);

        echo json_encode(["status" => "success", "message" => "You created new type already."]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Can't create new type."]);
    }
}else{
    echo json_encode(["status" => "error", "message" => "Can't create new type."]);
}

?>
