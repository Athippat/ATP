<?PHP
header("Content-Type: application/json");

require '../db-connect.php';

$id = $_GET["id"];

if(isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $nickname = $_POST['nickname'];
    $permission = $_POST['permission'];

    try {
        $stmt = $pdo->prepare("UPDATE account SET username=:username, password=:password, firstname=:firstname, lastname=:lastname, nickname=:nickname, permission=:permission WHERE id=:id");
        $stmt->execute([
            ':username' => $username,
            ':password' => $password,
            ':firstname' => $firstname,
            ':lastname' => $lastname,
            ':nickname' => $nickname,
            ':permission' => $permission,
            ':id' => $id
        ]);

        echo json_encode(["status" => "success", "message" => "You updated account already"]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "message" => "Can't update account."]);
    }
} else {
    echo json_encode(["status" => "error", "message" => "Can't update account."]);
}
?>