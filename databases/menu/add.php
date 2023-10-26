<?PHP
header("Content-Type: application/json");

require '../db-connect.php';

$uploadOk = 1;

$name = $_POST['name'];
$description = (($_POST['description'] == "") ? $description = null : $description = $_POST["description"]);

if($_FILES["fileToUpload"]["error"] != 0){
    $stmt = $pdo->prepare("INSERT INTO menu (name, description) VALUES (:name, :description)");
    $stmt->execute([
        ':name' => $name,
        ':description' => $description,
    ]);
    echo json_encode(["status" => "success", "message" => "You created new menu already."]);
    exit;
}else if($_FILES["fileToUpload"]["error"] == 0){
    $target_dir = "../../pictures/menu/";
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
        $stmt = $pdo->prepare("INSERT INTO menu (name, description) VALUES (:name, :description)");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description,
        ]);

        $stmt = $pdo->query('SELECT * FROM menu ORDER BY id DESC');
        $latestRecord = $stmt->fetch();

        $id = $latestRecord['id'];

        $target_file_new = $target_dir . $id . "." . $imageFileType;

        if(move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file_new)){
            $stmt = $pdo->prepare("UPDATE menu SET image=:image WHERE id=:id");
            $stmt->execute([':image' => $imageFileType, ':id' => $id]);
            echo json_encode(["status" => "success", "message" => "You created new menu already."]);
            exit;
        }else{
            $stmt = $pdo->prepare("DELETE FROM menu SET WHERE id=:id");
            $stmt->execute([':id' => $id]);
            echo json_encode(["status" => "error", "message" => "Sorry, there was an error uploading your file."]);
            exit;
        }
    }
}
?>