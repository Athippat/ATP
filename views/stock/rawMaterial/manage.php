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
                                    <div class="form-group mx-sm-3">
                                        <label for="status-select" class="mr-2">Sort By: </label>
                                        <select class="custom-select" id="status-select">
                                            <option selected="">All</option>
                                            <option value="1">Name</option>
                                            <option value="2">Type</option>
                                            <option value="3">Most</option>
                                            <option value="4">Least</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-4">
                                <div class="text-lg-right mt-3 mt-lg-0">
                                    <button class="btn btn-success" data-toggle="modal" data-target="#addMaterial"><i class="mdi mdi-plus-circle mr-1"></i> Create New Material</button>

                                    <?PHP
                                    $stmt = $pdo->query('SELECT * FROM unit');
                                    $units = $stmt->fetchAll();

                                    $stmt = $pdo->query('SELECT * FROM type');
                                    $types = $stmt->fetchAll();
                                    ?>

                                    <!-- Modal -->
                                    <div class="modal fade text-left" id="addMaterial" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalCenterTitle">Create New Material</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form id="rawMaterialForm" action="./databases/rawMaterial/manage/add.php" method="POST" enctype="multipart/form-data">
                                                    <div class="modal-body">
                                                        <div class="row">
                                                            <div class="col-xl-6">
                                                                <input type="file" name="fileToUpload" id="fileToUpload" class="dropify" data-height="250" />
                                                            </div> <!-- end col -->
                                                            <div class="col-xl-6">
                                                                <div class="form-group">
                                                                    <label for="name">Name</label>
                                                                    <input type="text" id="name" name="name" class="form-control" placeholder="Ex. Pork, Meat, Coke, ..." required>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="unit">Unit</label>
                                                                    <select class="form-control mb-3" name="unit" required>
                                                                        <option value="">- Select Unit -</option>
                                                                        <?PHP foreach($units as $unit){?>
                                                                            <option value="<?PHP echo $unit['id']?>"><?PHP echo $unit['unit']?></option>
                                                                        <?PHP }?>
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="unit">Type</label>
                                                                    <select class="form-control mb-3" name="type" required>
                                                                        <option value="">- Select Type -</option>
                                                                        <?PHP foreach($types as $type){?>
                                                                            <option value="<?PHP echo $type['id']?>"><?PHP echo $type['type']?></option>
                                                                        <?PHP }?>
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
        $stmt = $pdo->query('SELECT * FROM material');
        $materials = $stmt->fetchAll();
        ?>

        <div class="row">
            <!-- <div class="col-xl-3 col-lg-6 text-center">
                <a href="./?page=rawMaterial_manage&id=1">
                    <div class="card bg-danger">
                        <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="mb-1 text-white">Pork</h5>
                            <p class="text-white font-size-13">1 KG left</p>
                            <p class="card-text">
                                <small class="text-white">(Recommend 400 KG)</small>
                            </p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-6 text-center">
                <a href="./?page=rawMaterial_manage&id=2">
                    <div class="card bg-danger">
                        <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="mb-1 text-white">Meat</h5>
                            <p class="text-white font-size-13">3 G left</p>
                            <p class="card-text">
                                <small class="text-white">(Recommend 800 KG)</small>
                            </p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-6 text-center">
                <a href="./?page=rawMaterial_manage&id=3">
                    <div class="card bg-warning">
                        <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="mb-1 text-white">Sugar</h5>
                            <p class="text-white font-size-13">4 KG left</p>
                            <p class="card-text">
                                <small class="text-white">(Recommend 10 KG)</small>
                            </p>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xl-3 col-lg-6 text-center">
                <a href="./?page=rawMaterial_manage&id=4">
                    <div class="card bg-warning">
                        <img class="card-img-top img-fluid" src="assets/images/team/team-1.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="mb-1 text-white">Oil</h5>
                            <p class="text-white font-size-13">20 Bottle left</p>
                            <p class="card-text">
                                <small class="text-white">(Recommend 200 Bottle)</small>
                            </p>
                        </div>
                    </div>
                </a>
            </div> -->
            <?PHP foreach ($materials as $material) {?>
            <?PHP
            $stmt = $pdo->prepare("SELECT * FROM unit WHERE id=:id");
            $stmt->execute([':id' => $material['unit_id']]);
            $units = $stmt->fetchAll();
            ?>
            <div class="col-xl-3 col-lg-6 text-center">
                <a href="./?page=rawMaterial_manage&id=<?PHP echo $material['id']?>">
                    <div class="card">
                        <?PHP if($material['image'] == null){?>
                            <img class="card-img-top img-fluid" src="https://fakeimg.pl/1920x1080/?text=<?PHP echo $material['name']?>">
                        <?PHP }else{?>
                            <img class="card-img-top img-fluid" src="./pictures/rawMaterial/<?PHP echo $material['id'] . '.' . $material['image']?>">
                        <?PHP }?>
                        <div class="card-body">
                            <h5 class="mb-1"><?PHP echo $material['name']?></h5>
                            <p class="text-muted font-size-13"><?PHP echo $material['balance'] . " " . $units[0]['unit']?></p>
                        </div>
                    </div> <!-- end card-->
                </a>
            </div> <!-- end col-->
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
$stmt = $pdo->prepare("SELECT * FROM material WHERE id=:id");
$stmt->execute([':id' => $_GET['id']]);
$material = $stmt->fetchAll();

$stmt = $pdo->prepare("SELECT * FROM unit WHERE id=:id");
$stmt->execute([':id' => $material[0]['unit_id']]);
$unit = $stmt->fetchAll();
?>

<div class="page-content">
    <div class="container-fluid">
        <div class="row mb-4">
            <div class="col-xl-6">
                <input type="file" class="dropify" data-height="250"
                    <?PHP if($material[0]['image'] != null){?>
                        data-default-file="./pictures/rawMaterial/<?PHP echo $material[0]['id'] . '.' . $material[0]['image']?>"
                    <?PHP }?>
                >
            </div> <!-- end col -->
            <div class="col-xl-6">
                <form id="quantityForm" action="./databases/rawMaterial/manage/addQuantity.php?material_id=<?PHP echo $material[0]['id']?>" method="POST">
                    <div class="form-group">
                        <label>Quantity</label>
                        <div class="input-group">
                            <input type="number" step="any" name="quantity" class="form-control" placeholder="Enter your Quantity" required>
                            <div class="input-group-append">
                                <button class="btn btn-dark" type="button"><?PHP echo $unit[0]['unit']?></button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Price / Unit</label>
                        <div class="input-group">
                            <input type="number" step="any" name="price" class="form-control" placeholder="Enter your Price / Unit" required>
                            <div class="input-group-append">
                                <button class="btn btn-dark" type="button">Baht / <?PHP echo $unit[0]['unit']?></button>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-success">Add</button>
                </form>

                <script>
                    $("#quantityForm").on("submit", function(e) {
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

        <?PHP
        $stmt = $pdo->prepare("SELECT * FROM material_quantity WHERE material_id=:material_id");
        $stmt->execute([':material_id' => $_GET["id"]]);
        $material_quantity = $stmt->fetchAll();
        ?>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <table id="basic-datatable" class="table dt-responsive nowrap">
                            <thead>
                                <tr>
                                    <th>Quantity</th>
                                    <th>Balance</th>
                                    <th>Price/Unit</th>
                                    <th>Date Added</th>
                                    <th>Manage</th>
                                </tr>
                            </thead>
                        
                            <tbody>
                                <?PHP foreach($material_quantity as $MQ){?>
                                <tr>
                                    <td><?PHP echo $MQ['quantity'] . " " . $unit[0]['unit']?></td>
                                    <td><?PHP echo $MQ['balance'] . " " . $unit[0]['unit']?></td>
                                    <td><?PHP echo $MQ['price']?> Baht</td>
                                    <td><?PHP echo changeDateTime($MQ['regDate']);?></td>
                                    <td>
                                        <?PHP if($MQ["quantity"] == $MQ["balance"]){?>
                                            <button class="btn btn-danger"><i class="mdi mdi-trash-can"></i></button>
                                        <?PHP }else{?>
                                            <button class="btn btn-warning text-white">Leftovers</button>
                                        <?PHP }?>
                                    </td>
                                </tr>
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
<?PHP }?>