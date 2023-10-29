<?PHP
header("Content-Type: application/json");

require '../db-connect.php';

$menu_id = $_GET["id"];

try{
    $stmt = $pdo->prepare("SELECT * FROM menu_material WHERE menu_id=:menu_id");
    $stmt->execute([':menu_id' => $menu_id]);
    $menu_material = $stmt->fetchAll();

    // print_r($menu_material);

    foreach($menu_material as $mm){
        $stmt = $pdo->prepare("SELECT * FROM material WHERE id=:id");
        $stmt->execute([':id' => $mm['material_id']]);
        $material = $stmt->fetchAll();

        // print_r($material);

        $stmt = $pdo->prepare("SELECT * FROM material_quantity WHERE material_id=:material_id AND balance!=0 ORDER by id");
        $stmt->execute([':material_id' => $material[0]['id']]);
        $material_quantity = $stmt->fetchAll();

        // print_r($material_quantity);

        // echo $mm["quantity"];

        $i = 0;

        while(isset($material_quantity[0])){
            if($material_quantity[$i]["balance"] - $mm["quantity"] >= 0){
                $stmt = $pdo->prepare("UPDATE material_quantity SET balance=:balance WHERE id=:id");
                $stmt->execute([
                    ':balance' => $material_quantity[$i]["balance"]-$mm["quantity"],
                    ':id' => $material_quantity[$i]["id"]
                ]);
                break;
            }else{
                $reminder = $mm["quantity"] - $material_quantity[$i]["balance"];

                $stmt = $pdo->prepare("UPDATE material_quantity SET balance=:balance WHERE id=:id");
                $stmt->execute([
                    ':balance' => $material_quantity[$i+1]["balance"] - $reminder,
                    ':id' => $material_quantity[$i+1]["id"]
                ]);

                $stmt = $pdo->prepare("UPDATE material_quantity SET balance=:balance WHERE id=:id");
                $stmt->execute([
                    ':balance' => 0,
                    ':id' => $material_quantity[$i]["id"]
                ]);
                break;
            }
        }
    }
    echo json_encode(["status" => "success", "message" => "Served."]);
}catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Can't Serve."]);
}
?>