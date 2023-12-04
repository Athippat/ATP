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
                            <div class="col-lg-8">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label for="inputPassword2" class="mr-2">Search: </label>
                                        <input type="search" class="form-control" id="inputPassword2" placeholder="Search...">
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-4">
                                <div class="text-lg-right mt-3 mt-lg-0">
                                    <button class="btn btn-success" data-toggle="modal" data-target="#createMenu"><i class="mdi mdi-plus-circle mr-1"></i> Create New Menu</button>

                                    <!-- Modal -->
                                    <div class="modal fade text-left" id="createMenu" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle">Create New Menu</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form id="menuForm" action="./databases/menu/add.php" method="POST" enctype="multipart/form-data">
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-xl-6">
                                                                <input type="file" name="fileToUpload" id="fileToUpload" class="dropify" data-height="250" />
                                                            </div> <!-- end col -->
                                                            <div class="col-xl-6">
                                                                <div class="form-group">
                                                                    <label for="name">Name</label>
                                                                    <input type="text" id="name" name="name" class="form-control" placeholder="Ex. Fried rice, Sushi, Soup, ..." required>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="description">Menu Description</label>
                                                                    <textarea class="form-control" id="description" name="description" rows="5"></textarea>
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
                                                    $("#menuForm").on("submit", function(e) {
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
        <!-- end row --> 

        <?PHP
        $stmt = $pdo->query('SELECT * FROM menu');
        $menus = $stmt->fetchAll();
        ?>

        <div class="row">

            <!-- Add Raw -->
            <?PHP foreach ($menus as $menu) {?>
                <?PHP
                $stmt = $pdo->prepare("SELECT * FROM menu_material WHERE menu_id=:menu_id");
                $stmt->execute([':menu_id' => $menu['id']]);
                $menu_material = $stmt->fetchAll();
                ?>

                <?PHP if(count($menu_material) == 0){?>
                    <div class="col-xl-3 col-lg-6 text-center">
                        <div class="card">
                            <div style="aspect-ratio: 16/9; overflow: hidden; display: flex; justify-content: center; align-items: center;">
                                <?PHP if($menu['image'] == null){?>
                                    <img height="100%" src="https://fakeimg.pl/1920x1080/?text=<?PHP echo $menu['name']?>">
                                <?PHP }else{?>
                                    <img height="100%" src="./pictures/menu/<?PHP echo $menu['id'] . '.' . $menu['image']?>">
                                <?PHP }?>
                            </div>
                            <div class="card-body">
                                <h5 class="mb-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 100%;" title="<?PHP echo $menu['name']?>"><?PHP echo $menu["name"];?></h5>
                                <p class="text-success font-size-13">Add raw materials</p>

                                <div class="row justify-content-center">
                                    <a href="./index.php?page=menu&id=<?PHP echo $menu['id']?>" class="btn btn-success text-white mx-1"><i class="mdi mdi-plus-circle"></i></a>
                                </div>
                            </div>
                        </div> <!-- end card-->
                    </div> <!-- end col-->
                <?PHP }?>
            <?PHP }?>

            <!-- Out of Material -->
            <?PHP foreach ($menus as $menu) {?>
                <?PHP
                $stmt = $pdo->prepare("SELECT * FROM menu_material WHERE menu_id=:menu_id");
                $stmt->execute([':menu_id' => $menu['id']]);
                $menu_material = $stmt->fetchAll();

                $countRawMaterial = 0;

                foreach ($menu_material as $MM) { 
                    $stmt = $pdo->prepare("SELECT * FROM material WHERE id=:id");
                    $stmt->execute([':id' => $MM['material_id']]);
                    $material = $stmt->fetchAll();

                    $stmt = $pdo->prepare("SELECT * FROM material_quantity WHERE material_id=:material_id");
                    $stmt->execute([':material_id' => $material[0]['id']]);
                    $material_quantity = $stmt->fetchAll();

                    $balance = 0;

                    foreach($material_quantity as $mq){
                        $balance += $mq["balance"];
                    }

                    if($balance - $MM["quantity"] < 0){
                        $countRawMaterial++;
                    }
                }
                ?>

                <?PHP if($countRawMaterial > 0){?>
                    <div class="col-xl-3 col-lg-6 text-center">
                        <div class="card">
                            <div style="aspect-ratio: 16/9; overflow: hidden; display: flex; justify-content: center; align-items: center;">
                                <?PHP if($menu['image'] == null){?>
                                    <img height="100%" src="https://fakeimg.pl/1920x1080/?text=<?PHP echo $menu['name']?>">
                                <?PHP }else{?>
                                    <img height="100%" src="./pictures/menu/<?PHP echo $menu['id'] . '.' . $menu['image']?>">
                                <?PHP }?>
                            </div>
                            <div class="card-body">
                                <h5 class="mb-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 100%;" title="<?PHP echo $menu['name']?>"><?PHP echo $menu["name"]?></h5>
                                <p class="text-danger font-size-13">Out of raw material</p>

                                <div class="row justify-content-center">
                                    <a href="./index.php?page=menu&id=<?PHP echo $menu['id']?>" class="btn btn-warning text-white mx-1"><i class="mdi mdi-pencil"></i></a>
                                    <a href="./index.php?page=rawMaterial_manage" class="btn btn-success"><i class="mdi mdi-silverware-variant"></i> Add Raw Material</a>
                                </div>
                            </div>
                        </div> <!-- end card-->
                    </div> <!-- end col-->
                <?PHP }?>
            <?PHP }?>

            <!-- Normal -->
            <?PHP foreach ($menus as $menu) {?>
                <?PHP
                $stmt = $pdo->prepare("SELECT * FROM menu_material WHERE menu_id=:menu_id");
                $stmt->execute([':menu_id' => $menu['id']]);
                $menu_material = $stmt->fetchAll();

                $i = 0;

                $numOfUnit = 0;

                // For Check Balance
                $countRawMaterial = 0;

                foreach ($menu_material as $MM) { 
                    $stmt = $pdo->prepare("SELECT * FROM material WHERE id=:id");
                    $stmt->execute([':id' => $MM['material_id']]);
                    $material = $stmt->fetchAll();

                    $stmt = $pdo->prepare("SELECT * FROM material_quantity WHERE material_id=:material_id");
                    $stmt->execute([':material_id' => $material[0]['id']]);
                    $material_quantity = $stmt->fetchAll();

                    $balance = 0;

                    foreach($material_quantity as $mq){
                        $balance += $mq["balance"];
                    }

                    if($balance - $MM["quantity"] < 0){
                        $countRawMaterial++;

                    }

                    if($i == 0){
                        $numOfUnit = $balance / $MM["quantity"];
                    }else{
                        if(($balance / $MM["quantity"]) < $numOfUnit){
                            $numOfUnit = $balance / $MM["quantity"];
                        }
                    }
                    $i++;
                }
                ?>

                <?PHP if(count($menu_material) > 0 && $countRawMaterial == 0){?>
                    <div class="col-xl-3 col-lg-6 text-center">
                        <div class="card">
                            <div style="aspect-ratio: 16/9; overflow: hidden; display: flex; justify-content: center; align-items: center;">
                                <?PHP if($menu['image'] == null){?>
                                    <img height="100%" src="https://fakeimg.pl/1920x1080/?text=<?PHP echo $menu['name']?>">
                                <?PHP }else{?>
                                    <img height="100%" src="./pictures/menu/<?PHP echo $menu['id'] . '.' . $menu['image']?>">
                                <?PHP }?>
                            </div>
                            <div class="card-body">
                                <h5 class="mb-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 100%;" title="<?PHP echo $menu['name']?>"><?PHP echo $menu["name"]?></h5>
                                <p class="text-muted font-size-13"><?PHP echo floor($numOfUnit)?> Unit</p>

                                <div class="row justify-content-center">
                                <a href="./index.php?page=menu&id=<?PHP echo $menu['id']?>" class="btn btn-warning text-white mx-1"><i class="mdi mdi-pencil"></i></a>
                            </div>
                            </div>
                        </div> <!-- end card-->
                    </div> <!-- end col-->
                <?PHP }?>
            <?PHP }?>
        </div>
        <!-- end row-->

        <!-- <div class="row">
            <div class="col-12">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item">
                            <a class="page-link" href="javascript: void(0);" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="javascript: void(0);">1</a></li>
                        <li class="page-item"><a class="page-link" href="javascript: void(0);">2</a></li>
                        <li class="page-item"><a class="page-link" href="javascript: void(0);">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="javascript: void(0);">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div> -->
        <!-- end row-->
    </div> <!-- container-fluid -->
</div>
<!-- End Page-content -->

<?PHP }else{?>
<?PHP
$stmt = $pdo->prepare("SELECT * FROM menu WHERE id=:id");
$stmt->execute([':id' => $_GET['id']]);
$menu = $stmt->fetchAll();
?>
<div class="page-content">
    <div class="container-fluid">
        <div class="row mb-4">
            <div class="col-xl-6">
                <form id="uploadImageMenuForm" action="./databases/menu/uploadImage.php?id=<?PHP echo $_GET['id']?>" method="POST" enctype="multipart/form-data">
                    <input type="file" id="fileToUpload" name="fileToUpload" class="dropify" data-height="250"
                        <?PHP if($menu[0]['image'] != null){?>
                            data-default-file="./pictures/menu/<?PHP echo $menu[0]['id'] . '.' . $menu[0]['image']?>"
                        <?PHP }?>
                    ><br>
                    <button type="submit" class="btn btn-primary w-100">Upload Image</button><br><br>
                </form>
                <form id="removeImageMenuForm" action="./databases/menu/uploadImage.php?id=<?PHP echo $_GET['id']?>&remove=1" method="POST">
                    <button type="submit" class="btn btn-danger w-100">Remove Image</button><br><br>
                </form>
            </div> <!-- end col -->

            <script>
                $("#uploadImageMenuForm").on("submit", function(e) {
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
                $("#removeImageMenuForm").on("submit", function(e) {
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
            
            <div class="col-xl-6">
                <form id="editMenuForm" action="./databases/menu/edit.php?id=<?PHP echo $_GET['id']?>" method="POST">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" name ="name" class="form-control" placeholder="Ex. Fried rice, Sushi, Soup, ..." value="<?PHP echo $menu[0]['name']?>" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Menu Description</label>
                        <textarea class="form-control" id="description" name="description" rows="5"><?PHP echo $menu[0]['description']?></textarea>
                    </div>

                    <button type="submit" class="btn btn-warning text-white"><i class="mdi mdi-pencil"></i> Edit</button>
                    <button type="button" class="btn btn-danger"><i class="mdi mdi-trash-"></i> Delete</button>
                </form>

                <script>
                    $("#editMenuForm").on("submit", function(e) {
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


        <h1>Raw Material</h1>

        <?PHP
        $stmt = $pdo->prepare('SELECT * FROM menu_material WHERE menu_id=:menu_id');
        $stmt->execute([":menu_id" => $_GET["id"]]);
        $menuMaterials = $stmt->fetchAll();
        ?>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <table class="table dt-responsive nowrap text-center">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Raw Material</th>
                                    <th>Quantity / Menu</th>
                                    <th>Balance</th>
                                    <th>Status</th>
                                    <th>Manage</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                                <?PHP foreach($menuMaterials as $menuMaterial){?>
                                <?PHP
                                $stmt = $pdo->prepare('SELECT * FROM material WHERE id=:id');
                                $stmt->execute([":id" => $menuMaterial['material_id']]);
                                $material = $stmt->fetchAll();

                                $stmt = $pdo->prepare("SELECT * FROM material_quantity WHERE material_id=:material_id");
                                $stmt->execute([':material_id' => $material[0]['id']]);
                                $material_quantity = $stmt->fetchAll();

                                $balance = 0;

                                foreach ($material_quantity as $mq){
                                    $balance += $mq["balance"];
                                }

                                $stmt = $pdo->prepare('SELECT * FROM unit WHERE id=:id');
                                $stmt->execute([":id" => $material[0]['unit_id']]);
                                $unit = $stmt->fetchAll();
                                ?>
                                <tr>
                                    <td>
                                    <?PHP if($material[0]['image'] == null){?>
                                        <img class="img-fluid rounded" src="https://fakeimg.pl/1920x1080/?text=<?PHP echo $material[0]['name']?>" width="100">
                                    <?PHP }else{?>
                                        <img class="img-fluid rounded" src="./pictures/rawMaterial/<?PHP echo $material[0]['id'] . '.' . $material[0]['image']?>" width="100">
                                    <?PHP }?>
                                    </td>
                                    <td><?PHP echo $material[0]['name']?></td>
                                    <td><?PHP echo $menuMaterial['quantity'] . " " . $unit[0]['unit']?></td>
                                    <td><?PHP echo $balance . " " . $unit[0]['unit']?></td>
                                    <?PHP if($balance-$menuMaterial['quantity'] >= 0){ ?>
                                        <td class="text-success">Enough</td>
                                    <?PHP }else if($balance-$menuMaterial['quantity'] < 0){ ?>
                                        <td class="text-danger">Not Enough</td>
                                    <?PHP } ?>
                                    <td>
                                        <button class="btn btn-danger" data-toggle="modal" data-target="#deleteRawMaterial_<?PHP echo $menuMaterial["id"]?>"><i class="mdi mdi-trash-can"></i></button>
                                    </td>
                                </tr>

                                <!-- Modal -->
                                <div class="modal fade text-left" id="deleteRawMaterial_<?PHP echo $menuMaterial['id']?>" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body text-center">
                                                    Do your really want to delete
                                                    <br><br>
                                                    <h2 class="text-warning"><?PHP echo $material[0]['name'];?></h2>
                                                </div>
                                                <form id="deleteRawMaterialForm_<?PHP echo $menuMaterial['id']?>" action="./databases/menu/deleteRawMaterial.php?id=<?PHP echo $menuMaterial['id']?>" method="post">
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-danger">Delete</button>
                                                    </div>
                                                </form>
                                            </div>
                                    </div>
                                </div>
                                <script>
                                    $("#deleteRawMaterialForm_<?PHP echo $menuMaterial['id']?>").on('submit', function(e) {
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
                                <form id="rawMaterialForm" action="./databases/menu/addRawMaterial.php?id=<?PHP echo $_GET['id'];?>" method="POST">
                                    <tr>
                                        <td></td>
                                        <td>
                                            <?PHP
                                            $stmt = $pdo->query('SELECT * FROM material');
                                            $materials = $stmt->fetchAll();
                                            ?>
                                            
                                            <div class="form-group">
                                                <select class="form-control mb-3" id="rawMaterial" name="rawMaterial" required>
                                                    <option value="">- Select Raw Material -</option>
                                                    <?PHP foreach($materials as $material){?>
                                                        <option value="<?PHP echo $material['id']?>"><?PHP echo $material['name']?></option>
                                                    <?PHP }?>
                                                </select>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group">
                                                <input type="number" step="any" id="quantity" name="quantity" class="form-control" placeholder="Quantity / Menu" required>
                                            </div>
                                        </td>
                                        <td>0</td>
                                        <td></td>
                                        <td><button type="submit" class="btn btn-success"><i class="mdi mdi-plus-circle"></i></button></td>
                                    </tr>
                                </form>
                                
                                <script>
                                    $("#rawMaterialForm").on("submit", function(e) {
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
                            </tbody>
                        </table>

                    </div> <!-- end card body-->
                </div> <!-- end card -->
            </div><!-- end col-->
        </div>
        <!-- end row-->
    </div>
</div>
<?PHP }?>