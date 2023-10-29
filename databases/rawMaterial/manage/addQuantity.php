<?PHP
header("Content-Type: application/json");

require '../../db-connect.php';

$material_id = $_GET["material_id"];
$quantity = $_POST["quantity"];
$price = $_POST["price"];

$stmt = $pdo->prepare("INSERT INTO material_quantity (material_id, price, quantity, balance) VALUES (:material_id, :price, :quantity, :balance)");
$stmt->execute([
    ':material_id' => $material_id,
    ':price' => $price,
    ':quantity' => $quantity,
    ':balance' => $quantity,
]);

echo json_encode(["status" => "success", "message" => ""]);

exit;
?>