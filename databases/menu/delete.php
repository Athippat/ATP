<?PHP
header("Content-Type: application/json");

require '../db-connect.php';

$id = $_GET["id"];

try{
    $sql = "DELETE FROM menu_material WHERE menu_id=:menu_id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ":menu_id" => $id
    ]);

    $sql = "DELETE FROM menu WHERE id=:id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ":id" => $id
    ]);
    echo json_encode(["status" => "success", "message" => "You deleted this menu already."]);
    exit;
}catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Can't update menu."]);
    exit;
}
?>