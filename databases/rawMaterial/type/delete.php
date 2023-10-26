<?PHP
require '../../db-connect.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    try {
        $stmt = $pdo->prepare("DELETE FROM type WHERE id = ?");
        $result = $stmt->execute([$id]);

        echo json_encode(["status" => "success", "message" => "You deleted type already"]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Can't delete type."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Can't delete type."]);
}
?>