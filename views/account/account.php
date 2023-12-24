<?PHP
$id = (isset($_GET['id']) ? $id = $_GET['id'] : $id = null);
if($id == null){
?>
<div class="page-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="text-lg-right mt-3 mt-lg-0">
                                    <button class="btn btn-success" data-toggle="modal" data-target="#createAccount"><i class="mdi mdi-plus-circle mr-1"></i> Create New Account</button>

                                    <!-- Modal -->
                                    <div class="modal fade text-left" id="createAccount" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Create New Account</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form id="accountForm" action="./databases/account/add.php" method="POST" enctype="multipart/form-data">
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-xl-6 mb-3">
                                                                <input type="file" name="fileToUpload" id="fileToUpload" class="dropify" data-height="150" />
                                                            </div>
                                                            <div class="col-xl-6 mb-3">
                                                                <div class="form-group">
                                                                    <label for="name">Username</label>
                                                                    <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" required>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="name">Password</label>
                                                                    <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                                                                </div>
                                                            </div>

                                                            <div class="col-xl-6">
                                                                <div class="form-group">
                                                                    <label for="name">Firstname</label>
                                                                    <input type="text" id="firstname" name="firstname" class="form-control" placeholder="Enter your firstname">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="form-group">
                                                                    <label for="name">Lastname</label>
                                                                    <input type="text" id="lastname" name="lastname" class="form-control" placeholder="Enter your lastname">
                                                                </div>
                                                            </div>

                                                            <div class="col-xl-6">
                                                                <div class="form-group">
                                                                    <label for="name">Nickname</label>
                                                                    <input type="text" id="nickname" name="nickname" class="form-control" placeholder="Enter your nickname">
                                                                </div>
                                                            </div>
                                                            <div class="col-xl-6">
                                                                <div class="form-group">
                                                                <label for="permission">Permission</label>
                                                                    <select class="form-control mb-3" name="permission" required>
                                                                        <option value="">- Select Permission -</option>
                                                                        <option value="0">Staff</option>
                                                                        <option value="2">Stock Checker</option>
                                                                        <option value="1">Admin</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-success">Create</button>
                                                    </div>
                                                </form>

                                                <script>
                                                    $("#accountForm").on("submit", function(e) {
                                                        e.preventDefault();

                                                        $.ajax({
                                                            url: $(this).attr("action"),
                                                            type: "POST",
                                                            data: new FormData(this),
                                                            processData: false,
                                                            contentType: false,
                                                            success: function(response) {
                                                                if(response.status === "success") {
                                                                    Swal.fire({
                                                                        type: 'success',
                                                                        title: 'Success',
                                                                        text: response.message,
                                                                        timer: 2000,
                                                                        showConfirmButton: false,
                                                                    }).then ( () => {
                                                                        location.reload();
                                                                    });
                                                                } else {
                                                                    Swal.fire({
                                                                        type: 'error',
                                                                        title: 'Error',
                                                                        text: response.message,
                                                                        timer: 2000,
                                                                        showConfirmButton: false
                                                                    });
                                                                }
                                                            },
                                                            error: function() {
                                                                Swal.fire({
                                                                    type: 'error',
                                                                    title: 'Error',
                                                                    text: 'Unexpected error occurred!',
                                                                    timer: 2000,
                                                                    showConfirmButton: false
                                                                });
                                                            }
                                                        });
                                                    });
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- end col-->
                        </div> <!-- end row -->
                    </div>
                </div> <!-- end card-box -->
            </div><!-- end col-->
        </div>

        <?PHP
        $stmt = $pdo->query('SELECT * FROM account');
        $accounts = $stmt->fetchAll();
        ?>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <table id="basic-datatable" class="table dt-responsive nowrap">
                            <thead>
                                <tr>
                                    <th>Profile</th>
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>Name</th>
                                    <th>Permission</th>
                                    <th>Manage</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                                <?PHP foreach ($accounts as $account) {?>
                                <tr>
                                    <td>
                                        <?PHP if($account['image'] == null){?>
                                            <img class="rounded-circle" width="50px" height="50px" src="https://fakeimg.pl/64x64/?text=<?PHP echo $account['nickname']?>">
                                        <?PHP }else{?>
                                            <img class="rounded-circle" width="50px" height="50px" src="./pictures/account/<?PHP echo $account['id'] . '.' . $account['image']?>">
                                        <?PHP }?>
                                    </td>
                                    <td><?PHP echo $account["username"]?></td>
                                    <td><?PHP echo $account["password"]?></td>
                                    <td><?PHP echo $account["firstname"] . " " . $account["lastname"] . " (" . $account["nickname"] . ")"?></td>
                                    <td><?PHP echo checkPermission($account["permission"]); ?></td>
                                    <td>
                                        <a href="./?page=account&id=<?PHP echo $account['id']?>" class="btn btn-warning text-white"><i class="mdi mdi-pencil"></i></a>
                                        <button class="btn btn-danger" data-toggle="modal" data-target="#deleteAccount_<?PHP echo $account["id"]?>"><i class="mdi mdi-trash-can"></i></button>
                                    </td>
                                </tr>
                                
                                <!-- Modal -->
                                <div class="modal fade text-left" id="deleteAccount_<?PHP echo $account['id']?>" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-body text-center">
                                                Do your really want to delete
                                                <br><br>
                                                <h3 class="text-warning"><?PHP echo $account["firstname"] . " " . $account["lastname"] . " (" . $account["nickname"] . ")"?></h3>
                                            </div>
                                            <form id="deleteAccountForm_<?PHP echo $account['id']?>" action="./databases/account/delete.php?id=<?PHP echo $account['id']?>" method="post">
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-danger">Delete</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <script>
                                    $("#deleteAccountForm_<?PHP echo $account['id']?>").on("submit", function(e) {
                                        e.preventDefault();

                                        $.ajax({
                                            url: $(this).attr("action"),
                                            type: "POST",
                                            data: new FormData(this),
                                            processData: false,
                                            contentType: false,
                                            success: function(response) {
                                                if(response.status === "success") {
                                                    Swal.fire({
                                                        type: 'success',
                                                        title: 'Success',
                                                        text: response.message,
                                                        timer: 2000,
                                                        showConfirmButton: false,
                                                    }).then ( () => {
                                                        location.reload();
                                                    });
                                                } else {
                                                    Swal.fire({
                                                        type: 'error',
                                                        title: 'Error',
                                                        text: response.message,
                                                        timer: 2000,
                                                        showConfirmButton: false
                                                    });
                                                }
                                            },
                                            error: function() {
                                                Swal.fire({
                                                    type: 'error',
                                                    title: 'Error',
                                                    text: 'Unexpected error occurred!',
                                                    timer: 2000,
                                                    showConfirmButton: false
                                                });
                                            }
                                        });
                                    });
                                </script>
                                <?PHP }?>
                            </tbody>
                        </table>

                    </div> <!-- end card body-->
                </div> <!-- end card -->
            </div><!-- end col-->
        </div>
        <!-- end row-->
    </div>
</div>
<?PHP }else{?>
<?PHP
$stmt = $pdo->prepare("SELECT * FROM account WHERE id=:id");
$stmt->execute([':id' => $_GET['id']]);
$accounts = $stmt->fetchAll();
?>

<div class="page-content">
    <div class="container-fluid">
        <h1><?PHP echo $accounts[0]['firstname'] . " " . $accounts[0]['lastname'] . " (" . $accounts[0]['nickname'] . ")"?></h1>
        <div class="row mb-4">
            <div class="col-xl-6">
                <form id="uploadImageAccountForm" action="./databases/account/uploadImage.php?id=<?PHP echo $_GET['id']?>" method="POST" enctype="multipart/form-data">
                    <input type="file" id="fileToUpload" name="fileToUpload" class="dropify" data-height="250"
                        <?PHP if($accounts[0]['image'] != null){?>
                            data-default-file="./pictures/account/<?PHP echo $accounts[0]['id'] . '.' . $accounts[0]['image']?>"
                        <?PHP }?>
                    ><br>
                    <button type="submit" class="btn btn-primary w-100">Upload Profile</button><br><br>
                </form>
                <form id="removeImageAccountForm" action="./databases/account/uploadImage.php?id=<?PHP echo $_GET['id']?>&remove=1" method="POST">
                    <button type="submit" class="btn btn-danger w-100">Remove Profile</button><br><br>
                </form>
            </div> <!-- end col -->
            <div class="col-xl-6">
                <form id="editAccountForm" action="./databases/account/edit.php?id=<?PHP echo $accounts[0]['id']?>" method="POST">
                    <div class="form-group">
                        <label>Username</label>
                        <div class="input-group">
                            <input type="text" name="username" class="form-control" placeholder="Enter your username" value="<?PHP echo $accounts[0]["username"]?>" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <div class="input-group">
                            <input type="text" name="password" class="form-control" placeholder="Enter your password" value="<?PHP echo $accounts[0]["password"]?>" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xl-6">
                            <div class="form-group">
                                <label>Firstname</label>
                                <div class="input-group">
                                    <input type="text" name="firstname" class="form-control" placeholder="Enter your fristname" value="<?PHP echo $accounts[0]["firstname"]?>" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="form-group">
                                <label>Lastname</label>
                                <div class="input-group">
                                    <input type="text" name="lastname" class="form-control" placeholder="Enter your lastname" value="<?PHP echo $accounts[0]["lastname"]?>" required>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-6">
                            <div class="form-group">
                                <label for="name">Nickname</label>
                                <input type="text" id="nickname" name="nickname" class="form-control" placeholder="Enter your nickname" value="<?PHP echo $accounts[0]["nickname"]?>">
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="form-group">
                            <label for="permission">Permission</label>
                                <select class="form-control mb-3" name="permission" required>
                                    <!-- <option value="">- Select Permission -</option> -->
                                    <option value="0" <?PHP if($accounts[0]['permission'] == 0) echo "selected" ?>>Staff</option>
                                    <option value="2" <?PHP if($accounts[0]['permission'] == 2) echo "selected" ?>>Stock Checker</option>
                                    <option value="1" <?PHP if($accounts[0]['permission'] == 1) echo "selected" ?>>Admin</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-warning text-white"><i class="mdi mdi-pencil"></i> Edit</button>
                </form>

                <script>
                    $("#uploadImageAccountForm").on("submit", function(e) {
                        e.preventDefault();

                        $.ajax({
                            url: $(this).attr("action"),
                            type: "POST",
                            data: new FormData(this),
                            processData: false,
                            contentType: false,
                            success: function(response) {
                                if(response.status === "success") {
                                    Swal.fire({
                                        type: 'success',
                                        title: 'Success',
                                        text: response.message,
                                        timer: 2000,
                                        showConfirmButton: false,
                                    }).then ( () => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        type: 'error',
                                        title: 'Error',
                                        text: response.message,
                                        timer: 2000,
                                        showConfirmButton: false
                                    });
                                }
                            },
                            error: function() {
                                Swal.fire({
                                    type: 'error',
                                    title: 'Error',
                                    text: 'Unexpected error occurred!',
                                    timer: 2000,
                                    showConfirmButton: false
                                });
                            }
                        });
                    });
                    $("#removeImageAccountForm").on("submit", function(e) {
                        e.preventDefault();

                        $.ajax({
                            url: $(this).attr("action"),
                            type: "POST",
                            data: new FormData(this),
                            processData: false,
                            contentType: false,
                            success: function(response) {
                                if(response.status === "success") {
                                    Swal.fire({
                                        type: 'success',
                                        title: 'Success',
                                        text: response.message,
                                        timer: 2000,
                                        showConfirmButton: false,
                                    }).then ( () => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        type: 'error',
                                        title: 'Error',
                                        text: response.message,
                                        timer: 2000,
                                        showConfirmButton: false
                                    });
                                }
                            },
                            error: function() {
                                Swal.fire({
                                    type: 'error',
                                    title: 'Error',
                                    text: 'Unexpected error occurred!',
                                    timer: 2000,
                                    showConfirmButton: false
                                });
                            }
                        });
                    });
                    $("#editAccountForm").on("submit", function(e) {
                        e.preventDefault();

                        $.ajax({
                            url: $(this).attr("action"),
                            type: "POST",
                            data: new FormData(this),
                            processData: false,
                            contentType: false,
                            success: function(response) {
                                if(response.status === "success") {
                                    Swal.fire({
                                        type: 'success',
                                        title: 'Success',
                                        text: response.message,
                                        timer: 2000,
                                        showConfirmButton: false,
                                    }).then ( () => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        type: 'error',
                                        title: 'Error',
                                        text: response.message,
                                        timer: 2000,
                                        showConfirmButton: false
                                    });
                                }
                            },
                            error: function() {
                                Swal.fire({
                                    type: 'error',
                                    title: 'Error',
                                    text: 'Unexpected error occurred!',
                                    timer: 2000,
                                    showConfirmButton: false
                                });
                            }
                        });
                    });
                </script>
            </div>
        </div>
    </div>
</div>
<?PHP }?>