<?PHP
header("Content-Type: application/json");

require '../../db-connect.php';

$uploadOk = 1;

$name = $_POST['name'];
$unit_id = $_POST['unit'];
$type_id = $_POST['type'];

if($_FILES["fileToUpload"]["error"] != 0){
    $stmt = $pdo->prepare("INSERT INTO material (name, unit_id, type_id) VALUES (:name, :unit_id, :type_id)");
    $stmt->execute([
        ':name' => $name,
        ':unit_id' => $unit_id,
        ':type_id' => $type_id,
    ]);
    echo json_encode(["status" => "success", "message" => "You created new material already."]);
    exit;
}else if($_FILES["fileToUpload"]["error"] == 0){

    $target_dir = "../../../pictures/rawMaterial/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Check if image file is an actual image or fake image
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
        $uploadOk = 1;
    } else {
        echo json_encode(["status" => "error", "message" => "File is not an image."]);
        $uploadOk = 0;
        exit;
    }

    // Allow certain file formats
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
        echo json_encode(["status" => "error", "message" => "Sorry, only JPG, JPEG, PNG & GIF files are allowed."]);
        $uploadOk = 0;
        exit;
    }

    if ($uploadOk == 1) {
        $stmt = $pdo->prepare("INSERT INTO material (name, unit_id, type_id) VALUES (:name, :unit_id, :type_id)");
        $stmt->execute([
            ':name' => $name,
            ':unit_id' => $unit_id,
            ':type_id' => $type_id,
        ]);

        $stmt = $pdo->query('SELECT * FROM material ORDER BY id DESC');
        $latestRecord = $stmt->fetch();

        $id = $latestRecord['id'];

        $target_file_new = $target_dir . $id . "." . $imageFileType;

        if(move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file_new)){
            $stmt = $pdo->prepare("UPDATE material SET image=:image WHERE id=:id");
            $stmt->execute([':image' => $imageFileType, ':id' => $id]);
            echo json_encode(["status" => "success", "message" => "You created new material already."]);
            exit;
        }else{
            $stmt = $pdo->prepare("DELETE FROM material SET WHERE id=:id");
            $stmt->execute([':id' => $id]);
            echo json_encode(["status" => "error", "message" => "Sorry, there was an error uploading your file."]);
            exit;
        }
    }
}
?>