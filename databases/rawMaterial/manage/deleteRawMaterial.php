<?PHP
header("Content-Type: application/json");

require '../../db-connect.php';

$id = $_GET["id"];

try{
    $sql = "DELETE FROM material WHERE id=:id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ":id" => $id
    ]);

    echo json_encode(["status" => "success", "message" => "You deleted this raw material already."]);
    exit;
}catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Can't update raw material."]);
    exit;
}
?>