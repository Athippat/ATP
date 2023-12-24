<?PHP
header("Content-Type: application/json");

require '../db-connect.php';

$uploadOk = 1;

$username = $_POST['username'];
$password = $_POST['password'];
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$nickname = $_POST['nickname'];
$permission = $_POST['permission'];

if($_FILES["fileToUpload"]["error"] != 0){
    $stmt = $pdo->prepare("INSERT INTO account (username, password, firstname, lastname, nickname, permission) VALUES (:username, :password, :firstname, :lastname, :nickname, :permission)");
    $stmt->execute([
        ':username' => $username,
        ':password' => $password,
        ':firstname' => $firstname,
        ':lastname' => $lastname,
        ':nickname' => $nickname,
        ':permission' => $permission,
    ]);
    echo json_encode(["status" => "success", "message" => "You created new account already."]);
    exit;
}else if($_FILES["fileToUpload"]["error"] == 0){
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
        $stmt = $pdo->prepare("INSERT INTO account (username, password, firstname, lastname, nickname, permission) VALUES (:username, :password, :firstname, :lastname, :nickname, :permission)");
        $stmt->execute([
            ':username' => $username,
            ':password' => $password,
            ':firstname' => $firstname,
            ':lastname' => $lastname,
            ':nickname' => $nickname,
            ':permission' => $permission,
        ]);

        $stmt = $pdo->query('SELECT * FROM account ORDER BY id DESC');
        $latestRecord = $stmt->fetch();

        $id = $latestRecord['id'];

        $target_file_new = $target_dir . $id . "." . $imageFileType;

        if(move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file_new)){
            $stmt = $pdo->prepare("UPDATE account SET image=:image WHERE id=:id");
            $stmt->execute([':image' => $imageFileType, ':id' => $id]);
            echo json_encode(["status" => "success", "message" => "You created new account already."]);
            exit;
        }else{
            $stmt = $pdo->prepare("DELETE FROM account SET WHERE id=:id");
            $stmt->execute([':id' => $id]);
            echo json_encode(["status" => "error", "message" => "Sorry, there was an error uploading your file."]);
            exit;
        }
    }
}
?>