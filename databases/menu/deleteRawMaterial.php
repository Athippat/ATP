<?PHP
header("Content-Type: application/json");

require '../db-connect.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    try {
        $stmt = $pdo->prepare("DELETE FROM menu_material WHERE id = ?");
        $result = $stmt->execute([$id]);

        echo json_encode(["status" => "success", "message" => "You deleted raw material of this menu already"]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Can't delete raw material."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Can't delete raw material."]);
}
?>