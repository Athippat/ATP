<?PHP
header("Content-Type: application/json");

require '../db-connect.php';

$rawMaterial = $_POST['rawMaterial'];
$quantity = $_POST['quantity'];

try {
    $stmt = $pdo->prepare("INSERT INTO menu_material (menu_id, material_id, quantity) VALUES (:menu_id, :material_id, :quantity)");
    $stmt->execute([':menu_id' => $_GET['id'], ':material_id' => $rawMaterial, ':quantity' => $quantity]);

    echo json_encode(["status" => "success", "message" => "You added new raw material of this menu already."]);
} catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Can't add new raw material."]);
}
?>