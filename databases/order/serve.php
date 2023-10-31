<?PHP
header("Content-Type: application/json");

session_start();

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

    // -----------------------------
    // Add To History
    // -----------------------------

    $stmt = $pdo->prepare("SELECT * FROM menu WHERE id=:id");
    $stmt->execute([':id' => $menu_id]);
    $menus = $stmt->fetchAll();

    $stmt = $pdo->prepare("INSERT INTO history (menu_id, menu_name, menu_image, serveBy) VALUES (:menu_id, :menu_name, :menu_image, :serveBy)");
    $stmt->execute([
        ':menu_id' => $menu_id,
        ':menu_name' => $menus[0]["name"],
        ':menu_image' => $menus[0]["image"],
        ':serveBy' => $_SESSION["firstname"] . " " . $_SESSION['lastname'] . " (" . $_SESSION['nickname'] . ")",
    ]);

    echo json_encode(["status" => "success", "message" => "Served."]);
}catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Can't Serve."]);
}
?>