<?PHP
require 'db-connect.php';

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];  // This should be hashed!

    $sql = "SELECT * FROM account WHERE username = :username";
    $stmt = $pdo->prepare($sql);
    
    $stmt->bindParam(':username', $username, PDO::PARAM_STR);
    $stmt->execute();

    if ($user = $stmt->fetch()) {
        if ($password === $user['password']) {
            session_start();
            $_SESSION['loggedin'] = true;
            $_SESSION['username'] = $user['username'];
            $_SESSION['firstname'] = $user['firstname'];
            $_SESSION['lastname'] = $user['lastname'];
            $_SESSION['nickname'] = $user['nickname'];
            $_SESSION['permission'] = $user['permission'];
            if($_SESSION['permission'] == 0){
                header("Location: ../index.php?page=order");
            }else if($_SESSION['permission'] == 1){
                header("Location: ../index.php?page=home");
            }else if($_SESSION['permission'] == 2){
                header("Location: ../index.php?page=rawMaterial_manage");
            }
            exit;
        } else {
            echo "Invalid password!";
        }
    } else {
        echo "Invalid username!";
    }
}
?>
