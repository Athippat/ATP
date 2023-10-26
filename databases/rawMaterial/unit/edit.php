<?PHP
require '../../db-connect.php';

if(isset($_POST['unit'])) {
    $id = $_POST['id'];
    $unit = $_POST['unit'];

    try {
        $stmt = $pdo->prepare("UPDATE unit SET unit = :unit WHERE id = :id");
        $stmt->execute(['unit' => $unit, 'id' => $id]);

        echo json_encode(["status" => "success", "message" => "You updated unit already"]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Can't update unit."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Can't update unit."]);
}
?>