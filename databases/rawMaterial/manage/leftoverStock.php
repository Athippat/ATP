<?PHP
header("Content-Type: application/json");

session_start();

require '../../db-connect.php';

$id = $_GET["id"];

try{
    $stmt = $pdo->prepare("SELECT * FROM material_quantity WHERE id=:id");
    $stmt->execute([':id' => $id]);
    $material_quantity = $stmt->fetchAll();

    $stmt = $pdo->prepare("SELECT * FROM material WHERE id=:id");
    $stmt->execute([':id' => $material_quantity[0]["material_id"]]);
    $materials = $stmt->fetchAll();

    $stmt = $pdo->prepare("SELECT * FROM unit WHERE id=:id");
    $stmt->execute([':id' => $materials[0]['unit_id']]);
    $units = $stmt->fetchAll();

    $stmt = $pdo->prepare("SELECT * FROM type WHERE id=:id");
    $stmt->execute([':id' => $materials[0]['type_id']]);
    $types = $stmt->fetchAll();

    $stmt = $pdo->prepare("INSERT INTO material_leftover (name, unit, type, price, quantity, leftoverBy, material_id, material_image) VALUES (:name, :unit, :type, :price, :quantity, :leftoverBy, :material_id, :material_image)");
    $stmt->execute([
        ':name' => $materials[0]["name"],
        ':unit' => $units[0]["unit"],
        ':type' => $types[0]["type"],
        ':price' => $material_quantity[0]["price"],
        ':quantity' => $material_quantity[0]["balance"],
        ':leftoverBy' => $_SESSION["firstname"] . " " . $_SESSION['lastname'] . " (" . $_SESSION['nickname'] . ")",
        ':material_id' => $materials[0]["id"],
        ':material_image' => $materials[0]["image"]
    ]);

    $stmt = $pdo->prepare("DELETE FROM material_quantity WHERE id=:id");
    $stmt->execute([
        ':id' => $id
    ]);

    echo json_encode(["status" => "success", "message" => "This raw material has cleared"]);
}catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Can't clear this stock."]);
    echo $e;
}
?>