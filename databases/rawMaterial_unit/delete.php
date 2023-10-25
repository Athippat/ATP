<?PHP
require '../db-connect.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    try {
        $stmt = $pdo->prepare("DELETE FROM unit WHERE id = ?");
        $result = $stmt->execute([$id]);

        echo json_encode(["status" => "success", "message" => "You deleted unit already"]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Can't delete unit."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Can't delete unit."]);
}
?>