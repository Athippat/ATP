<?PHP
require '../../db-connect.php';

if(isset($_POST['type']) && isset($_POST['color'])) {
    $id = $_POST['id'];
    $type = $_POST['type'];
    $color = $_POST['color'];

    try {
        $stmt = $pdo->prepare("UPDATE type SET type=:type, color=:color WHERE id = :id");
        $stmt->execute(['type' => $type, 'color' => $color , 'id' => $id]);

        echo json_encode(["status" => "success", "message" => "You updated type already"]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Can't update type."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Can't update type."]);
}
?>