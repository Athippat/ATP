<?PHP
header("Content-Type: application/json");

require '../db-connect.php';

$name = $_POST['name'];
$description = (($_POST['description'] == "") ? $description = null : $description = $_POST["description"]);

try {
    $stmt = $pdo->prepare("UPDATE menu SET name=:name, description=:description WHERE id = :id");
    $stmt->execute([':name' => $name, ':description' => $description , 'id' => $_GET['id']]);

    echo json_encode(["status" => "success", "message" => "You updated menu already"]);
} catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Can't update menu."]);
}
?>