<?PHP
header("Content-Type: application/json");

require '../db-connect.php';

$uploadOk = 1;

if(isset($_GET["remove"])){
    $stmt = $pdo->prepare("UPDATE account SET image=null WHERE id=:id");
    $stmt->execute([':id' => $_GET["id"]]);
    echo json_encode(["status" => "success", "message" => "You removed image of this account already."]);
    exit;
}else{
    if($_FILES["fileToUpload"]["error"] == 0){
        $target_dir = "../../pictures/account/";
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
            $id = $_GET['id'];

            $target_file_new = $target_dir . $id . "." . $imageFileType;

            if(move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file_new)){
                $stmt = $pdo->prepare("UPDATE account SET image=:image WHERE id=:id");
                $stmt->execute([':image' => $imageFileType, ':id' => $id]);
                echo json_encode(["status" => "success", "message" => "You changed account profile already."]);
                exit;
            }else{
                echo json_encode(["status" => "error", "message" => "Sorry, there was an error uploading your file."]);
                exit;
            }
        }
    }else{
        echo json_encode(["status" => "error", "message" => "You must add picture."]);
        exit;
    }
}
?>