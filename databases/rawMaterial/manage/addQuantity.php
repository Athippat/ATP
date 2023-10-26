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

$stmt = $pdo->prepare("SELECT * FROM material WHERE id=:id");
$stmt->execute([':id' => $material_id]);
$material = $stmt->fetchAll();

$newBalance = $material[0]["balance"] + $quantity;

$stmt = $pdo->prepare("UPDATE material SET balance=:balance WHERE id=:id");
$stmt->execute([':balance' => $newBalance, ':id' => $material_id]);

echo json_encode(["status" => "success", "message" => ""]);

exit;
?>