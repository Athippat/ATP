<?PHP
header("Content-Type: application/json");

require '../../db-connect.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    try {
        $stmt = $pdo->prepare("DELETE FROM material_quantity WHERE id = ?");
        $result = $stmt->execute([$id]);

        echo json_encode(["status" => "success", "message" => "You deleted this stock already"]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Can't delete this stock."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Can't delete this stock."]);
}
?>