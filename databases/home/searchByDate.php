<?PHP
header("Content-Type: application/json");

require '../db-connect.php';

$dateFObject = DateTime::createFromFormat('m/d/Y', $_POST['dateF']);
$newDateF = $dateFObject->format('Y-m-d');

$dateTObject = DateTime::createFromFormat('m/d/Y', $_POST['dateT']);
$newDateT = $dateTObject->format('Y-m-d');

// COST
$sql = "SELECT * FROM material_cost WHERE DATE(regDate) BETWEEN :dateF AND :dateT";
$stmt = $pdo->prepare($sql);
$stmt->execute([
    ":dateF" => $newDateF,
    ":dateT" => $newDateT
]);
$result = $stmt->fetchAll();

$total_cost = 0;

foreach($result as $r){
    $total_cost += ($r['price'] * $r['quantity']);
}

//LeftOver
$sql = "SELECT * FROM material_leftover WHERE DATE(regDate) BETWEEN :dateF AND :dateT";
$stmt = $pdo->prepare($sql);
$stmt->execute([
    ":dateF" => $newDateF,
    ":dateT" => $newDateT
]);
$result = $stmt->fetchAll();

$total_leftover = 0;

foreach($result as $r){
    $total_leftover += ($r['price'] * $r['quantity']);
}

echo json_encode([
    "cost" => number_format($total_cost, 2),
    "leftover" => number_format($total_leftover, 2)
]);
?>
