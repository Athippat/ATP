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

        $stmt = $pdo->prepare("SELECT * FROM material_quantity WHERE material_id=:material_id AND balance!=0 ORDER BY id");
        $stmt->execute([':material_id' => $material[0]['id']]);
        $materialQuantity = $stmt->fetchAll();

        // print_r($materialQuantity);

        $i = 0;

        while(true){
            if($materialQuantity[$i]["balance"]-$mm["quantity"] >= 0){
                $stmt = $pdo->prepare("UPDATE material_quantity SET balance=:balance WHERE id=:id");
                $stmt->execute([
                    ':balance' => $materialQuantity[$i]["balance"]-$mm["quantity"],
                    ':id' => $materialQuantity[$i]["id"]
                ]);

                $stmt = $pdo->prepare("SELECT * FROM material WHERE id=:id");
                $stmt->execute([':id' => $materialQuantity[$i]["material_id"]]);
                $material = $stmt->fetchAll();

                $result = $material[0]["balance"] - $mm["quantity"];

                $stmt = $pdo->prepare("UPDATE material SET balance=:balance WHERE id=:id");
                $stmt->execute([
                    ':balance' => $result,
                    ':id' => $materialQuantity[$i]["material_id"]
                ]);
                break;
            }else if($materialQuantity[$i]["balance"]-$mm["quantity"] < 0){
                $remainder = $mm["quantity"]-$materialQuantity[$i]["balance"];

                $stmt = $pdo->prepare("UPDATE material_quantity SET balance=:balance WHERE id=:id");
                $stmt->execute([
                    ':balance' => 0,
                    ':id' => $materialQuantity[$i]["id"]
                ]);

                $stmt = $pdo->prepare("SELECT * FROM material WHERE id=:id");
                $stmt->execute([':id' => $materialQuantity[$i]["material_id"]]);
                $material = $stmt->fetchAll();

                $result = $material[0]["balance"] - $materialQuantity[$i]["balance"];

                $stmt = $pdo->prepare("UPDATE material SET balance=:balance WHERE id=:id");
                $stmt->execute([
                    ':balance' => $result,
                    ':id' => $materialQuantity[$i]["material_id"]
                ]);

                if($materialQuantity[$i+1]["balance"]-$remainder >= 0){
                    // echo "ตัด Stock ได้เลย2";
                    $stmt = $pdo->prepare("UPDATE material_quantity SET balance=:balance WHERE id=:id");
                    $stmt->execute([
                        ':balance' => $materialQuantity[$i+1]["balance"]-$remainder,
                        ':id' => $materialQuantity[$i+1]["id"]
                    ]);

                    $stmt = $pdo->prepare("SELECT * FROM material WHERE id=:id");
                    $stmt->execute([':id' => $materialQuantity[$i+1]["material_id"]]);
                    $material = $stmt->fetchAll();

                    $result = $material[0]["balance"] - $materialQuantity[$i]["balance"];

                    $stmt = $pdo->prepare("UPDATE material SET balance=:balance WHERE id=:id");
                    $stmt->execute([
                        ':balance' => $result,
                        ':id' => $materialQuantity[$i+1]["material_id"]
                    ]);
                    break;
                }else{
                    // echo "set ให้ stock ที่ i เป็น 0 และลบ จำนวน balance ใน material";
                    $stmt = $pdo->prepare("UPDATE material_quantity SET balance=:balance WHERE id=:id");
                    $stmt->execute([
                        ':balance' => 0,
                        ':id' => $materialQuantity[$i]["id"]
                    ]);

                    $stmt = $pdo->prepare("SELECT * FROM material WHERE id=:id");
                    $stmt->execute([':id' => $materialQuantity[$i]["material_id"]]);
                    $material = $stmt->fetchAll();

                    $result = $material[0]["balance"] - $materialQuantity[$i]["balance"];

                    $stmt = $pdo->prepare("UPDATE material SET balance=:balance WHERE id=:id");
                    $stmt->execute([
                        ':balance' => $result,
                        ':id' => $materialQuantity[$i]["material_id"]
                    ]);
                }
            }
        }
    }
    echo json_encode(["status" => "success", "message" => "Served."]);
}catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Can't Serve."]);
}
?>